<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Market Trends - Finance AI</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
  <style>
    .trend-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
      margin-bottom: 20px;
      border-left: 5px solid #007bff;
    }
    .trend-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }
    .positive-change {
      color: #28a745;
      font-weight: bold;
    }
    .negative-change {
      color: #dc3545;
      font-weight: bold;
    }
    .economic-indicator {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border-radius: 15px;
      padding: 20px;
      margin-bottom: 20px;
    }
    .currency-card {
      background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
      color: white;
      border-radius: 10px;
      padding: 15px;
      margin-bottom: 15px;
    }
    .sentiment-indicator {
      padding: 10px;
      border-radius: 20px;
      font-weight: bold;
      text-align: center;
    }
    .positive-sentiment { background: #28a745; color: white; }
    .neutral-sentiment { background: #ffc107; color: black; }
    .negative-sentiment { background: #dc3545; color: white; }
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
        <i class="fa fa-trending-up"></i> 시장 트렌드 분석
        <small>글로벌 경제 지표 및 시장 동향</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/finance/dashboard">Finance</a></li>
        <li class="active">Market Trends</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- 경제 지표 -->
      <div class="row">
        <div class="col-lg-12">
          <div class="economic-indicator">
            <h3><i class="fa fa-chart-line"></i> 주요 경제 지표</h3>
            <div class="row">
              <div class="col-md-2">
                <h4>GDP 성장률</h4>
                <h2>${economicIndicators.get("gdp_growth").asDouble}%</h2>
              </div>
              <div class="col-md-2">
                <h4>인플레이션</h4>
                <h2>${economicIndicators.get("inflation_rate").asDouble}%</h2>
              </div>
              <div class="col-md-2">
                <h4>실업률</h4>
                <h2>${economicIndicators.get("unemployment_rate").asDouble}%</h2>
              </div>
              <div class="col-md-2">
                <h4>기준금리</h4>
                <h2>${economicIndicators.get("interest_rate").asDouble}%</h2>
              </div>
              <div class="col-md-2">
                <h4>소비자 신뢰도</h4>
                <h2>${economicIndicators.get("consumer_confidence").asDouble}</h2>
              </div>
              <div class="col-md-2">
                <h4>제조업 PMI</h4>
                <h2>${economicIndicators.get("manufacturing_pmi").asDouble}</h2>
              </div>
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
                    <small>달러/원</small>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>EUR/USD</h4>
                    <h3>${currencyRates.get("EUR_USD").asDouble}</h3>
                    <small>유로/달러</small>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>USD/JPY</h4>
                    <h3>${currencyRates.get("USD_JPY").asDouble}</h3>
                    <small>달러/엔</small>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>GBP/USD</h4>
                    <h3>${currencyRates.get("GBP_USD").asDouble}</h3>
                    <small>파운드/달러</small>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="currency-card">
                    <h4>USD/CNY</h4>
                    <h3>${currencyRates.get("USD_CNY").asDouble}</h3>
                    <small>달러/위안</small>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 섹터별 트렌드 -->
      <div class="row">
        <div class="col-lg-8">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-industry"></i> 섹터별 시장 트렌드</h3>
            </div>
            <div class="box-body">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>섹터</th>
                      <th>변동률</th>
                      <th>거래량</th>
                      <th>시장 심리</th>
                      <th>트렌드</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${trends}" var="trend">
                      <tr class="trend-card">
                        <td><strong>${trend.sector}</strong></td>
                        <td class="${trend.changePercent > 0 ? 'positive-change' : trend.changePercent < 0 ? 'negative-change' : ''}">
                          ${trend.changePercent > 0 ? '+' : ''}${trend.changePercent}%
                        </td>
                        <td>${trend.volume}</td>
                        <td>
                          <span class="sentiment-indicator ${trend.sentiment == 'Positive' ? 'positive-sentiment' : trend.sentiment == 'Neutral' ? 'neutral-sentiment' : 'negative-sentiment'}">
                            ${trend.sentiment}
                          </span>
                        </td>
                        <td>
                          <span class="badge badge-${trend.trend == 'Bullish' ? 'success' : trend.trend == 'Bearish' ? 'danger' : 'warning'}">
                            ${trend.trend}
                          </span>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-4">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-chart-pie"></i> 섹터 분포</h3>
            </div>
            <div class="box-body">
              <canvas id="sectorChart" width="400" height="300"></canvas>
            </div>
          </div>
        </div>
      </div>

      <!-- 시장 분석 차트 -->
      <div class="row">
        <div class="col-lg-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-chart-line"></i> 경제 지표 트렌드</h3>
            </div>
            <div class="box-body">
              <canvas id="economicChart" width="400" height="300"></canvas>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-chart-bar"></i> 환율 변동</h3>
            </div>
            <div class="box-body">
              <canvas id="currencyChart" width="400" height="300"></canvas>
            </div>
          </div>
        </div>
      </div>

      <!-- AI 시장 분석 -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-robot"></i> AI 시장 분석</h3>
            </div>
            <div class="box-body">
              <div class="row">
                <div class="col-md-6">
                  <h4>📈 상승 가능성 높은 섹터</h4>
                  <ul>
                    <li><strong>기술 (Technology):</strong> AI, 클라우드 컴퓨팅 성장으로 인한 강세 지속 예상</li>
                    <li><strong>헬스케어 (Healthcare):</strong> 바이오테크 혁신과 고령화로 인한 수요 증가</li>
                    <li><strong>재생에너지:</strong> 친환경 정책과 ESG 투자 확대</li>
                  </ul>
                </div>
                <div class="col-md-6">
                  <h4>⚠️ 주의가 필요한 섹터</h4>
                  <ul>
                    <li><strong>전통 에너지:</strong> 친환경 정책으로 인한 규제 강화</li>
                    <li><strong>부동산:</strong> 금리 상승으로 인한 부담 증가</li>
                    <li><strong>소비재:</strong> 인플레이션 압박과 소비 심리 위축</li>
                  </ul>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-md-12">
                  <h4>🤖 AI 예측 모델 분석</h4>
                  <p>현재 시장은 기술주 중심의 분화가 심화되고 있으며, AI 분석 결과 향후 3-6개월간 
                  기술 섹터의 상승 모멘텀이 지속될 것으로 예상됩니다. 다만 글로벌 경제 불확실성과 
                  금리 정책 변화에 따른 변동성 확대 가능성도 고려해야 합니다.</p>
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

<script>
// 섹터 분포 차트
const sectorCtx = document.getElementById('sectorChart').getContext('2d');
new Chart(sectorCtx, {
  type: 'doughnut',
  data: {
    labels: [
      <c:forEach items="${trends}" var="trend" varStatus="status">
        '${trend.sector}'<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ],
    datasets: [{
      data: [
        <c:forEach items="${trends}" var="trend" varStatus="status">
          ${Math.abs(trend.changePercent)}<c:if test="${!status.last}">,</c:if>
        </c:forEach>
      ],
      backgroundColor: [
        'rgba(255, 99, 132, 0.8)',
        'rgba(54, 162, 235, 0.8)',
        'rgba(255, 206, 86, 0.8)',
        'rgba(75, 192, 192, 0.8)',
        'rgba(153, 102, 255, 0.8)',
        'rgba(255, 159, 64, 0.8)'
      ]
    }]
  },
  options: {
    responsive: true
  }
});

// 경제 지표 트렌드 차트
const economicCtx = document.getElementById('economicChart').getContext('2d');
new Chart(economicCtx, {
  type: 'line',
  data: {
    labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
    datasets: [{
      label: 'GDP 성장률',
      data: [2.1, 2.3, 2.5, 2.4, 2.6, ${economicIndicators.get("gdp_growth").asDouble}],
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }, {
      label: '인플레이션',
      data: [2.5, 2.8, 3.1, 2.9, 3.2, ${economicIndicators.get("inflation_rate").asDouble}],
      borderColor: 'rgb(255, 99, 132)',
      tension: 0.1
    }]
  },
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: false
      }
    }
  }
});

// 환율 변동 차트
const currencyCtx = document.getElementById('currencyChart').getContext('2d');
new Chart(currencyCtx, {
  type: 'bar',
  data: {
    labels: ['USD/KRW', 'EUR/USD', 'USD/JPY', 'GBP/USD', 'USD/CNY'],
    datasets: [{
      label: '현재 환율',
      data: [
        ${currencyRates.get("USD_KRW").asDouble},
        ${currencyRates.get("EUR_USD").asDouble},
        ${currencyRates.get("USD_JPY").asDouble},
        ${currencyRates.get("GBP_USD").asDouble},
        ${currencyRates.get("USD_CNY").asDouble}
      ],
      backgroundColor: 'rgba(54, 162, 235, 0.8)'
    }]
  },
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: false
      }
    }
  }
});

// 실시간 데이터 업데이트 시뮬레이션
setInterval(function() {
  $('.currency-card h3').each(function() {
    const currentValue = parseFloat($(this).text());
    const change = (Math.random() - 0.5) * 0.1;
    const newValue = currentValue + change;
    $(this).text(newValue.toFixed(2));
  });
}, 10000);
</script>
</body>
</html> 