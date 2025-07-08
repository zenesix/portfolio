package kr.co.four.finance;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Service
public class FinanceService {
    
    private final OkHttpClient client = new OkHttpClient();
    private final Gson gson = new Gson();
    private final Random random = new Random();
    
    public List<FinanceDataVO> getGlobalStockData() {
        List<FinanceDataVO> stockList = new ArrayList<FinanceDataVO>();
        
        // 주요 글로벌 주식 심볼들
        String[] symbols = {
            "AAPL", "MSFT", "GOOGL", "AMZN", "TSLA", "META", "NVDA", "NFLX", 
            "JPM", "JNJ", "V", "PG", "UNH", "HD", "MA", "DIS", "PYPL", "BAC",
            "005930.KS", "000660.KS", "035420.KS", "051910.KS", "006400.KS", // 삼성전자, SK하이닉스, NAVER, LG화학, 삼성SDI
            "7203.T", "6758.T", "9984.T", "6861.T", "7974.T" // 도요타, 소니, 소프트뱅크, 키옥시아, 닌텐도
        };
        
        for (String symbol : symbols) {
            FinanceDataVO stock = generateMockStockData(symbol);
            stockList.add(stock);
        }
        
        return stockList;
    }
    
    public FinanceDataVO getStockDetail(String symbol) {
        FinanceDataVO stock = generateMockStockData(symbol);
        stock.setAiAnalysis(generateAIAnalysis(stock));
        return stock;
    }
    
    public List<FinanceDataVO> getMarketTrends() {
        List<FinanceDataVO> trends = new ArrayList<FinanceDataVO>();
        
        // 시장 트렌드 데이터 생성
        String[] sectors = {"Technology", "Healthcare", "Finance", "Consumer", "Energy", "Industrial"};
        
        for (String sector : sectors) {
            FinanceDataVO trend = new FinanceDataVO();
            trend.setSector(sector);
            trend.setChangePercent(random.nextDouble() * 10 - 5); // -5% ~ +5%
            trend.setVolume(random.nextLong() * 1000000);
            trend.setSentiment(getRandomSentiment());
            trend.setTrend(getRandomTrend());
            trends.add(trend);
        }
        
        return trends;
    }
    
    public JsonObject getEconomicIndicators() {
        JsonObject indicators = new JsonObject();
        
        // 경제 지표 데이터
        indicators.addProperty("gdp_growth", 2.5 + random.nextDouble() * 2);
        indicators.addProperty("inflation_rate", 2.0 + random.nextDouble() * 3);
        indicators.addProperty("unemployment_rate", 3.5 + random.nextDouble() * 2);
        indicators.addProperty("interest_rate", 4.5 + random.nextDouble() * 2);
        indicators.addProperty("consumer_confidence", 70 + random.nextDouble() * 30);
        indicators.addProperty("manufacturing_pmi", 50 + random.nextDouble() * 10);
        
        return indicators;
    }
    
    public JsonObject getCurrencyRates() {
        JsonObject rates = new JsonObject();
        
        // 환율 데이터
        rates.addProperty("USD_KRW", 1300 + random.nextDouble() * 100);
        rates.addProperty("EUR_USD", 1.05 + random.nextDouble() * 0.1);
        rates.addProperty("USD_JPY", 140 + random.nextDouble() * 10);
        rates.addProperty("GBP_USD", 1.25 + random.nextDouble() * 0.1);
        rates.addProperty("USD_CNY", 7.2 + random.nextDouble() * 0.3);
        
        return rates;
    }
    
    private FinanceDataVO generateMockStockData(String symbol) {
        FinanceDataVO stock = new FinanceDataVO();
        stock.setSymbol(symbol);
        stock.setCompanyName(getCompanyName(symbol));
        stock.setCurrentPrice(100 + random.nextDouble() * 900);
        stock.setChange(random.nextDouble() * 20 - 10);
        stock.setChangePercent(random.nextDouble() * 10 - 5);
        stock.setHigh(stock.getCurrentPrice() * (1 + random.nextDouble() * 0.1));
        stock.setLow(stock.getCurrentPrice() * (1 - random.nextDouble() * 0.1));
        stock.setVolume(random.nextLong() * 10000000);
        stock.setMarketCap(random.nextDouble() * 1000000000000L);
        stock.setSector(getRandomSector());
        stock.setExchange(getExchange(symbol));
        stock.setLastUpdated(new Date().toString());
        stock.setPeRatio(10 + random.nextDouble() * 30);
        stock.setDividendYield(random.nextDouble() * 5);
        stock.setFiftyTwoWeekHigh(stock.getCurrentPrice() * 1.5);
        stock.setFiftyTwoWeekLow(stock.getCurrentPrice() * 0.7);
        stock.setCurrency(getCurrency(symbol));
        stock.setCountry(getCountry(symbol));
        stock.setIndustry(getRandomIndustry());
        stock.setEps(random.nextDouble() * 10);
        stock.setBookValue(random.nextDouble() * 100);
        stock.setPriceToBook(random.nextDouble() * 5);
        stock.setDebtToEquity(random.nextDouble() * 2);
        stock.setReturnOnEquity(random.nextDouble() * 25);
        stock.setProfitMargin(random.nextDouble() * 20);
        stock.setOperatingMargin(random.nextDouble() * 25);
        stock.setRevenueGrowth(random.nextDouble() * 30 - 10);
        stock.setEarningsGrowth(random.nextDouble() * 40 - 20);
        stock.setRecommendation(getRandomRecommendation());
        stock.setTargetPrice(stock.getCurrentPrice() * (1 + random.nextDouble() * 0.3 - 0.15));
        stock.setAnalystCount(10 + random.nextInt(20));
        stock.setRiskLevel(getRandomRiskLevel());
        stock.setVolatility(getRandomVolatility());
        stock.setTrend(getRandomTrend());
        stock.setSentiment(getRandomSentiment());
        stock.setAiScore(50 + random.nextDouble() * 50);
        stock.setAiRecommendation(getAIRecommendation(stock.getAiScore()));
        
        return stock;
    }
    
    private String generateAIAnalysis(FinanceDataVO stock) {
        StringBuilder analysis = new StringBuilder();
        
        analysis.append("AI 분석 결과:\n\n");
        
        // 기술적 분석
        if (stock.getChangePercent() > 0) {
            analysis.append("📈 기술적 지표: 상승 모멘텀 확인. 이동평균선 상향 돌파로 단기 상승 추세 지속 예상.\n");
        } else {
            analysis.append("📉 기술적 지표: 하락 압박 존재. 지지선 테스트 중이며, 추가 하락 가능성 있음.\n");
        }
        
        // 기본적 분석
        if (stock.getPeRatio() < 15) {
            analysis.append("💰 기본적 분석: 낮은 P/E 비율로 밸류에이션 매력적. 성장성 대비 저평가 상태.\n");
        } else if (stock.getPeRatio() > 25) {
            analysis.append("⚠️ 기본적 분석: 높은 P/E 비율로 프리미엄 상태. 수익성 개선 필요.\n");
        }
        
        // 리스크 분석
        if (stock.getDebtToEquity() > 1.0) {
            analysis.append("🔴 리스크: 높은 부채비율로 재무 건전성 주의 필요.\n");
        } else {
            analysis.append("🟢 리스크: 건전한 재무구조로 안정적 운영 기대.\n");
        }
        
        // AI 예측
        if (stock.getAiScore() > 70) {
            analysis.append("🤖 AI 예측: 강력한 매수 신호. 6개월 내 15-25% 상승 예상.\n");
        } else if (stock.getAiScore() > 50) {
            analysis.append("🤖 AI 예측: 중립적 관망. 시장 변동성에 따른 포지션 조정 권장.\n");
        } else {
            analysis.append("🤖 AI 예측: 매도 신호 감지. 리스크 관리 차원에서 포지션 축소 고려.\n");
        }
        
        return analysis.toString();
    }
    
    private String getCompanyName(String symbol) {
        if ("AAPL".equals(symbol)) return "Apple Inc.";
        if ("MSFT".equals(symbol)) return "Microsoft Corporation";
        if ("GOOGL".equals(symbol)) return "Alphabet Inc.";
        if ("AMZN".equals(symbol)) return "Amazon.com Inc.";
        if ("TSLA".equals(symbol)) return "Tesla Inc.";
        if ("META".equals(symbol)) return "Meta Platforms Inc.";
        if ("NVDA".equals(symbol)) return "NVIDIA Corporation";
        if ("005930.KS".equals(symbol)) return "Samsung Electronics Co., Ltd.";
        if ("000660.KS".equals(symbol)) return "SK Hynix Inc.";
        if ("035420.KS".equals(symbol)) return "NAVER Corporation";
        if ("7203.T".equals(symbol)) return "Toyota Motor Corporation";
        if ("6758.T".equals(symbol)) return "Sony Group Corporation";
        return "Unknown Company";
    }
    
    private String getExchange(String symbol) {
        if (symbol.endsWith(".KS")) return "KOSPI";
        if (symbol.endsWith(".T")) return "Tokyo Stock Exchange";
        return "NASDAQ";
    }
    
    private String getCurrency(String symbol) {
        if (symbol.endsWith(".KS")) return "KRW";
        if (symbol.endsWith(".T")) return "JPY";
        return "USD";
    }
    
    private String getCountry(String symbol) {
        if (symbol.endsWith(".KS")) return "South Korea";
        if (symbol.endsWith(".T")) return "Japan";
        return "United States";
    }
    
    private String getRandomSector() {
        String[] sectors = {"Technology", "Healthcare", "Finance", "Consumer Discretionary", 
                          "Energy", "Industrial", "Materials", "Real Estate", "Utilities", "Communication Services"};
        return sectors[random.nextInt(sectors.length)];
    }
    
    private String getRandomIndustry() {
        String[] industries = {"Software", "Semiconductors", "Biotechnology", "Banking", 
                             "Retail", "Oil & Gas", "Manufacturing", "Mining", "Real Estate", "Telecommunications"};
        return industries[random.nextInt(industries.length)];
    }
    
    private String getRandomRecommendation() {
        String[] recommendations = {"Strong Buy", "Buy", "Hold", "Sell", "Strong Sell"};
        return recommendations[random.nextInt(recommendations.length)];
    }
    
    private String getRandomRiskLevel() {
        String[] riskLevels = {"Low", "Medium", "High", "Very High"};
        return riskLevels[random.nextInt(riskLevels.length)];
    }
    
    private String getRandomVolatility() {
        String[] volatilities = {"Low", "Medium", "High"};
        return volatilities[random.nextInt(volatilities.length)];
    }
    
    private String getRandomTrend() {
        String[] trends = {"Bullish", "Bearish", "Sideways"};
        return trends[random.nextInt(trends.length)];
    }
    
    private String getRandomSentiment() {
        String[] sentiments = {"Positive", "Neutral", "Negative"};
        return sentiments[random.nextInt(sentiments.length)];
    }
    
    private String getAIRecommendation(double aiScore) {
        if (aiScore >= 80) return "Strong Buy";
        if (aiScore >= 60) return "Buy";
        if (aiScore >= 40) return "Hold";
        if (aiScore >= 20) return "Sell";
        return "Strong Sell";
    }
} 