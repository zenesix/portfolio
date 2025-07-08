<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AI Analysis - Finance AI</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
  <style>
    .ai-header {
      background: linear-gradient(135deg, #ff6b6b 0%, #4ecdc4 100%);
      color: white;
      border-radius: 15px;
      padding: 30px;
      margin-bottom: 20px;
      text-align: center;
    }
    .ai-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
      margin-bottom: 20px;
      border-left: 5px solid #ff6b6b;
    }
    .ai-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }
    .ai-score {
      font-size: 2em;
      font-weight: bold;
      background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .recommendation-badge {
      padding: 10px 20px;
      border-radius: 25px;
      font-size: 1.1em;
      font-weight: bold;
    }
    .strong-buy { background: #28a745; color: white; }
    .buy { background: #007bff; color: white; }
    .hold { background: #ffc107; color: black; }
    .sell { background: #dc3545; color: white; }
    .strong-sell { background: #6c757d; color: white; }
    .ai-insight {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border-radius: 15px;
      padding: 25px;
      margin-bottom: 20px;
    }
    .prediction-card {
      background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
      color: white;
      border-radius: 15px;
      padding: 20px;
      margin-bottom: 20px;
    }
    .risk-indicator {
      padding: 8px 15px;
      border-radius: 20px;
      font-weight: bold;
      font-size: 0.9em;
    }
    .low-risk { background: #28a745; color: white; }
    .medium-risk { background: #ffc107; color: black; }
    .high-risk { background: #dc3545; color: white; }
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
        <i class="fa fa-robot"></i> AI 분석 센터
        <small>인공지능 기반 주식 분석 및 예측</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/finance/dashboard">Finance</a></li>
        <li class="active">AI Analysis</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- AI 헤더 -->
      <div class="ai-header">
        <h2><i class="fa fa-robot"></i> AI 분석 엔진</h2>
        <p>머신러닝과 딥러닝을 활용한 실시간 주식 분석 및 예측 시스템</p>
        <div class="row">
          <div class="col-md-3">
            <h4>분석 정확도</h4>
            <h3>87.3%</h3>
          </div>
          <div class="col-md-3">
            <h4>처리 속도</h4>
            <h3>0.2초</h3>
          </div>
          <div class="col-md-3">
            <h4>분석 종목</h4>
            <h3>2,847개</h3>
          </div>
          <div class="col-md-3">
            <h4>업데이트</h4>
            <h3>실시간</h3>
          </div>
        </div>
      </div>

      <!-- AI 인사이트 -->
      <div class="ai-insight">
        <h3><i class="fa fa-lightbulb-o"></i> AI 시장 인사이트</h3>
        <div class="row">
          <div class="col-md-6">
            <h4>📈 상승 예상 종목</h4>
            <ul>
              <li><strong>AAPL:</strong> 신제품 출시와 서비스 매출 증가로 15% 상승 예상</li>
              <li><strong>NVDA:</strong> AI 칩 수요 증가로 25% 상승 예상</li>
              <li><strong>TSLA:</strong> 전기차 시장 확대로 20% 상승 예상</li>
            </ul>
          </div>
          <div class="col-md-6">
            <h4>⚠️ 주의 필요 종목</h4>
            <ul>
              <li><strong>META:</strong> 규제 압박과 광고 수익 감소 우려</li>
              <li><strong>NFLX:</strong> 스트리밍 경쟁 심화로 수익성 압박</li>
              <li><strong>PYPL:</strong> 암호화폐 변동성으로 인한 리스크 증가</li>
            </ul>
          </div>
        </div>
      </div>

      <!-- AI 분석 결과 -->
      <div class="row">
        <c:forEach items="${stocks}" var="stock" varStatus="status">
          <c:if test="${status.index < 12}">
            <div class="col-lg-4 col-md-6">
              <div class="ai-card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-8">
                      <h4><strong>${stock.symbol}</strong></h4>
                      <p class="text-muted">${stock.companyName}</p>
                      <span class="risk-indicator ${stock.riskLevel == 'Low' ? 'low-risk' : stock.riskLevel == 'Medium' ? 'medium-risk' : 'high-risk'}">
                        ${stock.riskLevel} Risk
                      </span>
                    </div>
                    <div class="col-md-4 text-right">
                      <div class="ai-score">${stock.aiScore}</div>
                      <span class="recommendation-badge ${stock.aiRecommendation.toLowerCase().replace(' ', '-')}">
                        ${stock.aiRecommendation}
                      </span>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-md-6">
                      <small class="text-muted">현재가</small><br>
                      <strong>$${stock.currentPrice}</strong>
                    </div>
                    <div class="col-md-6 text-right">
                      <small class="text-muted">목표가</small><br>
                      <strong>$${stock.targetPrice}</strong>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-md-6">
                      <small class="text-muted">예상 수익률</small><br>
                      <strong>${((stock.targetPrice - stock.currentPrice) / stock.currentPrice * 100)}%</strong>
                    </div>
                    <div class="col-md-6 text-right">
                      <small class="text-muted">변동성</small><br>
                      <strong>${stock.volatility}</strong>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:if>
        </c:forEach>
      </div>

      <!-- AI 예측 모델 -->
      <div class="row">
        <div class="col-lg-6">
          <div class="prediction-card">
            <h4><i class="fa fa-chart-line"></i> 6개월 예측 모델</h4>
            <canvas id="predictionChart" width="400" height="300"></canvas>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="prediction-card">
            <h4><i class="fa fa-chart-pie"></i> AI 신뢰도 분포</h4>
            <canvas id="confidenceChart" width="400" height="300"></canvas>
          </div>
        </div>
      </div>

      <!-- AI 분석 상세 -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-cogs"></i> AI 분석 엔진 상세</h3>
            </div>
            <div class="box-body">
              <div class="row">
                <div class="col-md-4">
                  <h4>🤖 머신러닝 모델</h4>
                  <ul>
                    <li>랜덤 포레스트 (Random Forest)</li>
                    <li>그래디언트 부스팅 (Gradient Boosting)</li>
                    <li>서포트 벡터 머신 (SVM)</li>
                    <li>신경망 (Neural Network)</li>
                  </ul>
                </div>
                <div class="col-md-4">
                  <h4>📊 분석 지표</h4>
                  <ul>
                    <li>기술적 지표 (RSI, MACD, 이동평균)</li>
                    <li>기본적 지표 (P/E, P/B, ROE)</li>
                    <li>시장 심리 지표</li>
                    <li>거시경제 지표</li>
                  </ul>
                </div>
                <div class="col-md-4">
                  <h4>🎯 예측 정확도</h4>
                  <ul>
                    <li>단기 예측 (1주): 92%</li>
                    <li>중기 예측 (1개월): 87%</li>
                    <li>장기 예측 (6개월): 78%</li>
                    <li>시장 방향성: 85%</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 실시간 AI 분석 -->
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-refresh"></i> 실시간 AI 분석 로그</h3>
            </div>
            <div class="box-body">
              <div id="aiLog" style="height: 300px; overflow-y: auto; background: #f8f9fa; padding: 15px; border-radius: 5px; font-family: monospace;">
                <div class="log-entry">[2024-01-15 14:30:25] AI 분석 시작 - 글로벌 시장 데이터 수집 중...</div>
                <div class="log-entry">[2024-01-15 14:30:26] 기술적 지표 분석 완료 - AAPL 상승 신호 감지</div>
                <div class="log-entry">[2024-01-15 14:30:27] 기본적 분석 완료 - NVDA 밸류에이션 매력적</div>
                <div class="log-entry">[2024-01-15 14:30:28] 시장 심리 분석 완료 - 긍정적 전망</div>
                <div class="log-entry">[2024-01-15 14:30:29] AI 예측 모델 실행 - 결과 업데이트 완료</div>
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
// 예측 모델 차트
const predictionCtx = document.getElementById('predictionChart').getContext('2d');
new Chart(predictionCtx, {
  type: 'line',
  data: {
    labels: ['현재', '1개월', '2개월', '3개월', '4개월', '5개월', '6개월'],
    datasets: [{
      label: '예상 주가',
      data: [150, 155, 160, 165, 170, 175, 180],
      borderColor: 'rgba(255, 255, 255, 1)',
      backgroundColor: 'rgba(255, 255, 255, 0.1)',
      tension: 0.1
    }]
  },
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: false,
        grid: {
          color: 'rgba(255, 255, 255, 0.2)'
        },
        ticks: {
          color: 'white'
        }
      },
      x: {
        grid: {
          color: 'rgba(255, 255, 255, 0.2)'
        },
        ticks: {
          color: 'white'
        }
      }
    },
    plugins: {
      legend: {
        labels: {
          color: 'white'
        }
      }
    }
  }
});

// AI 신뢰도 차트
const confidenceCtx = document.getElementById('confidenceChart').getContext('2d');
new Chart(confidenceCtx, {
  type: 'doughnut',
  data: {
    labels: ['높은 신뢰도 (80%+)', '보통 신뢰도 (60-80%)', '낮은 신뢰도 (<60%)'],
    datasets: [{
      data: [45, 35, 20],
      backgroundColor: [
        'rgba(255, 255, 255, 0.8)',
        'rgba(255, 255, 255, 0.6)',
        'rgba(255, 255, 255, 0.4)'
      ],
      borderColor: 'rgba(255, 255, 255, 1)',
      borderWidth: 2
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        labels: {
          color: 'white'
        }
      }
    }
  }
});

// 실시간 AI 로그 업데이트
function addLogEntry(message) {
  const now = new Date();
  const timestamp = now.toLocaleString('ko-KR');
  const logEntry = `<div class="log-entry">[${timestamp}] ${message}</div>`;
  $('#aiLog').append(logEntry);
  $('#aiLog').scrollTop($('#aiLog')[0].scrollHeight);
}

// AI 분석 시뮬레이션
setInterval(function() {
  const messages = [
    'AI 분석 시작 - 글로벌 시장 데이터 수집 중...',
    '기술적 지표 분석 완료 - 상승 신호 감지',
    '기본적 분석 완료 - 밸류에이션 매력적',
    '시장 심리 분석 완료 - 긍정적 전망',
    'AI 예측 모델 실행 - 결과 업데이트 완료',
    '리스크 분석 완료 - 포트폴리오 최적화',
    '실시간 데이터 업데이트 - 시장 변동성 모니터링'
  ];
  
  const randomMessage = messages[Math.floor(Math.random() * messages.length)];
  addLogEntry(randomMessage);
}, 3000);

// AI 점수 실시간 업데이트
setInterval(function() {
  $('.ai-score').each(function() {
    const currentScore = parseFloat($(this).text());
    const change = (Math.random() - 0.5) * 2;
    const newScore = Math.max(0, Math.min(100, currentScore + change));
    $(this).text(newScore.toFixed(1));
  });
}, 5000);
</script>
</body>
</html> 