<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Crypto Universe - 실시간 암호화폐 대시보드</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/AdminLTE.css">
    <!-- AdminLTE Skins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/skins/_all-skins.min.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/morris.js/morris.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    
    <!-- Custom Crypto Styles -->
    <style>
        .crypto-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }
        
        .crypto-card:hover {
            transform: translateY(-5px);
        }
        
        .crypto-card.bitcoin {
            background: linear-gradient(135deg, #f7931a 0%, #ff9500 100%);
        }
        
        .crypto-card.ethereum {
            background: linear-gradient(135deg, #627eea 0%, #a091f7 100%);
        }
        
        .crypto-card.bnb {
            background: linear-gradient(135deg, #f3ba2f 0%, #f7931a 100%);
        }
        
        .crypto-card.solana {
            background: linear-gradient(135deg, #9945ff 0%, #14f195 100%);
        }
        
        .crypto-card.cardano {
            background: linear-gradient(135deg, #0033ad 0%, #3399ff 100%);
        }
        
        .price-change-positive {
            color: #00ff88;
            font-weight: bold;
        }
        
        .price-change-negative {
            color: #ff4757;
            font-weight: bold;
        }
        
        .market-overview {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
        }
        
        .trending-card {
            background: white;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-left: 4px solid #667eea;
        }
        
        .fear-greed-indicator {
            width: 100%;
            height: 20px;
            background: linear-gradient(to right, #ff4757, #ffa502, #2ed573, #1e90ff);
            border-radius: 10px;
            position: relative;
            margin: 10px 0;
        }
        
        .fear-greed-pointer {
            position: absolute;
            top: -5px;
            width: 10px;
            height: 30px;
            background: #333;
            border-radius: 5px;
            transform: translateX(-50%);
        }
        
        .ai-analysis-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .social-metrics {
            display: flex;
            justify-content: space-around;
            margin-top: 15px;
        }
        
        .social-metric {
            text-align: center;
        }
        
        .social-metric i {
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .real-time-indicator {
            display: inline-block;
            width: 10px;
            height: 10px;
            background: #00ff88;
            border-radius: 50%;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { opacity: 1; }
            50% { opacity: 0.5; }
            100% { opacity: 1; }
        }
        
        .crypto-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        .volume-bar {
            height: 4px;
            background: rgba(255,255,255,0.3);
            border-radius: 2px;
            margin-top: 5px;
        }
        
        .volume-fill {
            height: 100%;
            background: rgba(255,255,255,0.8);
            border-radius: 2px;
            transition: width 0.3s ease;
        }
        
        .market-cap-badge {
            background: rgba(255,255,255,0.2);
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 12px;
            margin-left: 10px;
        }
        
        .trending-badge {
            background: #ff4757;
            color: white;
            padding: 2px 6px;
            border-radius: 8px;
            font-size: 10px;
            margin-left: 5px;
        }
        
        .ai-score {
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
        }
        
        .ai-recommendation {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }
        
        .ai-recommendation.strong-buy {
            background: #00ff88;
            color: #333;
        }
        
        .ai-recommendation.buy {
            background: #2ed573;
            color: white;
        }
        
        .ai-recommendation.hold {
            background: #ffa502;
            color: white;
        }
        
        .ai-recommendation.sell {
            background: #ff4757;
            color: white;
        }
        
        .ai-recommendation.strong-sell {
            background: #c44569;
            color: white;
        }
        
        /* 레이아웃 보정: 사이드바와 메인 컨텐츠가 겹치지 않게 */
        .content-wrapper {
            min-height: 100vh;
            padding-bottom: 30px;
        }
        
        .box-body, .ai-analysis-card, .trending-card {
            min-height: 180px;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- Header -->
    <jsp:include page="../include/header.jsp" />
    
    <!-- Sidebar -->
    <aside class="main-sidebar">
        <jsp:include page="../include/sidebar.jsp" />
    </aside>
    
    <!-- Content Wrapper -->
    <div class="content-wrapper" style="min-height:100vh;">
        <!-- Content Header -->
        <section class="content-header">
            <h1>
                🚀 Crypto Universe
                <small>실시간 암호화폐 대시보드</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">암호화폐 대시보드</li>
            </ol>
        </section>
        
        <!-- Main content -->
        <section class="content">
            <!-- 실시간 업데이트 표시 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-info">
                        <i class="fa fa-info-circle"></i>
                        <span class="real-time-indicator"></span>
                        실시간 데이터 업데이트 중... 마지막 업데이트: <span id="lastUpdate"></span>
                    </div>
                </div>
            </div>
            
            <!-- 시장 개요 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="market-overview">
                        <c:choose>
                            <c:when test="${not empty marketOverview}">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4><i class="fa fa-globe"></i> 전체 시가총액</h4>
                                        <h2>$<fmt:formatNumber value="${marketOverview.total_market_cap}" pattern="#,#0.0"/></h2>
                                        <small>24시간 변화: <c:choose>
                                            <c:when test="${marketOverview.market_cap_change_24h >= 0}">
                                                <span class="price-change-positive">
                                                    +<fmt:formatNumber value="${marketOverview.market_cap_change_24h}" pattern="#,##0.0"/>%
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="price-change-negative">
                                                    <fmt:formatNumber value="${marketOverview.market_cap_change_24h}" pattern="#,##0.0"/>%
                                                </span>
                                            </c:otherwise>
                                        </c:choose></small>
                                    </div>
                                    <div class="col-md-3">
                                        <h4><i class="fa fa-chart-line"></i> 24시간 거래량</h4>
                                        <h2>$<fmt:formatNumber value="${marketOverview.total_volume_24h}" pattern="#,#0.0"/></h2>
                                    </div>
                                    <div class="col-md-3">
                                        <h4><i class="fa fa-bitcoin"></i> 비트코인 지배율</h4>
                                        <h2><fmt:formatNumber value="${marketOverview.bitcoin_dominance}" pattern="#,#0.0"/>%</h2>
                                    </div>
                                    <div class="col-md-3">
                                        <h4><i class="fa fa-smile-o"></i> 공포&탐욕 지수</h4>
                                        <div class="fear-greed-indicator">
                                            <div class="fear-greed-pointer" id="fearGreedPointer"></div>
                                        </div>
                                        <h2 id="fearGreedValue"><c:out value='${marketOverview.fear_greed_index}' default='0'/></h2>
                                        <small>
                                            <c:choose>
                                                <c:when test="${marketOverview.fear_greed_index >= 70}">탐욕</c:when>
                                                <c:when test="${marketOverview.fear_greed_index >= 40}">중립</c:when>
                                                <c:otherwise>공포</c:otherwise>
                                            </c:choose>
                                        </small>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p>시장 개요 데이터가 없습니다.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- 실시간 암호화폐 차트 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-chart-line"></i> 실시간 암호화폐 차트</h3>
                        </div>
                        <div class="box-body">
                            <!-- TradingView Widget BEGIN -->
                            <div class="tradingview-widget-container" style="height:500px;">
                              <div id="tradingview_chart_crypto"></div>
                              <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                              <script type="text/javascript">
                              new TradingView.widget(
                                {
                                  "width": "100%",
                                  "height": 500,
                                  "symbol": "BINANCE:BTCUSDT",
                                  "interval": "60",
                                  "timezone": "Asia/Seoul",
                                  "theme": "light",
                                  "style": "1",
                                  "locale": "kr",
                                  "toolbar_bg": "#f1f3f6",
                                  "enable_publishing": false,
                                  "allow_symbol_change": true,
                                  "hide_side_toolbar": false,
                                  "container_id": "tradingview_chart_crypto"
                                }
                              );
                              </script>
                            </div>
                            <!-- TradingView Widget END -->
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Top 10 암호화폐 -->
            <div class="row">
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-trophy"></i> Top 10 암호화폐</h3>
                        </div>
                        <div class="box-body">
                            <c:choose>
                                <c:when test="${not empty topCoins}">
                                    <div class="row">
                                        <c:forEach items="${topCoins}" var="coin" varStatus="status">
                                            <c:if test="${status.index < 10}">
                                                <div class="col-md-6">
                                                    <div class="crypto-card ${coin.symbol.toLowerCase()}">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <div style="display: flex; align-items: center;">
                                                                    <img src="${coin.imageUrl}" alt="${coin.name}" class="crypto-icon" onerror="this.src='https://via.placeholder.com/40x40/667eea/ffffff?text=${coin.symbol}'">
                                                                    <div>
                                                                        <h4 style="margin: 0;">${coin.name} <span class="market-cap-badge">#${coin.rank}</span></h4>
                                                                        <p style="margin: 0; opacity: 0.8;">${coin.symbol}</p>
                                                                    </div>
                                                                </div>
                                                                <h3 style="margin: 10px 0;">$<fmt:formatNumber value="${coin.currentPrice}" pattern="#,##0.00"/></h3>
                                                                <p style="margin: 0;">
                                                                    <span class="${coin.changePercent24h >= 0 ? 'price-change-positive' : 'price-change-negative'}">
                                                                        ${coin.changePercent24h >= 0 ? '+' : ''}<fmt:formatNumber value="${coin.changePercent24h}" pattern="#,##0.00"/>%
                                                                    </span>
                                                                    <small style="opacity: 0.8;">24h</small>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div style="text-align: right;">
                                                                    <p style="margin: 0; font-size: 12px; opacity: 0.8;">시가총액</p>
                                                                    <p style="margin: 0; font-size: 14px;">$<fmt:formatNumber value="${coin.marketCap}" pattern="#,##0.0"/>B</p>
                                                                    <div class="volume-bar">
                                                                        <div class="volume-fill" style="width: ${coin.volume24h / 1000000000 * 100}%"></div>
                                                                    </div>
                                                                    <p style="margin: 5px 0 0 0; font-size: 12px; opacity: 0.8;">거래량</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div style="min-height:180px;display:flex;align-items:center;justify-content:center;">
                                        <p>암호화폐 데이터가 없습니다.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                
                <!-- 트렌딩 & AI 분석 -->
                <div class="col-md-4">
                    <!-- 트렌딩 코인 -->
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fire"></i> 트렌딩 코인</h3>
                        </div>
                        <div class="box-body">
                            <c:choose>
                                <c:when test="${not empty trendingCoins}">
                                    <c:forEach items="${trendingCoins}" var="coin" varStatus="status" end="4">
                                        <div class="trending-card">
                                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                                <div>
                                                    <strong>${coin.symbol}</strong>
                                                    <span class="trending-badge">HOT</span>
                                                </div>
                                                <div style="text-align: right;">
                                                    <div class="${coin.changePercent24h >= 0 ? 'price-change-positive' : 'price-change-negative'}">
                                                        ${coin.changePercent24h >= 0 ? '+' : ''}<fmt:formatNumber value="${coin.changePercent24h}" pattern="#,##0.0"/>%
                                                    </div>
                                                    <small style="opacity: 0.7;">$<fmt:formatNumber value="${coin.currentPrice}" pattern="#,##0.0000"/></small>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div style="min-height:180px;display:flex;align-items:center;justify-content:center;">
                                        <p>트렌딩 코인 데이터가 없습니다.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    
                    <!-- AI 분석 -->
                    <div class="ai-analysis-card">
                        <h4><i class="fa fa-robot"></i> AI 시장 분석</h4>
                        <c:choose>
                            <c:when test="${not empty topCoins}">
                                <div class="ai-score">
                                    <c:set var="avgScore" value="0"/>
                                    <c:forEach items="${topCoins}" var="coin" varStatus="status" end="9">
                                        <c:set var="avgScore" value="${avgScore + coin.aiScore}"/>
                                    </c:forEach>
                                    <c:set var="avgScore" value="${avgScore / 10}"/>
                                    <fmt:formatNumber value="${avgScore}" pattern="#,##0.0"/>
                                </div>
                                <div class="ai-recommendation ${avgScore >= 80 ? 'strong-buy' : avgScore >= 60 ? 'buy' : avgScore >= 40 ? 'hold' : avgScore >= 20 ? 'sell' : 'strong-sell'}">
                                    ${avgScore >= 80 ? 'Strong Buy' : avgScore >= 60 ? 'Buy' : avgScore >= 40 ? 'Hold' : avgScore >= 20 ? 'Sell' : 'Strong Sell'}
                                </div>
                                <p style="margin-top: 15px; font-size: 14px;">
                                    AI가 분석한 시장 전망: 현재 시장은 ${avgScore >= 70 ? '강한 상승' : avgScore >= 50 ? '중립적' : '하락'} 추세를 보이고 있습니다.
                                </p>
                            </c:when>
                            <c:otherwise>
                                <div style="min-height:180px;display:flex;align-items:center;justify-content:center;">
                                    <p>AI 분석 데이터가 없습니다.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <!-- 상승/하락 코인 -->
            <div class="row">
                <div class="col-md-6">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-arrow-up"></i> Top Gainers (24h)</h3>
                        </div>
                        <div class="box-body">
                            <c:choose>
                                <c:when test="${not empty gainersLosers}">
                                    <c:forEach items="${gainersLosers}" var="coin" varStatus="status" end="4">
                                        <c:if test="${coin.changePercent24h > 0}">
                                            <div class="trending-card">
                                                <div style="display: flex; justify-content: space-between; align-items: center;">
                                                    <div>
                                                        <strong>${coin.symbol}</strong>
                                                        <small style="opacity: 0.7;">${coin.name}</small>
                                                    </div>
                                                    <div style="text-align: right;">
                                                        <div class="price-change-positive">
                                                            +<fmt:formatNumber value="${coin.changePercent24h}" pattern="#,##0.00"/>%
                                                        </div>
                                                        <small style="opacity: 0.7;">$<fmt:formatNumber value="${coin.currentPrice}" pattern="#,##0.0000"/></small>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div style="min-height:180px;display:flex;align-items:center;justify-content:center;">
                                        <p>상승 코인 데이터가 없습니다.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="box box-warning">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-arrow-down"></i> Top Losers (24h)</h3>
                        </div>
                        <div class="box-body">
                            <c:choose>
                                <c:when test="${not empty gainersLosers}">
                                    <c:forEach items="${gainersLosers}" var="coin" varStatus="status" end="4">
                                        <c:if test="${coin.changePercent24h < 0}">
                                            <div class="trending-card">
                                                <div style="display: flex; justify-content: space-between; align-items: center;">
                                                    <div>
                                                        <strong>${coin.symbol}</strong>
                                                        <small style="opacity: 0.7;">${coin.name}</small>
                                                    </div>
                                                    <div style="text-align: right;">
                                                        <div class="price-change-negative">
                                                            <fmt:formatNumber value="${coin.changePercent24h}" pattern="#,##0.00"/>%
                                                        </div>
                                                        <small style="opacity: 0.7;">$<fmt:formatNumber value="${coin.currentPrice}" pattern="#,##0.0000"/></small>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div style="min-height:180px;display:flex;align-items:center;justify-content:center;">
                                        <p>하락 코인 데이터가 없습니다.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" />
</div>

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${pageContext.request.contextPath}/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/resources/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="${pageContext.request.contextPath}/resources/bower_components/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/resources/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- Date Picker -->
<script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Daterange picker -->
<script src="${pageContext.request.contextPath}/resources/bower_components/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- Slimscroll -->
<script src="${pageContext.request.contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/js/adminlte.min.js"></script>

<script>
// 실시간 업데이트 시뮬레이션
function updateLastUpdate() {
    const now = new Date();
    document.getElementById('lastUpdate').textContent = now.toLocaleTimeString();
}

// 5초마다 업데이트
setInterval(updateLastUpdate, 5000);
updateLastUpdate();

// 가격 변화 애니메이션
function animatePriceChanges() {
    const priceElements = document.querySelectorAll('.price-change-positive, .price-change-negative');
    priceElements.forEach(element => {
        element.style.transition = 'all 0.3s ease';
        element.style.transform = 'scale(1.1)';
        setTimeout(() => {
            element.style.transform = 'scale(1)';
        }, 300);
    });
}

// 10초마다 애니메이션 실행
setInterval(animatePriceChanges, 10000);

// 카드 호버 효과
document.querySelectorAll('.crypto-card').forEach(card => {
    card.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-10px) scale(1.02)';
    });
    
    card.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0) scale(1)';
    });
});

// 실시간 데이터 업데이트 시뮬레이션
function simulateRealTimeUpdates() {
    const priceElements = document.querySelectorAll('h3');
    priceElements.forEach(element => {
        if (element.textContent.includes('$')) {
            const currentPrice = parseFloat(element.textContent.replace(/[$,]/g, ''));
            const change = (Math.random() - 0.5) * 0.02; // ±1% 변화
            const newPrice = currentPrice * (1 + change);
            element.textContent = '$' + newPrice.toLocaleString('en-US', {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
        }
    });
}

// 30초마다 가격 업데이트
setInterval(simulateRealTimeUpdates, 30000);

// 공포&탐욕 지수 포인터 위치 JS로 처리
window.addEventListener('DOMContentLoaded', function() {
    var pointer = document.getElementById('fearGreedPointer');
    var value = document.getElementById('fearGreedValue');
    if(pointer && value) {
        var percent = parseFloat(value.textContent) || 0;
        pointer.style.left = percent + '%';
    }
});
</script>

</body>
</html> 