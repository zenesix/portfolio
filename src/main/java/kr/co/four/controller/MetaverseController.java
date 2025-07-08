package kr.co.four.controller;

import org.json.JSONObject;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MetaverseController {
    private static final Logger logger = LoggerFactory.getLogger(MetaverseController.class);
    // Hugging Face Demo API Key (공개, 느릴 수 있음)
    private static final String HF_API_KEY = "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";
    private static final String HF_API_URL = "https://api-inference.huggingface.co/models/HuggingFaceH4/zephyr-7b-beta";

    @RequestMapping(value = "/metaverse", method = RequestMethod.GET)
    public String metaversePage(Model model) {
        model.addAttribute("pageTitle", "AI 아바타 메타버스");
        return "metaverse/metaverse";
    }

    @RequestMapping(value = "/metaverse/chat", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> chatWithAI(@RequestBody Map<String, String> payload) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String userMessage = payload.get("message");
            URL url = new URL(HF_API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + HF_API_KEY);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            // 입력 포맷: {"inputs": "질문"}
            JSONObject body = new JSONObject();
            String prompt = "너는 친절한 AI 아바타야. 반드시 한국어로, 아주 짧고 간결하게 한두 문장으로만 답해줘. 영어 질문도 한국어로 짧게 요약해서 답해줘.\n\n질문: " + userMessage + "\n답변:";
            body.put("inputs", prompt);

            OutputStream os = conn.getOutputStream();
            os.write(body.toString().getBytes("UTF-8"));
            os.flush();
            os.close();

            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // 응답 파싱
            JSONArray arr = new JSONArray(response.toString());
            String aiMessage = "";
            if (arr.length() > 0) {
                JSONObject obj = arr.getJSONObject(0);
                aiMessage = obj.optString("generated_text", "");
            }
            result.put("success", true);
            result.put("answer", aiMessage);
        } catch (Exception e) {
            logger.error("Hugging Face API 호출 실패", e);
            result.put("success", false);
            result.put("error", e.getMessage());
        }
        return result;
    }
} 