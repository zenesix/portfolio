<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Global Stocks - Finance AI</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <style>
    .stock-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
      margin-bottom: 20px;
      cursor: pointer;
      border-left: 5px solid #007bff;
    }
    .stock-card:hover {
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
    .neutral-change {
      color: #6c757d;
      font-weight: bold;
    }
    .ai-score {
      background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      font-weight: bold;
    }
    .filter-section {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border-radius: 15px;
      padding: 20px;
      margin-bottom: 20px;
    }
    .country-badge {
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 0.8em;
      font-weight: bold;
    }
    .us-badge { background: #007bff; color: white; }
    .kr-badge { background: #28a745; color: white; }
    .jp-badge { background: #dc3545; color: white; }
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
        <i class="fa fa-globe"></i> 글로벌 주식 시장
        <small>실시간 글로벌 주식 정보 및 AI 분석</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/finance/dashboard">Finance</a></li>
        <li class="active">Global Stocks</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- 필터 섹션 -->
      <div class="filter-section">
        <div class="row">
          <div class="col-md-3">
            <label>국가별 필터:</label>
            <select class="form-control" id="countryFilter">
              <option value="">전체</option>
              <option value="US">미국</option>
              <option value="KR">한국</option>
              <option value="JP">일본</option>
            </select>
          </div>
          <div class="col-md-3">
            <label>섹터별 필터:</label>
            <select class="form-control" id="sectorFilter">
              <option value="">전체</option>
              <option value="Technology">기술</option>
              <option value="Healthcare">헬스케어</option>
              <option value="Finance">금융</option>
              <option value="Consumer">소비재</option>
              <option value="Energy">에너지</option>
            </select>
          </div>
          <div class="col-md-3">
            <label>AI 점수:</label>
            <select class="form-control" id="aiScoreFilter">
              <option value="">전체</option>
              <option value="high">높음 (70+)</option>
              <option value="medium">보통 (40-70)</option>
              <option value="low">낮음 (0-40)</option>
            </select>
          </div>
          <div class="col-md-3">
            <label>검색:</label>
            <input type="text" class="form-control" id="searchInput" placeholder="심볼 또는 회사명...">
          </div>
        </div>
      </div>

      <!-- 주식 목록 -->
      <div class="row" id="stocksContainer">
        <c:forEach items="${stocks}" var="stock">
          <div class="col-lg-4 col-md-6 stock-item" 
               data-country="${stock.country}" 
               data-sector="${stock.sector}" 
               data-ai-score="${stock.aiScore}"
               data-symbol="${stock.symbol}"
               data-company="${stock.companyName}">
            <div class="stock-card">
              <div class="card-body">
                <div class="row">
                  <div class="col-md-8">
                    <h4><strong>${stock.symbol}</strong></h4>
                    <p class="text-muted">${stock.companyName}</p>
                    <span class="country-badge ${stock.country == 'United States' ? 'us-badge' : stock.country == 'South Korea' ? 'kr-badge' : 'jp-badge'}">
                      ${stock.country == 'United States' ? 'US' : stock.country == 'South Korea' ? 'KR' : 'JP'}
                    </span>
                    <span class="badge badge-info">${stock.sector}</span>
                  </div>
                  <div class="col-md-4 text-right">
                    <h3>$${stock.currentPrice}</h3>
                    <p class="${stock.changePercent > 0 ? 'positive-change' : stock.changePercent < 0 ? 'negative-change' : 'neutral-change'}">
                      ${stock.changePercent > 0 ? '+' : ''}${stock.changePercent}%
                    </p>
                  </div>
                </div>
                <hr>
                <div class="row">
                  <div class="col-md-6">
                    <small class="text-muted">거래량</small><br>
                    <strong>${stock.volume}</strong>
                  </div>
                  <div class="col-md-6 text-right">
                    <small class="text-muted">AI 점수</small><br>
                    <span class="ai-score">${stock.aiScore}</span>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-md-6">
                    <small class="text-muted">P/E 비율</small><br>
                    <strong>${stock.peRatio}</strong>
                  </div>
                  <div class="col-md-6 text-right">
                    <small class="text-muted">AI 추천</small><br>
                    <span class="badge badge-${stock.aiRecommendation == 'Strong Buy' ? 'success' : stock.aiRecommendation == 'Buy' ? 'primary' : stock.aiRecommendation == 'Hold' ? 'warning' : 'danger'}">
                      ${stock.aiRecommendation}
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      <!-- 페이지네이션 -->
      <div class="row">
        <div class="col-lg-12 text-center">
          <ul class="pagination">
            <li><a href="#">&laquo;</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">&raquo;</a></li>
          </ul>
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
// 필터링 기능
function filterStocks() {
  const countryFilter = $('#countryFilter').val();
  const sectorFilter = $('#sectorFilter').val();
  const aiScoreFilter = $('#aiScoreFilter').val();
  const searchInput = $('#searchInput').val().toLowerCase();

  $('.stock-item').each(function() {
    const $item = $(this);
    const country = $item.data('country');
    const sector = $item.data('sector');
    const aiScore = parseFloat($item.data('ai-score'));
    const symbol = $item.data('symbol').toLowerCase();
    const company = $item.data('company').toLowerCase();

    let show = true;

    // 국가 필터
    if (countryFilter && country !== countryFilter) {
      show = false;
    }

    // 섹터 필터
    if (sectorFilter && sector !== sectorFilter) {
      show = false;
    }

    // AI 점수 필터
    if (aiScoreFilter) {
      if (aiScoreFilter === 'high' && aiScore < 70) show = false;
      if (aiScoreFilter === 'medium' && (aiScore < 40 || aiScore >= 70)) show = false;
      if (aiScoreFilter === 'low' && aiScore >= 40) show = false;
    }

    // 검색 필터
    if (searchInput && !symbol.includes(searchInput) && !company.includes(searchInput)) {
      show = false;
    }

    $item.toggle(show);
  });
}

// 이벤트 리스너
$('#countryFilter, #sectorFilter, #aiScoreFilter').on('change', filterStocks);
$('#searchInput').on('input', filterStocks);

// 주식 카드 클릭 이벤트
$('.stock-card').on('click', function() {
  const symbol = $(this).closest('.stock-item').data('symbol');
  window.location.href = `/finance/stock/${symbol}`;
});

// 실시간 데이터 업데이트 시뮬레이션
setInterval(function() {
  $('.stock-card').each(function() {
    const $card = $(this);
    const currentPrice = parseFloat($card.find('h3').text().replace('$', ''));
    const change = (Math.random() - 0.5) * 10;
    const newPrice = currentPrice + change;
    const changePercent = (change / currentPrice) * 100;
    
    $card.find('h3').text('$' + newPrice.toFixed(2));
    $card.find('p').text((changePercent > 0 ? '+' : '') + changePercent.toFixed(2) + '%')
        .removeClass('positive-change negative-change neutral-change')
        .addClass(changePercent > 0 ? 'positive-change' : changePercent < 0 ? 'negative-change' : 'neutral-change');
  });
}, 10000);
</script>
</body>
</html> 