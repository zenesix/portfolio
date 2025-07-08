package kr.co.four.crypto;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping("/crypto")
public class CryptoController {
    
    @Autowired
    private CryptoService cryptoService;
    
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        List<CryptoDataVO> topCoins = cryptoService.getTopCoins();
        List<CryptoDataVO> trendingCoins = cryptoService.getTrendingCoins();
        JsonObject marketOverviewJson = cryptoService.getMarketOverview();
        List<CryptoDataVO> gainersLosers = cryptoService.getGainersAndLosers();

        // JsonObject → Map 변환
        Map<String, Object> marketOverview = new com.google.gson.Gson().fromJson(
            marketOverviewJson, new TypeToken<Map<String, Object>>(){}.getType()
        );

        model.addAttribute("topCoins", topCoins);
        model.addAttribute("trendingCoins", trendingCoins);
        model.addAttribute("marketOverview", marketOverview); // Map으로 전달
        model.addAttribute("gainersLosers", gainersLosers);
        
        return "crypto/dashboard";
    }
    
    @GetMapping("/market")
    public String market(Model model, 
                        @RequestParam(defaultValue = "market_cap") String sortBy,
                        @RequestParam(defaultValue = "desc") String order) {
        List<CryptoDataVO> allCoins = cryptoService.getAllCoins(sortBy, order);
        model.addAttribute("coins", allCoins);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("order", order);
        return "crypto/market";
    }
    
    @GetMapping("/coin/{symbol}")
    public String coinDetail(@PathVariable String symbol, Model model) {
        CryptoDataVO coin = cryptoService.getCoinDetail(symbol);
        List<CryptoDataVO> similarCoins = cryptoService.getSimilarCoins(symbol);
        JsonObject technicalAnalysis = cryptoService.getTechnicalAnalysis(symbol);
        JsonObject aiAnalysis = cryptoService.getAIAnalysis(symbol);
        
        model.addAttribute("coin", coin);
        model.addAttribute("similarCoins", similarCoins);
        model.addAttribute("technicalAnalysis", technicalAnalysis);
        model.addAttribute("aiAnalysis", aiAnalysis);
        
        return "crypto/coin-detail";
    }
    
    @GetMapping("/portfolio")
    public String portfolio(Model model) {
        List<CryptoDataVO> portfolio = cryptoService.getPortfolio();
        JsonObject portfolioStats = cryptoService.getPortfolioStats();
        List<CryptoDataVO> recommendations = cryptoService.getPortfolioRecommendations();
        
        model.addAttribute("portfolio", portfolio);
        model.addAttribute("portfolioStats", portfolioStats);
        model.addAttribute("recommendations", recommendations);
        
        return "crypto/portfolio";
    }
    
    @GetMapping("/analysis")
    public String analysis(Model model) {
        List<CryptoDataVO> marketAnalysis = cryptoService.getMarketAnalysis();
        JsonObject sentimentAnalysis = cryptoService.getSentimentAnalysis();
        List<CryptoDataVO> aiPredictions = cryptoService.getAIPredictions();
        
        model.addAttribute("marketAnalysis", marketAnalysis);
        model.addAttribute("sentimentAnalysis", sentimentAnalysis);
        model.addAttribute("aiPredictions", aiPredictions);
        
        return "crypto/analysis";
    }
    
    @GetMapping("/defi")
    public String defi(Model model) {
        List<CryptoDataVO> defiProtocols = cryptoService.getDeFiProtocols();
        JsonObject defiMetrics = cryptoService.getDeFiMetrics();
        List<CryptoDataVO> yieldFarming = cryptoService.getYieldFarmingOpportunities();
        
        model.addAttribute("defiProtocols", defiProtocols);
        model.addAttribute("defiMetrics", defiMetrics);
        model.addAttribute("yieldFarming", yieldFarming);
        
        return "crypto/defi";
    }
    
    @GetMapping("/nft")
    public String nft(Model model) {
        List<CryptoDataVO> nftCollections = cryptoService.getNFTCollections();
        JsonObject nftMetrics = cryptoService.getNFTMetrics();
        List<CryptoDataVO> trendingNFTs = cryptoService.getTrendingNFTs();
        
        model.addAttribute("nftCollections", nftCollections);
        model.addAttribute("nftMetrics", nftMetrics);
        model.addAttribute("trendingNFTs", trendingNFTs);
        
        return "crypto/nft";
    }
    
    // API Endpoints
    @GetMapping("/api/top-coins")
    @ResponseBody
    public List<CryptoDataVO> getTopCoinsApi() {
        return cryptoService.getTopCoins();
    }
    
    @GetMapping("/api/coin/{symbol}")
    @ResponseBody
    public CryptoDataVO getCoinApi(@PathVariable String symbol) {
        return cryptoService.getCoinDetail(symbol);
    }
    
    @GetMapping("/api/market-overview")
    @ResponseBody
    public JsonObject getMarketOverviewApi() {
        return cryptoService.getMarketOverview();
    }
    
    @GetMapping("/api/technical-analysis/{symbol}")
    @ResponseBody
    public JsonObject getTechnicalAnalysisApi(@PathVariable String symbol) {
        return cryptoService.getTechnicalAnalysis(symbol);
    }
    
    @GetMapping("/api/ai-analysis/{symbol}")
    @ResponseBody
    public JsonObject getAIAnalysisApi(@PathVariable String symbol) {
        return cryptoService.getAIAnalysis(symbol);
    }
    
    @GetMapping("/api/portfolio")
    @ResponseBody
    public List<CryptoDataVO> getPortfolioApi() {
        return cryptoService.getPortfolio();
    }
    
    @GetMapping("/api/defi-protocols")
    @ResponseBody
    public List<CryptoDataVO> getDeFiProtocolsApi() {
        return cryptoService.getDeFiProtocols();
    }
    
    @GetMapping("/api/nft-collections")
    @ResponseBody
    public List<CryptoDataVO> getNFTCollectionsApi() {
        return cryptoService.getNFTCollections();
    }
} 