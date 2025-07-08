package kr.co.four.crypto;

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
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Service
public class CryptoService {
    
    private final OkHttpClient client = new OkHttpClient();
    private final Gson gson = new Gson();
    private final Random random = new Random();
    
    // Top 100 암호화폐 데이터 생성
    public List<CryptoDataVO> getTopCoins() {
        List<CryptoDataVO> coinList = new ArrayList<CryptoDataVO>();
        OkHttpClient client = new OkHttpClient();
        String url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false";
        Request request = new Request.Builder().url(url).build();

        Response response = null;
        try {
            response = client.newCall(request).execute();
            if (response.isSuccessful() && response.body() != null) {
                String json = response.body().string();
                JsonArray arr = JsonParser.parseString(json).getAsJsonArray();
                for (int i = 0; i < arr.size(); i++) {
                    JsonObject obj = arr.get(i).getAsJsonObject();
                    CryptoDataVO coin = new CryptoDataVO();
                    coin.setSymbol(obj.get("symbol").getAsString().toUpperCase());
                    coin.setName(obj.get("name").getAsString());
                    coin.setCurrentPrice(obj.get("current_price").getAsDouble());
                    coin.setMarketCap(obj.get("market_cap").getAsDouble());
                    coin.setChangePercent24h(obj.get("price_change_percentage_24h").isJsonNull() ? 0 : obj.get("price_change_percentage_24h").getAsDouble());
                    coin.setImageUrl(obj.get("image").getAsString());
                    coin.setRank(String.valueOf(obj.get("market_cap_rank").getAsInt()));
                    coin.setVolume24h(obj.get("total_volume").getAsDouble());
                    coinList.add(coin);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response != null) {
                response.close();
            }
        }
        return coinList;
    }
    
    public List<CryptoDataVO> getTrendingCoins() {
        // CoinGecko trending API 사용 (가능한 경우)
        List<CryptoDataVO> trendingList = new ArrayList<CryptoDataVO>();
        OkHttpClient client = new OkHttpClient();
        Response response = null;
        try {
            String url = "https://api.coingecko.com/api/v3/search/trending";
            Request request = new Request.Builder().url(url).build();
            response = client.newCall(request).execute();
            if (response.isSuccessful() && response.body() != null) {
                String json = response.body().string();
                JsonObject obj = JsonParser.parseString(json).getAsJsonObject();
                if (obj.has("coins")) {
                    JsonArray arr = obj.getAsJsonArray("coins");
                    for (int i = 0; i < arr.size(); i++) {
                        JsonObject item = arr.get(i).getAsJsonObject().getAsJsonObject("item");
                        CryptoDataVO coin = new CryptoDataVO();
                        coin.setSymbol(item.get("symbol").getAsString().toUpperCase());
                        coin.setName(item.get("name").getAsString());
                        coin.setRank(String.valueOf(item.get("market_cap_rank").isJsonNull() ? 0 : item.get("market_cap_rank").getAsInt()));
                        coin.setImageUrl(item.get("large").getAsString());
                        trendingList.add(coin);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response != null) {
                response.close();
            }
        }
        return trendingList;
    }
    
    public JsonObject getMarketOverview() {
        JsonObject overview = new JsonObject();
        OkHttpClient client = new OkHttpClient();
        Response response = null;
        try {
            // 1. CoinGecko 글로벌 마켓 데이터
            String url = "https://api.coingecko.com/api/v3/global";
            Request request = new Request.Builder().url(url).build();
            response = client.newCall(request).execute();
            if (response.isSuccessful() && response.body() != null) {
                String json = response.body().string();
                JsonObject obj = JsonParser.parseString(json).getAsJsonObject();
                JsonObject data = obj.getAsJsonObject("data");
                if (data != null) {
                    JsonObject totalMarketCap = data.getAsJsonObject("total_market_cap");
                    JsonObject totalVolume = data.getAsJsonObject("total_volume");
                    JsonObject marketCapPercentage = data.getAsJsonObject("market_cap_percentage");
                    overview.addProperty("total_market_cap", totalMarketCap.get("usd").getAsDouble());
                    overview.addProperty("total_volume_24h", totalVolume.get("usd").getAsDouble());
                    overview.addProperty("bitcoin_dominance", marketCapPercentage.get("btc").getAsDouble());
                    overview.addProperty("market_cap_change_24h", data.get("market_cap_change_percentage_24h_usd").getAsDouble());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response != null) {
                response.close();
            }
        }
        // 2. Fear & Greed Index (alternative.me)
        OkHttpClient client2 = new OkHttpClient();
        Response response2 = null;
        try {
            String url2 = "https://api.alternative.me/fng/";
            Request request2 = new Request.Builder().url(url2).build();
            response2 = client2.newCall(request2).execute();
            if (response2.isSuccessful() && response2.body() != null) {
                String json2 = response2.body().string();
                JsonObject obj2 = JsonParser.parseString(json2).getAsJsonObject();
                if (obj2.has("data")) {
                    JsonArray arr = obj2.getAsJsonArray("data");
                    if (arr.size() > 0) {
                        JsonObject fng = arr.get(0).getAsJsonObject();
                        overview.addProperty("fear_greed_index", fng.get("value").getAsInt());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response2 != null) {
                response2.close();
            }
        }
        return overview;
    }
    
    public List<CryptoDataVO> getGainersAndLosers() {
        // getTopCoins()에서 24h 변동률로 분류
        List<CryptoDataVO> allCoins = getTopCoins();
        List<CryptoDataVO> gainersLosers = new ArrayList<CryptoDataVO>();
        // Top 5 Gainers
        int gainersCount = 0;
        for (int i = 0; i < allCoins.size() && gainersCount < 5; i++) {
            CryptoDataVO coin = allCoins.get(i);
            if (coin.getChangePercent24h() > 0) {
                gainersLosers.add(coin);
                gainersCount++;
            }
        }
        // Top 5 Losers
        int losersCount = 0;
        for (int i = 0; i < allCoins.size() && losersCount < 5; i++) {
            CryptoDataVO coin = allCoins.get(i);
            if (coin.getChangePercent24h() < 0) {
                gainersLosers.add(coin);
                losersCount++;
            }
        }
        return gainersLosers;
    }
    
    public List<CryptoDataVO> getAllCoins(String sortBy, String order) {
        return getTopCoins(); // 간단히 top coins 반환
    }
    
    public CryptoDataVO getCoinDetail(String symbol) {
        OkHttpClient client = new OkHttpClient();
        Response response = null;
        CryptoDataVO coin = null;
        try {
            String url = "https://api.coingecko.com/api/v3/coins/" + symbol.toLowerCase();
            Request request = new Request.Builder().url(url).build();
            response = client.newCall(request).execute();
            if (response.isSuccessful() && response.body() != null) {
                String json = response.body().string();
                JsonObject obj = JsonParser.parseString(json).getAsJsonObject();
                coin = new CryptoDataVO();
                coin.setSymbol(obj.get("symbol").getAsString().toUpperCase());
                coin.setName(obj.get("name").getAsString());
                coin.setCurrentPrice(obj.getAsJsonObject("market_data").getAsJsonObject("current_price").get("usd").getAsDouble());
                coin.setMarketCap(obj.getAsJsonObject("market_data").getAsJsonObject("market_cap").get("usd").getAsDouble());
                coin.setChangePercent24h(obj.getAsJsonObject("market_data").get("price_change_percentage_24h").getAsDouble());
                coin.setImageUrl(obj.getAsJsonObject("image").get("large").getAsString());
                coin.setRank(String.valueOf(obj.get("market_cap_rank").getAsInt()));
                coin.setVolume24h(obj.getAsJsonObject("market_data").getAsJsonObject("total_volume").get("usd").getAsDouble());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response != null) response.close();
        }
        return coin;
    }
    
    public List<CryptoDataVO> getSimilarCoins(String symbol) {
        List<CryptoDataVO> similar = new ArrayList<CryptoDataVO>();
        String[] similarSymbols = {"ETH", "BNB", "SOL", "ADA", "DOT"};
        
        for (String sym : similarSymbols) {
            if (!sym.equals(symbol)) {
                similar.add(generateMockCryptoData(sym, random.nextInt(20) + 1));
            }
        }
        
        return similar;
    }
    
    public JsonObject getTechnicalAnalysis(String symbol) {
        JsonObject analysis = new JsonObject();
        
        // 기술적 지표 계산
        analysis.addProperty("rsi", 30 + random.nextDouble() * 40);
        analysis.addProperty("macd", -2 + random.nextDouble() * 4);
        analysis.addProperty("macd_signal", -1.5 + random.nextDouble() * 3);
        analysis.addProperty("macd_histogram", -0.5 + random.nextDouble() * 1);
        analysis.addProperty("bollinger_upper", 50000 + random.nextDouble() * 10000);
        analysis.addProperty("bollinger_middle", 45000 + random.nextDouble() * 8000);
        analysis.addProperty("bollinger_lower", 40000 + random.nextDouble() * 6000);
        analysis.addProperty("sma_20", 44000 + random.nextDouble() * 8000);
        analysis.addProperty("sma_50", 43000 + random.nextDouble() * 7000);
        analysis.addProperty("sma_200", 42000 + random.nextDouble() * 6000);
        analysis.addProperty("ema_12", 44500 + random.nextDouble() * 8000);
        analysis.addProperty("ema_26", 43500 + random.nextDouble() * 7000);
        analysis.addProperty("stoch_k", 20 + random.nextDouble() * 60);
        analysis.addProperty("stoch_d", 25 + random.nextDouble() * 55);
        analysis.addProperty("atr", 2000 + random.nextDouble() * 1000);
        analysis.addProperty("adx", 15 + random.nextDouble() * 25);
        analysis.addProperty("cci", -100 + random.nextDouble() * 200);
        analysis.addProperty("williams_r", -80 + random.nextDouble() * 40);
        
        // 신호 생성
        String[] signals = {"Strong Buy", "Buy", "Neutral", "Sell", "Strong Sell"};
        analysis.addProperty("overall_signal", signals[random.nextInt(signals.length)]);
        analysis.addProperty("signal_strength", 1 + random.nextDouble() * 4);
        
        return analysis;
    }
    
    public JsonObject getAIAnalysis(String symbol) {
        JsonObject aiAnalysis = new JsonObject();
        
        // AI 분석 결과
        aiAnalysis.addProperty("ai_score", 30 + random.nextDouble() * 70);
        aiAnalysis.addProperty("ai_confidence", 60 + random.nextDouble() * 40);
        aiAnalysis.addProperty("sentiment_score", -1 + random.nextDouble() * 2);
        aiAnalysis.addProperty("prediction_accuracy", 70 + random.nextDouble() * 25);
        
        String[] recommendations = {"Strong Buy", "Buy", "Hold", "Sell", "Strong Sell"};
        aiAnalysis.addProperty("recommendation", recommendations[random.nextInt(recommendations.length)]);
        
        String[] sentiments = {"Very Bullish", "Bullish", "Neutral", "Bearish", "Very Bearish"};
        aiAnalysis.addProperty("sentiment", sentiments[random.nextInt(sentiments.length)]);
        
        String[] trends = {"Strong Uptrend", "Uptrend", "Sideways", "Downtrend", "Strong Downtrend"};
        aiAnalysis.addProperty("trend", trends[random.nextInt(trends.length)]);
        
        String[] riskLevels = {"Very Low", "Low", "Medium", "High", "Very High"};
        aiAnalysis.addProperty("risk_level", riskLevels[random.nextInt(riskLevels.length)]);
        
        // 예측 가격
        double currentPrice = 45000 + random.nextDouble() * 10000;
        aiAnalysis.addProperty("current_price", currentPrice);
        aiAnalysis.addProperty("target_price_1m", currentPrice * (0.9 + random.nextDouble() * 0.3));
        aiAnalysis.addProperty("target_price_3m", currentPrice * (0.8 + random.nextDouble() * 0.5));
        aiAnalysis.addProperty("target_price_6m", currentPrice * (0.7 + random.nextDouble() * 0.8));
        aiAnalysis.addProperty("target_price_1y", currentPrice * (0.6 + random.nextDouble() * 1.2));
        
        return aiAnalysis;
    }
    
    public List<CryptoDataVO> getPortfolio() {
        List<CryptoDataVO> portfolio = new ArrayList<CryptoDataVO>();
        
        String[] portfolioSymbols = {"BTC", "ETH", "BNB", "ADA", "SOL"};
        double totalValue = 0;
        
        for (String symbol : portfolioSymbols) {
            CryptoDataVO coin = generateMockCryptoData(symbol, random.nextInt(20) + 1);
            coin.setQuantity(1 + random.nextDouble() * 10);
            coin.setAvgBuyPrice(coin.getCurrentPrice() * (0.8 + random.nextDouble() * 0.4));
            coin.setTotalValue(coin.getQuantity() * coin.getCurrentPrice());
            coin.setUnrealizedPnL(coin.getTotalValue() - (coin.getQuantity() * coin.getAvgBuyPrice()));
            totalValue += coin.getTotalValue();
            portfolio.add(coin);
        }
        
        // Allocation 계산
        for (CryptoDataVO coin : portfolio) {
            coin.setAllocation((coin.getTotalValue() / totalValue) * 100);
        }
        
        return portfolio;
    }
    
    public JsonObject getPortfolioStats() {
        JsonObject stats = new JsonObject();
        
        stats.addProperty("total_value", 125000 + random.nextDouble() * 50000);
        stats.addProperty("total_invested", 100000 + random.nextDouble() * 30000);
        stats.addProperty("total_pnl", 25000 + random.nextDouble() * 20000);
        stats.addProperty("total_pnl_percent", 20 + random.nextDouble() * 15);
        stats.addProperty("unrealized_pnl", 15000 + random.nextDouble() * 10000);
        stats.addProperty("realized_pnl", 10000 + random.nextDouble() * 5000);
        stats.addProperty("daily_pnl", 500 + random.nextDouble() * 2000 - 1000);
        stats.addProperty("daily_pnl_percent", 2 + random.nextDouble() * 6 - 3);
        
        return stats;
    }
    
    public List<CryptoDataVO> getPortfolioRecommendations() {
        List<CryptoDataVO> recommendations = new ArrayList<CryptoDataVO>();
        
        String[] recSymbols = {"MATIC", "LINK", "UNI", "AVAX", "DOT"};
        
        for (String symbol : recSymbols) {
            CryptoDataVO coin = generateMockCryptoData(symbol, random.nextInt(30) + 1);
            coin.setAiScore(70 + random.nextDouble() * 30);
            coin.setAiRecommendation("Buy");
            recommendations.add(coin);
        }
        
        return recommendations;
    }
    
    public List<CryptoDataVO> getMarketAnalysis() {
        List<CryptoDataVO> analysis = new ArrayList<CryptoDataVO>();
        
        String[] sectors = {"DeFi", "Gaming", "Layer 1", "Layer 2", "Meme", "Privacy", "AI/ML"};
        
        for (String sector : sectors) {
            CryptoDataVO coin = new CryptoDataVO();
            coin.setName(sector);
            coin.setChangePercent24h(-10 + random.nextDouble() * 20);
            coin.setMarketCap(1000000000L + random.nextLong() * 50000000000L);
            coin.setVolume24h(10000000L + random.nextLong() * 1000000000L);
            analysis.add(coin);
        }
        
        return analysis;
    }
    
    public JsonObject getSentimentAnalysis() {
        JsonObject sentiment = new JsonObject();
        
        sentiment.addProperty("overall_sentiment", "Bullish");
        sentiment.addProperty("sentiment_score", 0.65 + random.nextDouble() * 0.3);
        sentiment.addProperty("social_volume", 1000000 + random.nextInt(500000));
        sentiment.addProperty("news_sentiment", 0.6 + random.nextDouble() * 0.3);
        sentiment.addProperty("reddit_sentiment", 0.7 + random.nextDouble() * 0.2);
        sentiment.addProperty("twitter_sentiment", 0.55 + random.nextDouble() * 0.35);
        sentiment.addProperty("telegram_sentiment", 0.8 + random.nextDouble() * 0.15);
        
        return sentiment;
    }
    
    public List<CryptoDataVO> getAIPredictions() {
        List<CryptoDataVO> predictions = new ArrayList<CryptoDataVO>();
        
        String[] predSymbols = {"BTC", "ETH", "BNB", "SOL", "ADA"};
        
        for (String symbol : predSymbols) {
            CryptoDataVO coin = generateMockCryptoData(symbol, random.nextInt(10) + 1);
            coin.setAiTargetPrice(coin.getCurrentPrice() * (0.8 + random.nextDouble() * 0.6));
            coin.setAiConfidence(70 + random.nextDouble() * 30);
            coin.setAiPrediction("Bullish");
            predictions.add(coin);
        }
        
        return predictions;
    }
    
    public List<CryptoDataVO> getDeFiProtocols() {
        List<CryptoDataVO> protocols = new ArrayList<CryptoDataVO>();
        
        String[] protocolNames = {"Uniswap", "Aave", "Compound", "MakerDAO", "Curve", "SushiSwap", "PancakeSwap", "1inch"};
        
        for (String name : protocolNames) {
            CryptoDataVO protocol = new CryptoDataVO();
            protocol.setName(name);
            protocol.setTvl(100000000L + random.nextLong() * 10000000000L);
            protocol.setApy(5 + random.nextDouble() * 25);
            protocol.setVolume24h(1000000L + random.nextLong() * 100000000L);
            protocol.setFees24h(10000L + random.nextLong() * 1000000L);
            protocol.setUniqueWallets(1000 + random.nextInt(10000));
            protocols.add(protocol);
        }
        
        return protocols;
    }
    
    public JsonObject getDeFiMetrics() {
        JsonObject metrics = new JsonObject();
        
        metrics.addProperty("total_tvl", 50000000000L + random.nextLong() * 20000000000L);
        metrics.addProperty("total_volume_24h", 5000000000L + random.nextLong() * 2000000000L);
        metrics.addProperty("total_fees_24h", 50000000L + random.nextLong() * 20000000L);
        metrics.addProperty("active_protocols", 200 + random.nextInt(100));
        metrics.addProperty("total_users", 5000000 + random.nextInt(2000000));
        
        return metrics;
    }
    
    public List<CryptoDataVO> getYieldFarmingOpportunities() {
        List<CryptoDataVO> opportunities = new ArrayList<CryptoDataVO>();
        
        String[] farmNames = {"USDC-ETH LP", "WBTC-ETH LP", "DAI-USDC LP", "UNI-ETH LP", "LINK-ETH LP"};
        
        for (String name : farmNames) {
            CryptoDataVO farm = new CryptoDataVO();
            farm.setName(name);
            farm.setApy(20 + random.nextDouble() * 80);
            farm.setApr(18 + random.nextDouble() * 70);
            farm.setTvl(1000000L + random.nextLong() * 10000000L);
            farm.setRiskLevel("Medium");
            opportunities.add(farm);
        }
        
        return opportunities;
    }
    
    public List<CryptoDataVO> getNFTCollections() {
        List<CryptoDataVO> collections = new ArrayList<CryptoDataVO>();
        
        String[] collectionNames = {"Bored Ape Yacht Club", "CryptoPunks", "Azuki", "Doodles", "Moonbirds", "CloneX", "Meebits", "Cool Cats"};
        
        for (String name : collectionNames) {
            CryptoDataVO collection = new CryptoDataVO();
            collection.setName(name);
            collection.setFloorPrice(5 + random.nextDouble() * 50);
            collection.setTotalVolume(1000000L + random.nextLong() * 10000000L);
            collection.setSales24h(100 + random.nextInt(500));
            collection.setTotalSupplyNFT(5000 + random.nextInt(10000));
            collection.setOwners(2000 + random.nextInt(3000));
            collection.setAveragePrice(10 + random.nextDouble() * 40);
            collection.setHighestSale(100 + random.nextDouble() * 900);
            collections.add(collection);
        }
        
        return collections;
    }
    
    public JsonObject getNFTMetrics() {
        JsonObject metrics = new JsonObject();
        
        metrics.addProperty("total_volume_24h", 50000000L + random.nextLong() * 20000000L);
        metrics.addProperty("total_sales_24h", 50000 + random.nextInt(20000));
        metrics.addProperty("unique_buyers", 15000 + random.nextInt(5000));
        metrics.addProperty("unique_sellers", 12000 + random.nextInt(4000));
        metrics.addProperty("average_price", 2 + random.nextDouble() * 8);
        
        return metrics;
    }
    
    public List<CryptoDataVO> getTrendingNFTs() {
        List<CryptoDataVO> trending = new ArrayList<CryptoDataVO>();
        
        String[] trendingNames = {"Pudgy Penguins", "Degen Ape Academy", "Bored Ape Kennel Club", "Mutant Ape Yacht Club"};
        
        for (String name : trendingNames) {
            CryptoDataVO nft = new CryptoDataVO();
            nft.setName(name);
            nft.setFloorPrice(1 + random.nextDouble() * 20);
            nft.setSales24h(50 + random.nextInt(200));
            nft.setChangePercent24h(-20 + random.nextDouble() * 60);
            trending.add(nft);
        }
        
        return trending;
    }
    
    private CryptoDataVO generateMockCryptoData(String symbol, int rank) {
        CryptoDataVO coin = new CryptoDataVO();
        coin.setSymbol(symbol);
        coin.setName(getCoinName(symbol));
        coin.setFullName(getFullCoinName(symbol));
        coin.setCurrentPrice(0.01 + random.nextDouble() * 50000);
        coin.setChange24h(coin.getCurrentPrice() * (random.nextDouble() * 0.2 - 0.1));
        coin.setChangePercent24h(-10 + random.nextDouble() * 20);
        coin.setMarketCap(1000000L + random.nextLong() * 1000000000000L);
        coin.setVolume24h(100000L + random.nextLong() * 10000000000L);
        coin.setCirculatingSupply(1000000L + random.nextLong() * 100000000000L);
        coin.setTotalSupply(coin.getCirculatingSupply() * (1 + random.nextDouble() * 0.5));
        coin.setMaxSupply(coin.getTotalSupply() * (1 + random.nextDouble() * 0.3));
        coin.setHigh24h(coin.getCurrentPrice() * (1 + random.nextDouble() * 0.1));
        coin.setLow24h(coin.getCurrentPrice() * (1 - random.nextDouble() * 0.1));
        coin.setOpen24h(coin.getCurrentPrice() * (0.95 + random.nextDouble() * 0.1));
        coin.setRank(String.valueOf(rank));
        coin.setImageUrl("https://cryptologos.cc/logos/" + symbol.toLowerCase() + "-logo.png");
        coin.setWebsite("https://" + symbol.toLowerCase() + ".com");
        coin.setBlockchain(getBlockchain(symbol));
        coin.setCategory(getCategory(symbol));
        coin.setLastUpdated(new Date());
        
        // Technical Analysis
        coin.setRsi(30 + random.nextDouble() * 40);
        coin.setMacd(-2 + random.nextDouble() * 4);
        coin.setMacdSignal(-1.5 + random.nextDouble() * 3);
        coin.setMacdHistogram(-0.5 + random.nextDouble() * 1);
        coin.setBollingerUpper(coin.getCurrentPrice() * 1.1);
        coin.setBollingerMiddle(coin.getCurrentPrice());
        coin.setBollingerLower(coin.getCurrentPrice() * 0.9);
        coin.setSma20(coin.getCurrentPrice() * (0.95 + random.nextDouble() * 0.1));
        coin.setSma50(coin.getCurrentPrice() * (0.9 + random.nextDouble() * 0.15));
        coin.setSma200(coin.getCurrentPrice() * (0.8 + random.nextDouble() * 0.3));
        
        // AI Analysis
        coin.setAiScore(30 + random.nextDouble() * 70);
        coin.setAiRecommendation(getAIRecommendation(coin.getAiScore()));
        coin.setAiSentiment(getRandomSentiment());
        coin.setAiConfidence(60 + random.nextDouble() * 40);
        coin.setAiTargetPrice(coin.getCurrentPrice() * (0.8 + random.nextDouble() * 0.6));
        coin.setAiRiskLevel(getRandomRiskLevel());
        coin.setAiTrend(getRandomTrend());
        
        // Social Metrics
        coin.setTwitterFollowers(1000 + random.nextInt(1000000));
        coin.setRedditSubscribers(100 + random.nextInt(100000));
        coin.setTelegramMembers(500 + random.nextInt(50000));
        coin.setSocialScore(50 + random.nextDouble() * 50);
        coin.setSocialSentiment(getRandomSentiment());
        
        // Risk Metrics
        coin.setVolatility(20 + random.nextDouble() * 80);
        coin.setSharpeRatio(-2 + random.nextDouble() * 4);
        coin.setBeta(0.5 + random.nextDouble() * 2);
        coin.setMaxDrawdown(-(20 + random.nextDouble() * 60));
        coin.setVar95(-(10 + random.nextDouble() * 20));
        coin.setRiskLevel(getRandomRiskLevel());
        
        return coin;
    }
    
    private String generateTechnicalAnalysis(CryptoDataVO coin) {
        StringBuilder analysis = new StringBuilder();
        analysis.append("🔍 기술적 분석 결과:\n\n");
        
        if (coin.getRsi() < 30) {
            analysis.append("📉 RSI: 과매도 구간 (RSI: ").append(String.format("%.2f", coin.getRsi())).append(")\n");
        } else if (coin.getRsi() > 70) {
            analysis.append("📈 RSI: 과매수 구간 (RSI: ").append(String.format("%.2f", coin.getRsi())).append(")\n");
        } else {
            analysis.append("➡️ RSI: 중립 구간 (RSI: ").append(String.format("%.2f", coin.getRsi())).append(")\n");
        }
        
        if (coin.getMacd() > coin.getMacdSignal()) {
            analysis.append("📈 MACD: 상승 신호 (MACD > Signal)\n");
        } else {
            analysis.append("📉 MACD: 하락 신호 (MACD < Signal)\n");
        }
        
        if (coin.getCurrentPrice() > coin.getSma20()) {
            analysis.append("📈 단기 이동평균선 상향 돌파\n");
        } else {
            analysis.append("📉 단기 이동평균선 하향 돌파\n");
        }
        
        return analysis.toString();
    }
    
    private String generateAIAnalysis(CryptoDataVO coin) {
        StringBuilder analysis = new StringBuilder();
        analysis.append("🤖 AI 분석 결과:\n\n");
        
        analysis.append("🎯 AI 점수: ").append(String.format("%.1f", coin.getAiScore())).append("/100\n");
        analysis.append("🎲 신뢰도: ").append(String.format("%.1f", coin.getAiConfidence())).append("%\n");
        analysis.append("📊 추천: ").append(coin.getAiRecommendation()).append("\n");
        analysis.append("📈 트렌드: ").append(coin.getAiTrend()).append("\n");
        analysis.append("⚠️ 리스크: ").append(coin.getAiRiskLevel()).append("\n\n");
        
        if (coin.getAiScore() > 70) {
            analysis.append("🚀 강력한 매수 신호! 기술적 지표와 기본적 분석이 모두 긍정적입니다.\n");
        } else if (coin.getAiScore() > 50) {
            analysis.append("⚖️ 중립적 관망. 시장 변동성에 따른 포지션 조정을 권장합니다.\n");
        } else {
            analysis.append("🔴 매도 신호 감지. 리스크 관리 차원에서 포지션 축소를 고려하세요.\n");
        }
        
        return analysis.toString();
    }
    
    private String getCoinName(String symbol) {
        if ("BTC".equals(symbol)) return "Bitcoin";
        if ("ETH".equals(symbol)) return "Ethereum";
        if ("BNB".equals(symbol)) return "BNB";
        if ("XRP".equals(symbol)) return "XRP";
        if ("ADA".equals(symbol)) return "Cardano";
        if ("SOL".equals(symbol)) return "Solana";
        if ("DOT".equals(symbol)) return "Polkadot";
        if ("DOGE".equals(symbol)) return "Dogecoin";
        if ("AVAX".equals(symbol)) return "Avalanche";
        if ("MATIC".equals(symbol)) return "Polygon";
        if ("LINK".equals(symbol)) return "Chainlink";
        if ("UNI".equals(symbol)) return "Uniswap";
        if ("LTC".equals(symbol)) return "Litecoin";
        if ("BCH".equals(symbol)) return "Bitcoin Cash";
        if ("XLM".equals(symbol)) return "Stellar";
        if ("ATOM".equals(symbol)) return "Cosmos";
        if ("ETC".equals(symbol)) return "Ethereum Classic";
        if ("XMR".equals(symbol)) return "Monero";
        if ("VET".equals(symbol)) return "VeChain";
        if ("FIL".equals(symbol)) return "Filecoin";
        if ("TRX".equals(symbol)) return "TRON";
        if ("ICP".equals(symbol)) return "Internet Computer";
        if ("THETA".equals(symbol)) return "Theta Network";
        if ("FTT".equals(symbol)) return "FTX Token";
        if ("DAI".equals(symbol)) return "Dai";
        if ("NEAR".equals(symbol)) return "NEAR Protocol";
        if ("ALGO".equals(symbol)) return "Algorand";
        if ("MANA".equals(symbol)) return "Decentraland";
        if ("SAND".equals(symbol)) return "The Sandbox";
        if ("AXS".equals(symbol)) return "Axie Infinity";
        if ("GALA".equals(symbol)) return "Gala";
        if ("CHZ".equals(symbol)) return "Chiliz";
        if ("HOT".equals(symbol)) return "Holo";
        if ("BAT".equals(symbol)) return "Basic Attention Token";
        if ("ZIL".equals(symbol)) return "Zilliqa";
        if ("ENJ".equals(symbol)) return "Enjin Coin";
        if ("DASH".equals(symbol)) return "Dash";
        if ("NEO".equals(symbol)) return "Neo";
        if ("WAVES".equals(symbol)) return "Waves";
        if ("QTUM".equals(symbol)) return "Qtum";
        if ("IOTA".equals(symbol)) return "IOTA";
        if ("EOS".equals(symbol)) return "EOS";
        if ("XTZ".equals(symbol)) return "Tezos";
        if ("ZEC".equals(symbol)) return "Zcash";
        if ("RVN".equals(symbol)) return "Ravencoin";
        if ("HBAR".equals(symbol)) return "Hedera";
        if ("ONE".equals(symbol)) return "Harmony";
        if ("VTHO".equals(symbol)) return "VeThor Token";
        if ("TFUEL".equals(symbol)) return "Theta Fuel";
        if ("ANKR".equals(symbol)) return "Ankr";
        if ("SHIB".equals(symbol)) return "Shiba Inu";
        if ("PEPE".equals(symbol)) return "Pepe";
        if ("FLOKI".equals(symbol)) return "FLOKI";
        if ("BONK".equals(symbol)) return "Bonk";
        if ("WIF".equals(symbol)) return "dogwifhat";
        if ("BABYDOGE".equals(symbol)) return "Baby Doge Coin";
        if ("SAFEMOON".equals(symbol)) return "SafeMoon";
        if ("LUNA".equals(symbol)) return "Terra";
        if ("CEL".equals(symbol)) return "Celsius";
        return symbol;
    }
    
    private String getFullCoinName(String symbol) {
        if ("BTC".equals(symbol)) return "Bitcoin (BTC)";
        if ("ETH".equals(symbol)) return "Ethereum (ETH)";
        if ("BNB".equals(symbol)) return "Binance Coin (BNB)";
        if ("XRP".equals(symbol)) return "Ripple (XRP)";
        if ("ADA".equals(symbol)) return "Cardano (ADA)";
        if ("SOL".equals(symbol)) return "Solana (SOL)";
        if ("DOT".equals(symbol)) return "Polkadot (DOT)";
        if ("DOGE".equals(symbol)) return "Dogecoin (DOGE)";
        if ("AVAX".equals(symbol)) return "Avalanche (AVAX)";
        if ("MATIC".equals(symbol)) return "Polygon (MATIC)";
        if ("LINK".equals(symbol)) return "Chainlink (LINK)";
        if ("UNI".equals(symbol)) return "Uniswap (UNI)";
        if ("LTC".equals(symbol)) return "Litecoin (LTC)";
        if ("BCH".equals(symbol)) return "Bitcoin Cash (BCH)";
        if ("XLM".equals(symbol)) return "Stellar (XLM)";
        if ("ATOM".equals(symbol)) return "Cosmos (ATOM)";
        if ("ETC".equals(symbol)) return "Ethereum Classic (ETC)";
        if ("XMR".equals(symbol)) return "Monero (XMR)";
        if ("VET".equals(symbol)) return "VeChain (VET)";
        if ("FIL".equals(symbol)) return "Filecoin (FIL)";
        if ("TRX".equals(symbol)) return "TRON (TRX)";
        if ("ICP".equals(symbol)) return "Internet Computer (ICP)";
        if ("THETA".equals(symbol)) return "Theta Network (THETA)";
        if ("FTT".equals(symbol)) return "FTX Token (FTT)";
        if ("DAI".equals(symbol)) return "Dai (DAI)";
        if ("NEAR".equals(symbol)) return "NEAR Protocol (NEAR)";
        if ("ALGO".equals(symbol)) return "Algorand (ALGO)";
        if ("MANA".equals(symbol)) return "Decentraland (MANA)";
        if ("SAND".equals(symbol)) return "The Sandbox (SAND)";
        if ("AXS".equals(symbol)) return "Axie Infinity (AXS)";
        if ("GALA".equals(symbol)) return "Gala (GALA)";
        if ("CHZ".equals(symbol)) return "Chiliz (CHZ)";
        if ("HOT".equals(symbol)) return "Holo (HOT)";
        if ("BAT".equals(symbol)) return "Basic Attention Token (BAT)";
        if ("ZIL".equals(symbol)) return "Zilliqa (ZIL)";
        if ("ENJ".equals(symbol)) return "Enjin Coin (ENJ)";
        if ("DASH".equals(symbol)) return "Dash (DASH)";
        if ("NEO".equals(symbol)) return "Neo (NEO)";
        if ("WAVES".equals(symbol)) return "Waves (WAVES)";
        if ("QTUM".equals(symbol)) return "Qtum (QTUM)";
        if ("IOTA".equals(symbol)) return "IOTA (IOTA)";
        if ("EOS".equals(symbol)) return "EOS (EOS)";
        if ("XTZ".equals(symbol)) return "Tezos (XTZ)";
        if ("ZEC".equals(symbol)) return "Zcash (ZEC)";
        if ("RVN".equals(symbol)) return "Ravencoin (RVN)";
        if ("HBAR".equals(symbol)) return "Hedera (HBAR)";
        if ("ONE".equals(symbol)) return "Harmony (ONE)";
        if ("VTHO".equals(symbol)) return "VeThor Token (VTHO)";
        if ("TFUEL".equals(symbol)) return "Theta Fuel (TFUEL)";
        if ("ANKR".equals(symbol)) return "Ankr (ANKR)";
        if ("SHIB".equals(symbol)) return "Shiba Inu (SHIB)";
        if ("PEPE".equals(symbol)) return "Pepe (PEPE)";
        if ("FLOKI".equals(symbol)) return "FLOKI (FLOKI)";
        if ("BONK".equals(symbol)) return "Bonk (BONK)";
        if ("WIF".equals(symbol)) return "dogwifhat (WIF)";
        if ("BABYDOGE".equals(symbol)) return "Baby Doge Coin (BABYDOGE)";
        if ("SAFEMOON".equals(symbol)) return "SafeMoon (SAFEMOON)";
        if ("LUNA".equals(symbol)) return "Terra (LUNA)";
        if ("CEL".equals(symbol)) return "Celsius (CEL)";
        return symbol;
    }
    
    private String getBlockchain(String symbol) {
        if ("BTC".equals(symbol)) return "Bitcoin";
        if ("ETH".equals(symbol) || "ETC".equals(symbol) || "UNI".equals(symbol) || "LINK".equals(symbol) || 
            "MANA".equals(symbol) || "SAND".equals(symbol) || "AXS".equals(symbol) || "GALA".equals(symbol) || 
            "BAT".equals(symbol) || "ENJ".equals(symbol) || "DAI".equals(symbol)) return "Ethereum";
        if ("BNB".equals(symbol) || "CAKE".equals(symbol)) return "Binance Smart Chain";
        if ("SOL".equals(symbol) || "BONK".equals(symbol) || "WIF".equals(symbol)) return "Solana";
        if ("ADA".equals(symbol)) return "Cardano";
        if ("DOT".equals(symbol)) return "Polkadot";
        if ("AVAX".equals(symbol)) return "Avalanche";
        if ("MATIC".equals(symbol)) return "Polygon";
        if ("LTC".equals(symbol)) return "Litecoin";
        if ("BCH".equals(symbol)) return "Bitcoin Cash";
        if ("XLM".equals(symbol)) return "Stellar";
        if ("ATOM".equals(symbol)) return "Cosmos";
        if ("XMR".equals(symbol)) return "Monero";
        if ("VET".equals(symbol) || "VTHO".equals(symbol)) return "VeChain";
        if ("FIL".equals(symbol)) return "Filecoin";
        if ("TRX".equals(symbol)) return "TRON";
        if ("ICP".equals(symbol)) return "Internet Computer";
        if ("THETA".equals(symbol) || "TFUEL".equals(symbol)) return "Theta";
        if ("NEAR".equals(symbol)) return "NEAR Protocol";
        if ("ALGO".equals(symbol)) return "Algorand";
        if ("CHZ".equals(symbol)) return "Chiliz";
        if ("HOT".equals(symbol)) return "Holo";
        if ("ZIL".equals(symbol)) return "Zilliqa";
        if ("DASH".equals(symbol)) return "Dash";
        if ("NEO".equals(symbol)) return "Neo";
        if ("WAVES".equals(symbol)) return "Waves";
        if ("QTUM".equals(symbol)) return "Qtum";
        if ("IOTA".equals(symbol)) return "IOTA";
        if ("EOS".equals(symbol)) return "EOS";
        if ("XTZ".equals(symbol)) return "Tezos";
        if ("ZEC".equals(symbol)) return "Zcash";
        if ("RVN".equals(symbol)) return "Ravencoin";
        if ("HBAR".equals(symbol)) return "Hedera";
        if ("ONE".equals(symbol)) return "Harmony";
        if ("ANKR".equals(symbol)) return "Ankr";
        if ("SHIB".equals(symbol) || "PEPE".equals(symbol) || "FLOKI".equals(symbol) || 
            "BABYDOGE".equals(symbol) || "SAFEMOON".equals(symbol)) return "Ethereum";
        if ("LUNA".equals(symbol)) return "Terra";
        if ("CEL".equals(symbol)) return "Ethereum";
        return "Unknown";
    }
    
    private String getCategory(String symbol) {
        if ("BTC".equals(symbol) || "LTC".equals(symbol) || "BCH".equals(symbol) || "DASH".equals(symbol) || 
            "XMR".equals(symbol) || "ZEC".equals(symbol) || "RVN".equals(symbol)) return "Cryptocurrency";
        if ("ETH".equals(symbol) || "ETC".equals(symbol) || "BNB".equals(symbol) || "SOL".equals(symbol) || 
            "ADA".equals(symbol) || "DOT".equals(symbol) || "AVAX".equals(symbol) || "MATIC".equals(symbol) || 
            "NEAR".equals(symbol) || "ALGO".equals(symbol) || "ATOM".equals(symbol) || "ICP".equals(symbol) || 
            "THETA".equals(symbol) || "NEO".equals(symbol) || "WAVES".equals(symbol) || "QTUM".equals(symbol) || 
            "IOTA".equals(symbol) || "EOS".equals(symbol) || "XTZ".equals(symbol) || "HBAR".equals(symbol) || 
            "ONE".equals(symbol) || "ANKR".equals(symbol)) return "Platform";
        if ("XRP".equals(symbol) || "XLM".equals(symbol) || "VET".equals(symbol) || "TRX".equals(symbol) || 
            "HOT".equals(symbol) || "ZIL".equals(symbol) || "VTHO".equals(symbol) || "TFUEL".equals(symbol)) return "Infrastructure";
        if ("LINK".equals(symbol) || "BAT".equals(symbol) || "CHZ".equals(symbol)) return "Oracle";
        if ("UNI".equals(symbol) || "CAKE".equals(symbol)) return "DEX";
        if ("MANA".equals(symbol) || "SAND".equals(symbol) || "AXS".equals(symbol) || "GALA".equals(symbol) || 
            "ENJ".equals(symbol)) return "Gaming";
        if ("FIL".equals(symbol)) return "Storage";
        if ("FTT".equals(symbol) || "CEL".equals(symbol)) return "Exchange";
        if ("DAI".equals(symbol)) return "Stablecoin";
        if ("SHIB".equals(symbol) || "DOGE".equals(symbol) || "PEPE".equals(symbol) || "FLOKI".equals(symbol) || 
            "BONK".equals(symbol) || "WIF".equals(symbol) || "BABYDOGE".equals(symbol) || "SAFEMOON".equals(symbol)) return "Meme";
        if ("LUNA".equals(symbol)) return "Algorithmic Stablecoin";
        return "Other";
    }
    
    private String getAIRecommendation(double aiScore) {
        if (aiScore >= 80) return "Strong Buy";
        if (aiScore >= 60) return "Buy";
        if (aiScore >= 40) return "Hold";
        if (aiScore >= 20) return "Sell";
        return "Strong Sell";
    }
    
    private String getRandomSentiment() {
        String[] sentiments = {"Very Bullish", "Bullish", "Neutral", "Bearish", "Very Bearish"};
        return sentiments[random.nextInt(sentiments.length)];
    }
    
    private String getRandomRiskLevel() {
        String[] riskLevels = {"Very Low", "Low", "Medium", "High", "Very High"};
        return riskLevels[random.nextInt(riskLevels.length)];
    }
    
    private String getRandomTrend() {
        String[] trends = {"Strong Uptrend", "Uptrend", "Sideways", "Downtrend", "Strong Downtrend"};
        return trends[random.nextInt(trends.length)];
    }
} 