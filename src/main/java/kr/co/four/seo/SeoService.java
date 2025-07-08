package kr.co.four.seo;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.net.URL;
import java.util.*;

public class SeoService {
    public static Map<String, Object> analyze(String url) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Map<String, String>> details = new LinkedHashMap<>();
        int pass = 0, warn = 0, fail = 0;
        int score = 0;
        try {
            boolean ssl = url.startsWith("https://");
            Document doc = Jsoup.connect(url).get();
            // 1. HTML 구조
            boolean hasDoctype = doc.childNode(0).nodeName().equals("#doctype");
            boolean hasHead = doc.head() != null;
            boolean hasBody = doc.body() != null;
            if (hasDoctype && hasHead && hasBody) {
                pass++;
                details.put("structure", status("pass", "정상적인 HTML5 구조입니다."));
            } else {
                fail++;
                details.put("structure", status("fail", "HTML5 doctype/head/body 구조를 확인하세요."));
            }
            // 2. Title 길이
            String title = doc.title();
            if (title.length() >= 30 && title.length() <= 60) {
                pass++;
                details.put("title", status("pass", "적절한 제목 길이입니다."));
            } else if (title.length() > 0) {
                warn++;
                details.put("title", status("warn", "제목 길이가 30~60자가 아닙니다."));
            } else {
                fail++;
                details.put("title", status("fail", "Title 태그가 없습니다."));
            }
            // 3. Meta Description
            Elements metaDesc = doc.select("meta[name=description]");
            String desc = metaDesc.isEmpty() ? "" : metaDesc.attr("content");
            if (desc.length() >= 120 && desc.length() <= 160) {
                pass++;
                details.put("meta", status("pass", "적절한 Meta Description입니다."));
            } else if (desc.length() > 0) {
                warn++;
                details.put("meta", status("warn", "Meta Description 길이가 120~160자가 아닙니다."));
            } else {
                fail++;
                details.put("meta", status("fail", "Meta Description이 없습니다."));
            }
            // 4. H1 유일성
            Elements h1s = doc.select("h1");
            if (h1s.size() == 1) {
                pass++;
                details.put("h1", status("pass", "H1 태그가 1개입니다."));
            } else if (h1s.size() > 1) {
                warn++;
                details.put("h1", status("warn", "H1 태그가 여러 개입니다."));
            } else {
                fail++;
                details.put("h1", status("fail", "H1 태그가 없습니다."));
            }
            // 5. 이미지 Alt
            Elements imgs = doc.select("img");
            long imgNoAlt = imgs.stream().filter(img -> !img.hasAttr("alt") || img.attr("alt").isEmpty()).count();
            if (imgs.size() == 0 || imgNoAlt == 0) {
                pass++;
                details.put("alt", status("pass", "모든 이미지에 alt 속성이 있습니다."));
            } else if (imgNoAlt < imgs.size()) {
                warn++;
                details.put("alt", status("warn", "일부 이미지에 alt 속성이 없습니다."));
            } else {
                fail++;
                details.put("alt", status("fail", "모든 이미지에 alt 속성이 없습니다."));
            }
            // 6. Open Graph
            Elements og = doc.select("meta[property^=og:]");
            if (!og.isEmpty()) {
                pass++;
                details.put("og", status("pass", "Open Graph 태그가 있습니다."));
            } else {
                warn++;
                details.put("og", status("warn", "Open Graph 태그가 없습니다."));
            }
            // 7. Canonical
            Elements canonical = doc.select("link[rel=canonical]");
            if (!canonical.isEmpty()) {
                pass++;
                details.put("canonical", status("pass", "Canonical 태그가 있습니다."));
            } else {
                warn++;
                details.put("canonical", status("warn", "Canonical 태그가 없습니다."));
            }
            // 8. lang
            String lang = doc.select("html").attr("lang");
            if (!lang.isEmpty()) {
                pass++;
                details.put("lang", status("pass", "페이지 언어가 지정되어 있습니다."));
            } else {
                warn++;
                details.put("lang", status("warn", "html lang 속성이 없습니다."));
            }
            // 9. viewport
            Elements viewport = doc.select("meta[name=viewport]");
            if (!viewport.isEmpty()) {
                pass++;
                details.put("viewport", status("pass", "Viewport 메타 태그가 있습니다."));
            } else {
                warn++;
                details.put("viewport", status("warn", "Viewport 메타 태그가 없습니다."));
            }
            // 10. SSL
            if (ssl) {
                pass++;
                details.put("ssl", status("pass", "SSL(https)로 서비스 중입니다."));
            } else {
                fail++;
                details.put("ssl", status("fail", "SSL(https)로 서비스되지 않습니다."));
            }
            score = pass * 10 + warn * 5;
        } catch (Exception e) {
            fail = 10;
            score = 0;
            details.clear();
            details.put("structure", status("fail", "URL을 불러오지 못했습니다."));
        }
        result.put("score", Math.min(score, 100));
        result.put("pass", pass);
        result.put("warn", warn);
        result.put("fail", fail);
        result.put("results", details);
        return result;
    }
    private static Map<String, String> status(String status, String advice) {
        Map<String, String> map = new HashMap<>();
        map.put("status", status);
        map.put("advice", advice);
        return map;
    }
} 