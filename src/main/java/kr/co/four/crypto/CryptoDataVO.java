package kr.co.four.crypto;

import java.util.Date;

public class CryptoDataVO {
    private String symbol;
    private String name;
    private String fullName;
    private double currentPrice;
    private double change24h;
    private double changePercent24h;
    private double marketCap;
    private double volume24h;
    private double circulatingSupply;
    private double totalSupply;
    private double maxSupply;
    private double high24h;
    private double low24h;
    private double open24h;
    private String rank;
    private String imageUrl;
    private String website;
    private String whitepaper;
    private String github;
    private String twitter;
    private String reddit;
    private String telegram;
    private String discord;
    private String blockchain;
    private String consensus;
    private String algorithm;
    private Date launchDate;
    private String category;
    private String description;
    private String[] tags;
    
    // Technical Analysis
    private double rsi;
    private double macd;
    private double macdSignal;
    private double macdHistogram;
    private double bollingerUpper;
    private double bollingerMiddle;
    private double bollingerLower;
    private double sma20;
    private double sma50;
    private double sma200;
    private double ema12;
    private double ema26;
    private double stochK;
    private double stochD;
    private double atr;
    private double adx;
    private double cci;
    private double williamsR;
    
    // AI Analysis
    private double aiScore;
    private String aiRecommendation;
    private String aiSentiment;
    private double aiConfidence;
    private String aiPrediction;
    private double aiTargetPrice;
    private String aiRiskLevel;
    private String aiTrend;
    
    // Technical Analysis String
    private String technicalAnalysis;
    
    // AI Analysis String
    private String aiAnalysis;
    
    // DeFi Metrics
    private double tvl;
    private double apy;
    private double apr;
    private double liquidity;
    private double fees24h;
    private double volume7d;
    private double uniqueWallets;
    private double transactions24h;
    
    // NFT Metrics
    private double floorPrice;
    private double totalVolume;
    private double sales24h;
    private int totalSupplyNFT;
    private int owners;
    private double averagePrice;
    private double highestSale;
    
    // Social Metrics
    private int twitterFollowers;
    private int redditSubscribers;
    private int telegramMembers;
    private double socialScore;
    private String socialSentiment;
    
    // Risk Metrics
    private double volatility;
    private double sharpeRatio;
    private double beta;
    private double maxDrawdown;
    private double var95;
    private String riskLevel;
    
    // Portfolio
    private double quantity;
    private double avgBuyPrice;
    private double totalValue;
    private double unrealizedPnL;
    private double realizedPnL;
    private double totalPnL;
    private double allocation;
    
    // Market Data
    private Date lastUpdated;
    private String exchange;
    private String tradingPair;
    private double bid;
    private double ask;
    private double spread;
    private double orderBookDepth;
    
    // Constructor
    public CryptoDataVO() {}
    
    // Getters and Setters
    public String getSymbol() { return symbol; }
    public void setSymbol(String symbol) { this.symbol = symbol; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    public double getCurrentPrice() { return currentPrice; }
    public void setCurrentPrice(double currentPrice) { this.currentPrice = currentPrice; }
    
    public double getChange24h() { return change24h; }
    public void setChange24h(double change24h) { this.change24h = change24h; }
    
    public double getChangePercent24h() { return changePercent24h; }
    public void setChangePercent24h(double changePercent24h) { this.changePercent24h = changePercent24h; }
    
    public double getMarketCap() { return marketCap; }
    public void setMarketCap(double marketCap) { this.marketCap = marketCap; }
    
    public double getVolume24h() { return volume24h; }
    public void setVolume24h(double volume24h) { this.volume24h = volume24h; }
    
    public double getCirculatingSupply() { return circulatingSupply; }
    public void setCirculatingSupply(double circulatingSupply) { this.circulatingSupply = circulatingSupply; }
    
    public double getTotalSupply() { return totalSupply; }
    public void setTotalSupply(double totalSupply) { this.totalSupply = totalSupply; }
    
    public double getMaxSupply() { return maxSupply; }
    public void setMaxSupply(double maxSupply) { this.maxSupply = maxSupply; }
    
    public double getHigh24h() { return high24h; }
    public void setHigh24h(double high24h) { this.high24h = high24h; }
    
    public double getLow24h() { return low24h; }
    public void setLow24h(double low24h) { this.low24h = low24h; }
    
    public double getOpen24h() { return open24h; }
    public void setOpen24h(double open24h) { this.open24h = open24h; }
    
    public String getRank() { return rank; }
    public void setRank(String rank) { this.rank = rank; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }
    
    public String getWhitepaper() { return whitepaper; }
    public void setWhitepaper(String whitepaper) { this.whitepaper = whitepaper; }
    
    public String getGithub() { return github; }
    public void setGithub(String github) { this.github = github; }
    
    public String getTwitter() { return twitter; }
    public void setTwitter(String twitter) { this.twitter = twitter; }
    
    public String getReddit() { return reddit; }
    public void setReddit(String reddit) { this.reddit = reddit; }
    
    public String getTelegram() { return telegram; }
    public void setTelegram(String telegram) { this.telegram = telegram; }
    
    public String getDiscord() { return discord; }
    public void setDiscord(String discord) { this.discord = discord; }
    
    public String getBlockchain() { return blockchain; }
    public void setBlockchain(String blockchain) { this.blockchain = blockchain; }
    
    public String getConsensus() { return consensus; }
    public void setConsensus(String consensus) { this.consensus = consensus; }
    
    public String getAlgorithm() { return algorithm; }
    public void setAlgorithm(String algorithm) { this.algorithm = algorithm; }
    
    public Date getLaunchDate() { return launchDate; }
    public void setLaunchDate(Date launchDate) { this.launchDate = launchDate; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public String[] getTags() { return tags; }
    public void setTags(String[] tags) { this.tags = tags; }
    
    // Technical Analysis Getters/Setters
    public double getRsi() { return rsi; }
    public void setRsi(double rsi) { this.rsi = rsi; }
    
    public double getMacd() { return macd; }
    public void setMacd(double macd) { this.macd = macd; }
    
    public double getMacdSignal() { return macdSignal; }
    public void setMacdSignal(double macdSignal) { this.macdSignal = macdSignal; }
    
    public double getMacdHistogram() { return macdHistogram; }
    public void setMacdHistogram(double macdHistogram) { this.macdHistogram = macdHistogram; }
    
    public double getBollingerUpper() { return bollingerUpper; }
    public void setBollingerUpper(double bollingerUpper) { this.bollingerUpper = bollingerUpper; }
    
    public double getBollingerMiddle() { return bollingerMiddle; }
    public void setBollingerMiddle(double bollingerMiddle) { this.bollingerMiddle = bollingerMiddle; }
    
    public double getBollingerLower() { return bollingerLower; }
    public void setBollingerLower(double bollingerLower) { this.bollingerLower = bollingerLower; }
    
    public double getSma20() { return sma20; }
    public void setSma20(double sma20) { this.sma20 = sma20; }
    
    public double getSma50() { return sma50; }
    public void setSma50(double sma50) { this.sma50 = sma50; }
    
    public double getSma200() { return sma200; }
    public void setSma200(double sma200) { this.sma200 = sma200; }
    
    public double getEma12() { return ema12; }
    public void setEma12(double ema12) { this.ema12 = ema12; }
    
    public double getEma26() { return ema26; }
    public void setEma26(double ema26) { this.ema26 = ema26; }
    
    public double getStochK() { return stochK; }
    public void setStochK(double stochK) { this.stochK = stochK; }
    
    public double getStochD() { return stochD; }
    public void setStochD(double stochD) { this.stochD = stochD; }
    
    public double getAtr() { return atr; }
    public void setAtr(double atr) { this.atr = atr; }
    
    public double getAdx() { return adx; }
    public void setAdx(double adx) { this.adx = adx; }
    
    public double getCci() { return cci; }
    public void setCci(double cci) { this.cci = cci; }
    
    public double getWilliamsR() { return williamsR; }
    public void setWilliamsR(double williamsR) { this.williamsR = williamsR; }
    
    // AI Analysis Getters/Setters
    public double getAiScore() { return aiScore; }
    public void setAiScore(double aiScore) { this.aiScore = aiScore; }
    
    public String getAiRecommendation() { return aiRecommendation; }
    public void setAiRecommendation(String aiRecommendation) { this.aiRecommendation = aiRecommendation; }
    
    public String getAiSentiment() { return aiSentiment; }
    public void setAiSentiment(String aiSentiment) { this.aiSentiment = aiSentiment; }
    
    public double getAiConfidence() { return aiConfidence; }
    public void setAiConfidence(double aiConfidence) { this.aiConfidence = aiConfidence; }
    
    public String getAiPrediction() { return aiPrediction; }
    public void setAiPrediction(String aiPrediction) { this.aiPrediction = aiPrediction; }
    
    public double getAiTargetPrice() { return aiTargetPrice; }
    public void setAiTargetPrice(double aiTargetPrice) { this.aiTargetPrice = aiTargetPrice; }
    
    public String getAiRiskLevel() { return aiRiskLevel; }
    public void setAiRiskLevel(String aiRiskLevel) { this.aiRiskLevel = aiRiskLevel; }
    
    public String getAiTrend() { return aiTrend; }
    public void setAiTrend(String aiTrend) { this.aiTrend = aiTrend; }
    
    // Technical Analysis String Getters/Setters
    public String getTechnicalAnalysis() { return technicalAnalysis; }
    public void setTechnicalAnalysis(String technicalAnalysis) { this.technicalAnalysis = technicalAnalysis; }
    
    // AI Analysis String Getters/Setters
    public String getAiAnalysis() { return aiAnalysis; }
    public void setAiAnalysis(String aiAnalysis) { this.aiAnalysis = aiAnalysis; }
    
    // DeFi Metrics Getters/Setters
    public double getTvl() { return tvl; }
    public void setTvl(double tvl) { this.tvl = tvl; }
    
    public double getApy() { return apy; }
    public void setApy(double apy) { this.apy = apy; }
    
    public double getApr() { return apr; }
    public void setApr(double apr) { this.apr = apr; }
    
    public double getLiquidity() { return liquidity; }
    public void setLiquidity(double liquidity) { this.liquidity = liquidity; }
    
    public double getFees24h() { return fees24h; }
    public void setFees24h(double fees24h) { this.fees24h = fees24h; }
    
    public double getVolume7d() { return volume7d; }
    public void setVolume7d(double volume7d) { this.volume7d = volume7d; }
    
    public double getUniqueWallets() { return uniqueWallets; }
    public void setUniqueWallets(double uniqueWallets) { this.uniqueWallets = uniqueWallets; }
    
    public double getTransactions24h() { return transactions24h; }
    public void setTransactions24h(double transactions24h) { this.transactions24h = transactions24h; }
    
    // NFT Metrics Getters/Setters
    public double getFloorPrice() { return floorPrice; }
    public void setFloorPrice(double floorPrice) { this.floorPrice = floorPrice; }
    
    public double getTotalVolume() { return totalVolume; }
    public void setTotalVolume(double totalVolume) { this.totalVolume = totalVolume; }
    
    public double getSales24h() { return sales24h; }
    public void setSales24h(double sales24h) { this.sales24h = sales24h; }
    
    public int getTotalSupplyNFT() { return totalSupplyNFT; }
    public void setTotalSupplyNFT(int totalSupplyNFT) { this.totalSupplyNFT = totalSupplyNFT; }
    
    public int getOwners() { return owners; }
    public void setOwners(int owners) { this.owners = owners; }
    
    public double getAveragePrice() { return averagePrice; }
    public void setAveragePrice(double averagePrice) { this.averagePrice = averagePrice; }
    
    public double getHighestSale() { return highestSale; }
    public void setHighestSale(double highestSale) { this.highestSale = highestSale; }
    
    // Social Metrics Getters/Setters
    public int getTwitterFollowers() { return twitterFollowers; }
    public void setTwitterFollowers(int twitterFollowers) { this.twitterFollowers = twitterFollowers; }
    
    public int getRedditSubscribers() { return redditSubscribers; }
    public void setRedditSubscribers(int redditSubscribers) { this.redditSubscribers = redditSubscribers; }
    
    public int getTelegramMembers() { return telegramMembers; }
    public void setTelegramMembers(int telegramMembers) { this.telegramMembers = telegramMembers; }
    
    public double getSocialScore() { return socialScore; }
    public void setSocialScore(double socialScore) { this.socialScore = socialScore; }
    
    public String getSocialSentiment() { return socialSentiment; }
    public void setSocialSentiment(String socialSentiment) { this.socialSentiment = socialSentiment; }
    
    // Risk Metrics Getters/Setters
    public double getVolatility() { return volatility; }
    public void setVolatility(double volatility) { this.volatility = volatility; }
    
    public double getSharpeRatio() { return sharpeRatio; }
    public void setSharpeRatio(double sharpeRatio) { this.sharpeRatio = sharpeRatio; }
    
    public double getBeta() { return beta; }
    public void setBeta(double beta) { this.beta = beta; }
    
    public double getMaxDrawdown() { return maxDrawdown; }
    public void setMaxDrawdown(double maxDrawdown) { this.maxDrawdown = maxDrawdown; }
    
    public double getVar95() { return var95; }
    public void setVar95(double var95) { this.var95 = var95; }
    
    public String getRiskLevel() { return riskLevel; }
    public void setRiskLevel(String riskLevel) { this.riskLevel = riskLevel; }
    
    // Portfolio Getters/Setters
    public double getQuantity() { return quantity; }
    public void setQuantity(double quantity) { this.quantity = quantity; }
    
    public double getAvgBuyPrice() { return avgBuyPrice; }
    public void setAvgBuyPrice(double avgBuyPrice) { this.avgBuyPrice = avgBuyPrice; }
    
    public double getTotalValue() { return totalValue; }
    public void setTotalValue(double totalValue) { this.totalValue = totalValue; }
    
    public double getUnrealizedPnL() { return unrealizedPnL; }
    public void setUnrealizedPnL(double unrealizedPnL) { this.unrealizedPnL = unrealizedPnL; }
    
    public double getRealizedPnL() { return realizedPnL; }
    public void setRealizedPnL(double realizedPnL) { this.realizedPnL = realizedPnL; }
    
    public double getTotalPnL() { return totalPnL; }
    public void setTotalPnL(double totalPnL) { this.totalPnL = totalPnL; }
    
    public double getAllocation() { return allocation; }
    public void setAllocation(double allocation) { this.allocation = allocation; }
    
    // Market Data Getters/Setters
    public Date getLastUpdated() { return lastUpdated; }
    public void setLastUpdated(Date lastUpdated) { this.lastUpdated = lastUpdated; }
    
    public String getExchange() { return exchange; }
    public void setExchange(String exchange) { this.exchange = exchange; }
    
    public String getTradingPair() { return tradingPair; }
    public void setTradingPair(String tradingPair) { this.tradingPair = tradingPair; }
    
    public double getBid() { return bid; }
    public void setBid(double bid) { this.bid = bid; }
    
    public double getAsk() { return ask; }
    public void setAsk(double ask) { this.ask = ask; }
    
    public double getSpread() { return spread; }
    public void setSpread(double spread) { this.spread = spread; }
    
    public double getOrderBookDepth() { return orderBookDepth; }
    public void setOrderBookDepth(double orderBookDepth) { this.orderBookDepth = orderBookDepth; }
} 