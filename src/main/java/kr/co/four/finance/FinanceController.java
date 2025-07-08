package kr.co.four.finance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

@Controller
@RequestMapping("/finance")
public class FinanceController {
    
    @Autowired
    private FinanceService financeService;
    
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        List<FinanceDataVO> globalStocks = financeService.getGlobalStockData();
        List<FinanceDataVO> marketTrends = financeService.getMarketTrends();
        JsonObject economicIndicators = financeService.getEconomicIndicators();
        JsonObject currencyRates = financeService.getCurrencyRates();
        
        model.addAttribute("globalStocks", globalStocks);
        model.addAttribute("marketTrends", marketTrends);
        model.addAttribute("economicIndicators", economicIndicators);
        model.addAttribute("currencyRates", currencyRates);
        
        return "finance/dashboard";
    }
    
    @GetMapping("/stocks")
    public String stocks(Model model) {
        List<FinanceDataVO> globalStocks = financeService.getGlobalStockData();
        model.addAttribute("stocks", globalStocks);
        return "finance/stocks";
    }
    
    @GetMapping("/stock")
    public String stockList(Model model) {
        List<FinanceDataVO> globalStocks = financeService.getGlobalStockData();
        model.addAttribute("stocks", globalStocks);
        return "finance/stocks";
    }
    
    @GetMapping("/stock/{symbol}")
    public String stockDetail(@PathVariable String symbol, Model model) {
        FinanceDataVO stock = financeService.getStockDetail(symbol);
        model.addAttribute("stock", stock);
        return "finance/stock-detail";
    }
    
    @GetMapping("/market-trends")
    public String marketTrends(Model model) {
        List<FinanceDataVO> trends = financeService.getMarketTrends();
        JsonObject economicIndicators = financeService.getEconomicIndicators();
        JsonObject currencyRates = financeService.getCurrencyRates();
        
        model.addAttribute("trends", trends);
        model.addAttribute("economicIndicators", economicIndicators);
        model.addAttribute("currencyRates", currencyRates);
        
        return "finance/market-trends";
    }
    
    @GetMapping("/ai-analysis")
    public String aiAnalysis(Model model) {
        List<FinanceDataVO> globalStocks = financeService.getGlobalStockData();
        model.addAttribute("stocks", globalStocks);
        return "finance/ai-analysis";
    }
    
    @GetMapping("/api/stocks")
    @ResponseBody
    public List<FinanceDataVO> getStocksApi() {
        return financeService.getGlobalStockData();
    }
    
    @GetMapping("/api/stock/{symbol}")
    @ResponseBody
    public FinanceDataVO getStockApi(@PathVariable String symbol) {
        return financeService.getStockDetail(symbol);
    }
    
    @GetMapping("/api/trends")
    @ResponseBody
    public List<FinanceDataVO> getTrendsApi() {
        return financeService.getMarketTrends();
    }
    
    @GetMapping("/api/economic-indicators")
    @ResponseBody
    public JsonObject getEconomicIndicatorsApi() {
        return financeService.getEconomicIndicators();
    }
    
    @GetMapping("/api/currency-rates")
    @ResponseBody
    public JsonObject getCurrencyRatesApi() {
        return financeService.getCurrencyRates();
    }
} 