package kr.co.four.finance;

import lombok.Data;

@Data
public class FinanceDataVO {
    private String symbol;
    private String companyName;
    private double currentPrice;
    private double change;
    private double changePercent;
    private double high;
    private double low;
    private long volume;
    private double marketCap;
    private String sector;
    private String exchange;
    private String lastUpdated;
    private double peRatio;
    private double dividendYield;
    private double fiftyTwoWeekHigh;
    private double fiftyTwoWeekLow;
    private String currency;
    private String country;
    private String industry;
    private double eps;
    private double bookValue;
    private double priceToBook;
    private double debtToEquity;
    private double returnOnEquity;
    private double profitMargin;
    private double operatingMargin;
    private double revenueGrowth;
    private double earningsGrowth;
    private String recommendation;
    private double targetPrice;
    private int analystCount;
    private String riskLevel;
    private String volatility;
    private String trend;
    private String sentiment;
    private double aiScore;
    private String aiRecommendation;
    private String aiAnalysis;
} 