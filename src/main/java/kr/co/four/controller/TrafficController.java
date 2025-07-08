package kr.co.four.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

@RestController
@RequestMapping("/traffic")
public class TrafficController {
    @GetMapping("/alert")
    public Map<String, Object> getTrafficAlert() {
        // 예시 데이터 (실제 구현 시 DB에서 조회)
        List<String> labels = Arrays.asList(
            "2024-04-01", "2024-04-02", "2024-04-03", "2024-04-04", "2024-04-05",
            "2024-04-06", "2024-04-07", "2024-04-08", "2024-04-09", "2024-04-10"
        );
        List<Integer> traffic = Arrays.asList(120, 130, 200, 180, 117, 150, 170, 220, 160, 210);

        List<Map<String, Object>> alerts = new ArrayList<>();
        for (int i = 1; i < traffic.size(); i++) {
            double change = ((traffic.get(i) - traffic.get(i-1)) * 100.0) / traffic.get(i-1);
            if (change >= 30.0) {
                Map<String, Object> alert = new HashMap<>();
                alert.put("date", labels.get(i));
                alert.put("type", "spike");
                alert.put("change", Math.round(change * 10.0) / 10.0);
                alerts.add(alert);
            } else if (change <= -30.0) {
                Map<String, Object> alert = new HashMap<>();
                alert.put("date", labels.get(i));
                alert.put("type", "drop");
                alert.put("change", Math.round(change * 10.0) / 10.0);
                alerts.add(alert);
            }
        }
        Map<String, Object> result = new HashMap<>();
        result.put("labels", labels);
        result.put("traffic", traffic);
        result.put("alerts", alerts);
        return result;
    }
} 