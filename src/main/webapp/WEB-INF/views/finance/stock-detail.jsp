<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Finance AI - ${stock.symbol} 상세정보</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/finance-ai.css">
  
  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- TradingView Widget -->
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  
  <style>
    .stock-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 30px 0;
      margin-bottom: 30px;
    }
    
    .stock-price {
      font-size: 3em;
      font-weight: bold;
      margin: 10px 0;
    }
    
    .stock-change {
      font-size: 1.5em;
      margin: 10px 0;
    }
    
    .positive-change {
      color: #28a745;
    }
    
    .negative-change {
      color: #dc3545;
    }
    
    .neutral-change {
      color: #6c757d;
    }
    
    .metric-card {
      background: white;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      border-left: 4px solid #007bff;
    }
    
    .ai-score {
      background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
      color: white;
      padding: 10px 20px;
      border-radius: 20px;
      font-weight: bold;
      font-size: 1.2em;
    }
    
    .recommendation-badge {
      padding: 8px 16px;
      border-radius: 20px;
      font-weight: bold;
      font-size: 0.9em;
    }
    
    .strong-buy { background-color: #28a745; color: white; }
    .buy { background-color: #17a2b8; color: white; }
    .hold { background-color: #ffc107; color: black; }
    .sell { background-color: #fd7e14; color: white; }
    .strong-sell { background-color: #dc3545; color: white; }
    
    .chart-container {
      background: white;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .news-item {
      border-bottom: 1px solid #eee;
      padding: 15px 0;
    }
    
    .news-item:last-child {
      border-bottom: none;
    }
    
    .news-title {
      font-weight: bold;
      color: #333;
      margin-bottom: 5px;
    }
    
    .news-summary {
      color: #666;
      font-size: 0.9em;
    }
    
    .news-time {
      color: #999;
      font-size: 0.8em;
    }
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">
    <a href="/" class="logo">
      <span class="logo-mini"><b>F</b>AI</span>
      <span class="logo-lg"><b>Finance</b>AI</span>
    </a>
    <%@include file="../include/header.jsp" %>
  </header>

  <!-- Left side column -->
  <aside class="main-sidebar">
    <section class="sidebar">
      <%@include file="../include/sidebar.jsp" %>
    </section>
  </aside>

  <!-- Content Wrapper -->
  <div class="content-wrapper">
    <!-- Content Header -->
    <section class="content-header">
      <h1>
        <i class="fa fa-chart-line"></i> ${stock.symbol} 상세 분석
        <small>${stock.companyName}</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/finance/dashboard">Finance</a></li>
        <li><a href="/finance/stocks">Stocks</a></li>
        <li class="active">${stock.symbol}</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Stock Header -->
      <div class="stock-header">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-8">
              <h1><strong>${stock.symbol}</strong> - ${stock.companyName}</h1>
              <p class="lead">${stock.sector} • ${stock.country}</p>
            </div>
            <div class="col-md-4 text-right">
              <div class="stock-price">$${stock.currentPrice}</div>
              <div class="stock-change ${stock.changePercent > 0 ? 'positive-change' : stock.changePercent < 0 ? 'negative-change' : 'neutral-change'}">
                ${stock.changePercent > 0 ? '+' : ''}${stock.changePercent}% ($${stock.changeAmount})
              </div>
              <div class="ai-score">AI 점수: ${stock.aiScore}</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Main content -->
      <div class="container-fluid">
        <!-- 주요 지표 -->
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <div class="metric-card">
              <h4><i class="fa fa-chart-line"></i> 시가총액</h4>
              <h3>$${stock.marketCap}</h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="metric-card">
              <h4><i class="fa fa-exchange"></i> 거래량</h4>
              <h3>${stock.volume}</h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="metric-card">
              <h4><i class="fa fa-percentage"></i> P/E 비율</h4>
              <h3>${stock.peRatio}</h3>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="metric-card">
              <h4><i class="fa fa-robot"></i> AI 추천</h4>
              <span class="recommendation-badge ${stock.aiRecommendation.toLowerCase().replace(' ', '-')}">
                ${stock.aiRecommendation}
              </span>
            </div>
          </div>
        </div>

        <!-- 차트와 분석 -->
        <div class="row">
          <div class="col-lg-8">
            <div class="chart-container">
              <h4><i class="fa fa-chart-area"></i> 주가 차트</h4>
              <div id="tradingview_chart" style="height: 400px;"></div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="chart-container">
              <h4><i class="fa fa-chart-pie"></i> AI 분석</h4>
              <canvas id="aiAnalysisChart" width="300" height="300"></canvas>
            </div>
          </div>
        </div>

        <!-- 상세 정보 -->
        <div class="row">
          <div class="col-lg-6">
            <div class="chart-container">
              <h4><i class="fa fa-info-circle"></i> 기본 정보</h4>
              <table class="table table-striped">
                <tr>
                  <td><strong>52주 최고가</strong></td>
                  <td>$${stock.fiftyTwoWeekHigh}</td>
                </tr>
                <tr>
                  <td><strong>52주 최저가</strong></td>
                  <td>$${stock.fiftyTwoWeekLow}</td>
                </tr>
                <tr>
                  <td><strong>배당률</strong></td>
                  <td>${stock.dividendYield}%</td>
                </tr>
                <tr>
                  <td><strong>베타</strong></td>
                  <td>${stock.beta}</td>
                </tr>
                <tr>
                  <td><strong>변동성</strong></td>
                  <td>${stock.volatility}</td>
                </tr>
              </table>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="chart-container">
              <h4><i class="fa fa-newspaper-o"></i> 최신 뉴스</h4>
              <div class="news-item">
                <div class="news-title">${stock.symbol} 실적 발표 예정</div>
                <div class="news-summary">다음 분기 실적 발표가 예상보다 좋을 것으로 전망됩니다.</div>
                <div class="news-time">2시간 전</div>
              </div>
              <div class="news-item">
                <div class="news-title">새로운 제품 출시 계획 발표</div>
                <div class="news-summary">혁신적인 신제품 라인업으로 시장 점유율 확대를 기대합니다.</div>
                <div class="news-time">5시간 전</div>
              </div>
              <div class="news-item">
                <div class="news-title">전략적 파트너십 체결</div>
                <div class="news-summary">주요 경쟁사와의 전략적 제휴로 시너지 효과를 기대합니다.</div>
                <div class="news-time">1일 전</div>
              </div>
            </div>
          </div>
        </div>

        <!-- AI 예측 -->
        <div class="row">
          <div class="col-lg-12">
            <div class="chart-container">
              <h4><i class="fa fa-crystal-ball"></i> AI 6개월 예측</h4>
              <div class="row">
                <div class="col-md-3">
                  <div class="text-center">
                    <h3>$${stock.targetPrice}</h3>
                    <p>목표가</p>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="text-center">
                    <h3>${((stock.targetPrice - stock.currentPrice) / stock.currentPrice * 100)}%</h3>
                    <p>예상 수익률</p>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="text-center">
                    <h3>${stock.riskLevel}</h3>
                    <p>리스크 레벨</p>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="text-center">
                    <h3>${stock.confidenceLevel}%</h3>
                    <p>AI 신뢰도</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- Footer -->
  <%@include file="../include/footer.jsp" %>
</div>

<!-- Scripts -->
<script src="${contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<script src="${contextPath}/resources/bower_components/chart.js/Chart.js"></script>
<script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>

<script>
// TradingView 차트
new TradingView.widget({
  "width": "100%",
  "height": 400,
  "symbol": "NASDAQ:AAPL",
  "interval": "D",
  "timezone": "Asia/Seoul",
  "theme": "light",
  "style": "1",
  "locale": "kr",
  "toolbar_bg": "#f1f3f6",
  "enable_publishing": false,
  "hide_side_toolbar": false,
  "allow_symbol_change": true,
  "container_id": "tradingview_chart"
});

// AI 분석 차트
const aiCtx = document.getElementById('aiAnalysisChart').getContext('2d');
new Chart(aiCtx, {
  type: 'doughnut',
  data: {
    labels: ['매수 신호', '중립', '매도 신호'],
    datasets: [{
      data: [75, 15, 10],
      backgroundColor: [
        'rgba(40, 167, 69, 0.8)',
        'rgba(255, 193, 7, 0.8)',
        'rgba(220, 53, 69, 0.8)'
      ],
      borderColor: [
        'rgba(40, 167, 69, 1)',
        'rgba(255, 193, 7, 1)',
        'rgba(220, 53, 69, 1)'
      ],
      borderWidth: 2
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'bottom'
      }
    }
  }
});

// 실시간 가격 업데이트 시뮬레이션
setInterval(function() {
  const priceElement = document.querySelector('.stock-price');
  const changeElement = document.querySelector('.stock-change');
  
  if (priceElement && changeElement) {
    const currentPrice = parseFloat(priceElement.textContent.replace('$', ''));
    const change = (Math.random() - 0.5) * 2;
    const newPrice = currentPrice + change;
    const changePercent = (change / currentPrice) * 100;
    
    priceElement.textContent = '$' + newPrice.toFixed(2);
    changeElement.textContent = 
      (changePercent > 0 ? '+' : '') + changePercent.toFixed(2) + '% ($' + change.toFixed(2) + ')';
    
    changeElement.className = 
      'stock-change ' + (changePercent > 0 ? 'positive-change' : changePercent < 0 ? 'negative-change' : 'neutral-change');
  }
}, 5000);
</script>
</body>
</html> 