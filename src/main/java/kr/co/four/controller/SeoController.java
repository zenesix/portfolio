package kr.co.four.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/seo")
public class SeoController {

    @RequestMapping(value = "/check", method = RequestMethod.POST, consumes = "application/json")
    @ResponseBody
    public Map<String, Object> checkSeo(@RequestBody Map<String, String> payload) {
        String url = payload.get("url");
        Map<String, Object> response = new HashMap<>();
        Map<String, Map<String, String>> results = new HashMap<>();
        int pass = 0;
        int warn = 0;
        int fail = 0;

        try {
            Document doc = Jsoup.connect(url).get();

            // 1. HTML structure
            results.put("structure", checkStructure(doc));

            // 2. Title tag
            results.put("title", checkTitle(doc));

            // 3. Meta description
            results.put("meta", checkMetaDescription(doc));

            // 4. H1 tag
            results.put("h1", checkH1Tag(doc));

            // 5. Alt attributes
            results.put("alt", checkAltAttributes(doc));

            // 6. Open Graph tags
            results.put("og", checkOgTags(doc));

            // 7. Canonical tag
            results.put("canonical", checkCanonical(doc));
            
            // 8. lang attribute
            results.put("lang", checkLang(doc));

            // 9. Viewport meta tag
            results.put("viewport", checkViewport(doc));

            // 10. SSL
            results.put("ssl", checkSsl(url));


            for (Map<String, String> result : results.values()) {
                switch (result.get("status")) {
                    case "pass":
                        pass++;
                        break;
                    case "warn":
                        warn++;
                        break;
                    case "fail":
                        fail++;
                        break;
                }
            }

            int total = pass + warn + fail;
            int score = (total > 0) ? (int) Math.round(((double) pass / total) * 100) : 0;

            response.put("results", results);
            response.put("score", score);
            response.put("pass", pass);
            response.put("warn", warn);
            response.put("fail", fail);

        } catch (IOException e) {
            response.put("error", "Failed to fetch URL: " + e.getMessage());
        }

        return response;
    }

    private Map<String, String> checkStructure(Document doc) {
        Map<String, String> result = new HashMap<>();
        if (doc.children().size() > 0 && doc.child(0).tagName().equals("html") && doc.head() != null && doc.body() != null) {
            result.put("status", "pass");
            result.put("advice", "HTML 구조가 유효합니다.");
        } else {
            result.put("status", "fail");
            result.put("advice", "HTML 구조가 유효하지 않습니다.");
        }
        return result;
    }

    private Map<String, String> checkTitle(Document doc) {
        Map<String, String> result = new HashMap<>();
        String title = doc.title();
        if (title.length() >= 30 && title.length() <= 60) {
            result.put("status", "pass");
            result.put("advice", "Title 태그 길이가 적절합니다 (" + title.length() + "자).");
        } else {
            result.put("status", "fail");
            result.put("advice", "Title 태그 길이가 너무 길거나 짧습니다 (" + title.length() + "자). 30-60자 사이를 권장합니다.");
        }
        return result;
    }

    private Map<String, String> checkMetaDescription(Document doc) {
        Map<String, String> result = new HashMap<>();
        Elements metaDesc = doc.select("meta[name=description]");
        if (metaDesc.size() > 0) {
            String content = metaDesc.first().attr("content");
            if (content.length() >= 120 && content.length() <= 160) {
                result.put("status", "pass");
                result.put("advice", "Meta Description 길이가 적절합니다 (" + content.length() + "자).");
            } else {
                result.put("status", "fail");
                result.put("advice", "Meta Description 길이가 너무 길거나 짧습니다 (" + content.length() + "자). 120-160자 사이를 권장합니다.");
            }
        } else {
            result.put("status", "fail");
            result.put("advice", "Meta Description이 없습니다.");
        }
        return result;
    }

    private Map<String, String> checkH1Tag(Document doc) {
        Map<String, String> result = new HashMap<>();
        Elements h1s = doc.select("h1");
        if (h1s.size() == 1) {
            result.put("status", "pass");
            result.put("advice", "H1 태그가 1개 존재합니다.");
        } else {
            result.put("status", "fail");
            result.put("advice", "H1 태그가 없거나 2개 이상입니다 (" + h1s.size() + "개).");
        }
        return result;
    }

    private Map<String, String> checkAltAttributes(Document doc) {
        Map<String, String> result = new HashMap<>();
        Elements images = doc.select("img");
        int missingAlt = 0;
        for (Element img : images) {
            if (!img.hasAttr("alt") || img.attr("alt").isEmpty()) {
                missingAlt++;
            }
        }
        if (missingAlt == 0) {
            result.put("status", "pass");
            result.put("advice", "모든 이미지에 Alt 속성이 있습니다.");
        } else {
            result.put("status", "fail");
            result.put("advice", missingAlt + "개의 이미지에 Alt 속성이 없습니다.");
        }
        return result;
    }

    private Map<String, String> checkOgTags(Document doc) {
        Map<String, String> result = new HashMap<>();
        Elements ogTitle = doc.select("meta[property=og:title]");
        Elements ogDescription = doc.select("meta[property=og:description]");
        Elements ogImage = doc.select("meta[property=og:image]");
        if (ogTitle.size() > 0 && ogDescription.size() > 0 && ogImage.size() > 0) {
            result.put("status", "pass");
            result.put("advice", "Open Graph 태그가 잘 설정되어 있습니다.");
        } else {
            result.put("status", "warn");
            result.put("advice", "일부 Open Graph 태그가 없습니다. (title, description, image)");
        }
        return result;
    }

    private Map<String, String> checkCanonical(Document doc) {
        Map<String, String> result = new HashMap<>();
        Elements canonical = doc.select("link[rel=canonical]");
        if (canonical.size() > 0) {
            result.put("status", "pass");
            result.put("advice", "Canonical 태그가 있습니다.");
        } else {
            result.put("status", "warn");
            result.put("advice", "Canonical 태그가 없습니다. 중복 콘텐츠의 경우 문제가 될 수 있습니다.");
        }
        return result;
    }
    
    private Map<String, String> checkLang(Document doc) {
        Map<String, String> result = new HashMap<>();
        String lang = doc.select("html").attr("lang");
        if (lang != null && !lang.isEmpty()) {
            result.put("status", "pass");
            result.put("advice", "HTML lang 속성이 '" + lang + "'으로 설정되어 있습니다.");
        } else {
            result.put("status", "warn");
            result.put("advice", "HTML lang 속성이 설정되지 않았습니다.");
        }
        return result;
    }

    private Map<String, String> checkViewport(Document doc) {
        Map<String, String> result = new HashMap<>();
        Elements viewport = doc.select("meta[name=viewport]");
        if (viewport.size() > 0) {
            result.put("status", "pass");
            result.put("advice", "Viewport 메타 태그가 있습니다.");
        } else {
            result.put("status", "fail");
            result.put("advice", "Viewport 메타 태그가 없어 모바일 친화적이지 않을 수 있습니다.");
        }
        return result;
    }

    private Map<String, String> checkSsl(String url) {
        Map<String, String> result = new HashMap<>();
        if (url.startsWith("https://")) {
            result.put("status", "pass");
            result.put("advice", "SSL(HTTPS)이 적용되어 있습니다.");
        } else {
            result.put("status", "fail");
            result.put("advice", "SSL(HTTPS)이 적용되지 않았습니다.");
        }
        return result;
    }
}