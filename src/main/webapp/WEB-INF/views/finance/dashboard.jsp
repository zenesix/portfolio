<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Global Finance AI Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- TradingView Widget -->
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  
  <style>
    .finance-card {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
    }
    .finance-card:hover {
      transform: translateY(-5px);
    }
    .stock-card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      transition: all 0.3s ease;
      border-left: 4px solid #007bff;
    }
    .stock-card:hover {
      box-shadow: 0 10px 25px rgba(0,0,0,0.15);
      transform: translateY(-2px);
    }
    .positive-change {
      color: #28a745;
      font-weight: bold;
    }
    .negative-change {
      color: #dc3545;
      font-weight: bold;
    }
    .neutral-change {
      color: #6c757d;
      font-weight: bold;
    }
    .ai-score {
      background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      font-weight: bold;
      font-size: 1.2em;
    }
    .market-indicator {
      padding: 15px;
      border-radius: 10px;
      margin-bottom: 15px;
      background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
      color: white;
    }
    .currency-card {
      background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
      color: white;
      border-radius: 10px;
      padding: 15px;
      margin-bottom: 15px;
    }
    .tradingview-widget {
      border-radius: 10px;
      overflow: hidden;
    }
    .real-time-indicator {
      animation: pulse 2s infinite;
    }
    @keyframes pulse {
      0% { opacity: 1; }
      50% { opacity: 0.7; }
      100% { opacity: 1; }
    }
    .glass-effect {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.2);
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
        🌍 Global Finance AI Dashboard
        <small>실시간 글로벌 금융/경제/주식 AI 분석</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Finance Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- 실시간 시장 상태 -->
      <div class="row">
        <div class="col-lg-12">
          <div class="market-indicator">
            <div class="row">
              <div class="col-md-3">
                <h4><i class="fa fa-globe"></i> 글로벌 시장</h4>
                <p class="real-time-indicator">실시간 업데이트 중...</p>
              </div>
              <div class="col-md-3">
                <h4><i class="fa fa-clock-o"></i> 마지막 업데이트</h4>
                <p id="lastUpdate">${java.util.Date}</p>
              </div>
              <div class="col-md-3">
                <h4><i class="fa fa-robot"></i> AI 분석 상태</h4>
                <p class="ai-score">활성화</p>
              </div>
              <div class="col-md-3">
                <h4><i class="fa fa-signal"></i> 데이터 신뢰도</h4>
                <p>99.8%</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 주요 지표 카드들 -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <div class="finance-card">
            <div class="inner">
              <h3>${economicIndicators.get("gdp_growth").asDouble}%</h3>
              <p>GDP 성장률</p>
            </div>
            <div class="icon">
              <i class="fa fa-chart-line"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="finance-card">
            <div class="inner">
              <h3>${economicIndicators.get("inflation_rate").asDouble}%</h3>
              <p>인플레이션</p>
            </div>
            <div class="icon">
              <i class="fa fa-percentage"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="finance-card">
            <div class="inner">
              <h3>${economicIndicators.get("interest_rate").asDouble}%</h3>
              <p>기준금리</p>
            </div>
            <div class="icon">
              <i class="fa fa-bank"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="finance-card">
            <div class="inner">
              <h3>${economicIndicators.get("consumer_confidence").asDouble}</h3>
              <p>소비자 신뢰도</p>
            </div>
            <div class="icon">
              <i class="fa fa-users"></i>
            </div>
          </div>
        </div>
      </div>

      <!-- 환율 정보 -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-exchange"></i> 실시간 환율</h3>
            </div>
            <div class="box-body">
              <div class="row">
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>USD/KRW</h4>
                    <h3>${currencyRates.get("USD_KRW").asDouble}</h3>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>EUR/USD</h4>
                    <h3>${currencyRates.get("EUR_USD").asDouble}</h3>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>USD/JPY</h4>
                    <h3>${currencyRates.get("USD_JPY").asDouble}</h3>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>GBP/USD</h4>
                    <h3>${currencyRates.get("GBP_USD").asDouble}</h3>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>USD/CNY</h4>
                    <h3>${currencyRates.get("USD_CNY").asDouble}</h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 글로벌 주식 시장 -->
      <div class="row">
        <div class="col-lg-8">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-globe"></i> 글로벌 주요 주식</h3>
            </div>
            <div class="box-body">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>심볼</th>
                      <th>회사명</th>
                      <th>현재가</th>
                      <th>변동</th>
                      <th>거래량</th>
                      <th>AI 점수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${globalStocks}" var="stock" varStatus="status">
                      <c:if test="${status.index < 10}">
                        <tr class="stock-card">
                          <td><strong>${stock.symbol}</strong></td>
                          <td>${stock.companyName}</td>
                          <td>$${stock.currentPrice}</td>
                          <td class="${stock.changePercent > 0 ? 'positive-change' : stock.changePercent < 0 ? 'negative-change' : 'neutral-change'}">
                            ${stock.changePercent > 0 ? '+' : ''}${stock.changePercent}%
                          </td>
                          <td>${stock.volume}</td>
                          <td><span class="ai-score">${stock.aiScore}</span></td>
                        </tr>
                      </c:if>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        <div class="col-lg-4">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-trending-up"></i> 섹터별 트렌드</h3>
            </div>
            <div class="box-body">
              <canvas id="sectorChart" width="400" height="300"></canvas>
            </div>
          </div>
        </div>
      </div>

      <!-- TradingView 차트 -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-chart-area"></i> 실시간 글로벌 시장 차트</h3>
            </div>
            <div class="box-body">
              <div class="tradingview-widget">
                <div id="tradingview_chart"></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- AI 분석 인사이트 -->
      <div class="row">
        <div class="col-lg-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-robot"></i> AI 시장 분석</h3>
            </div>
            <div class="box-body">
              <div class="glass-effect" style="padding: 20px; border-radius: 10px;">
                <h4>🤖 AI 인사이트</h4>
                <p>현재 글로벌 시장은 기술주 중심의 상승 모멘텀을 보이고 있습니다. 
                AI 분석 결과, 향후 6개월간 기술 섹터의 강세가 지속될 것으로 예상됩니다.</p>
                <ul>
                  <li>📈 기술주: 강력한 매수 신호</li>
                  <li>📊 금융주: 중립적 관망</li>
                  <li>⚡ 에너지주: 리스크 관리 필요</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-exclamation-triangle"></i> 리스크 알림</h3>
            </div>
            <div class="box-body">
              <div class="alert alert-warning">
                <h4><i class="fa fa-warning"></i> 주의사항</h4>
                <p>• 글로벌 경제 불확실성 증가</p>
                <p>• 환율 변동성 확대</p>
                <p>• 섹터별 분화 심화</p>
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

<script>
// 섹터별 트렌드 차트
const sectorData = {
  labels: ['Technology', 'Healthcare', 'Finance', 'Consumer', 'Energy', 'Industrial'],
  datasets: [{
    label: '섹터별 성과 (%)',
    data: [
      <c:forEach items="${marketTrends}" var="trend" varStatus="status">
        ${trend.changePercent}<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ],
    backgroundColor: [
      'rgba(255, 99, 132, 0.8)',
      'rgba(54, 162, 235, 0.8)',
      'rgba(255, 206, 86, 0.8)',
      'rgba(75, 192, 192, 0.8)',
      'rgba(153, 102, 255, 0.8)',
      'rgba(255, 159, 64, 0.8)'
    ],
    borderColor: [
      'rgba(255, 99, 132, 1)',
      'rgba(54, 162, 235, 1)',
      'rgba(255, 206, 86, 1)',
      'rgba(75, 192, 192, 1)',
      'rgba(153, 102, 255, 1)',
      'rgba(255, 159, 64, 1)'
    ],
    borderWidth: 2
  }]
};

const ctx = document.getElementById('sectorChart').getContext('2d');
new Chart(ctx, {
  type: 'bar',
  data: sectorData,
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});

// TradingView 위젯
new TradingView.widget({
  "width": "100%",
  "height": 500,
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

// 실시간 업데이트 시뮬레이션
setInterval(function() {
  const now = new Date();
  document.getElementById('lastUpdate').textContent = now.toLocaleString('ko-KR');
}, 5000);

// 주식 카드 클릭 이벤트
document.querySelectorAll('.stock-card').forEach(card => {
  card.addEventListener('click', function() {
    const symbol = this.querySelector('td:first-child strong').textContent;
    window.location.href = `/finance/stock/${symbol}`;
  });
});
</script>
</body>
</html> 