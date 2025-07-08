package kr.co.four.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CosmicController {
    private static final Logger logger = LoggerFactory.getLogger(CosmicController.class);
    private static final String NASA_API_KEY = "eoP6El4yf2kNeIyd3Eviq1QBAIilWgcibfsJV0XU";
    private static final String NASA_BASE_URL = "https://api.nasa.gov";

    // 캐시 변수 및 만료 시간 (10분)
    private static Map<String, Object> apodCache = null;
    private static long apodCacheTime = 0;
    private static Map<String, Object> neoCache = null;
    private static long neoCacheTime = 0;
    private static Map<String, Object> donkiCache = null;
    private static long donkiCacheTime = 0;
    private static Map<String, Object> epicCache = null;
    private static long epicCacheTime = 0;
    private static final long CACHE_DURATION = 10 * 60 * 1000; // 10분

    @RequestMapping(value = "/cosmic", method = RequestMethod.GET)
    public String cosmicExplorer(Model model) {
        logger.info("Cosmic Data Explorer 페이지 접속");
        model.addAttribute("pageTitle", "Cosmic Data Explorer");
        return "cosmic/explorer";
    }

    // APOD (Astronomy Picture of the Day)
    @RequestMapping(value = "/cosmic/apod", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAPOD() {
        long now = System.currentTimeMillis();
        if (apodCache != null && (now - apodCacheTime) < CACHE_DURATION) {
            return apodCache;
        }
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String urlString = NASA_BASE_URL + "/planetary/apod?api_key=" + NASA_API_KEY;
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();
            JSONObject jsonResponse = new JSONObject(response.toString());
            result.put("success", true);
            result.put("data", jsonResponse.toMap());
            apodCache = result;
            apodCacheTime = now;
        } catch (Exception e) {
            logger.error("NASA APOD API 호출 실패", e);
            result.put("success", false);
            result.put("error", e.getMessage());
        }
        return result;
    }

    // NEO Browse (Near Earth Objects)
    @RequestMapping(value = "/cosmic/neo", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getNEOBrowse() {
        long now = System.currentTimeMillis();
        if (neoCache != null && (now - neoCacheTime) < CACHE_DURATION) {
            return neoCache;
        }
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String urlString = NASA_BASE_URL + "/neo/rest/v1/neo/browse?api_key=" + NASA_API_KEY;
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();
            JSONObject jsonResponse = new JSONObject(response.toString());
            result.put("success", true);
            result.put("data", jsonResponse.toMap());
            neoCache = result;
            neoCacheTime = now;
        } catch (Exception e) {
            logger.error("NASA NEO Browse API 호출 실패", e);
            result.put("success", false);
            result.put("error", e.getMessage());
        }
        return result;
    }

    // DONKI Notifications (Space Weather)
    @RequestMapping(value = "/cosmic/donki", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDonkiNotifications(
            @RequestParam String startDate,
            @RequestParam String endDate) {
        long now = System.currentTimeMillis();
        String cacheKey = startDate + ":" + endDate;
        if (donkiCache != null && donkiCache.containsKey(cacheKey) && (now - donkiCacheTime) < CACHE_DURATION) {
            return (Map<String, Object>) donkiCache.get(cacheKey);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String urlString = NASA_BASE_URL + "/DONKI/notifications?startDate=" + startDate + "&endDate=" + endDate + "&type=all&api_key=" + NASA_API_KEY;
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();
            JSONArray jsonResponse = new JSONArray(response.toString());
            result.put("success", true);
            result.put("data", jsonResponse.toList());
            if (donkiCache == null) donkiCache = new HashMap<String, Object>();
            donkiCache.put(cacheKey, result);
            donkiCacheTime = now;
        } catch (Exception e) {
            logger.error("NASA DONKI API 호출 실패", e);
            result.put("success", false);
            result.put("error", e.getMessage());
        }
        return result;
    }

    // EPIC (Earth Polychromatic Imaging Camera) - 최근 이미지 목록
    @RequestMapping(value = "/cosmic/epic", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getEpicImages() {
        long now = System.currentTimeMillis();
        if (epicCache != null && (now - epicCacheTime) < CACHE_DURATION) {
            return epicCache;
        }
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String urlString = NASA_BASE_URL + "/EPIC/api/natural/images?api_key=" + NASA_API_KEY;
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();
            JSONArray jsonResponse = new JSONArray(response.toString());
            result.put("success", true);
            result.put("data", jsonResponse.toList());
            epicCache = result;
            epicCacheTime = now;
        } catch (Exception e) {
            logger.error("NASA EPIC API 호출 실패", e);
            result.put("success", false);
            result.put("error", e.getMessage());
        }
        return result;
    }
} 