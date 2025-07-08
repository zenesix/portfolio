<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Crypto Universe - 전체 시장</title>
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
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    
    <style>
        .market-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .market-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-weight: bold;
        }
        
        .market-table tr:hover {
            background: #f8f9fa;
            transform: scale(1.01);
            transition: all 0.2s ease;
        }
        
        .coin-row {
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .coin-row:hover {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .coin-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        .price-change-positive {
            color: #00ff88;
            font-weight: bold;
        }
        
        .price-change-negative {
            color: #ff4757;
            font-weight: bold;
        }
        
        .market-cap-badge {
            background: #667eea;
            color: white;
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 12px;
            margin-left: 10px;
        }
        
        .volume-bar {
            width: 100%;
            height: 4px;
            background: #e9ecef;
            border-radius: 2px;
            margin-top: 5px;
        }
        
        .volume-fill {
            height: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
            transition: width 0.3s ease;
        }
        
        .filter-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .search-box {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            border-radius: 25px;
            padding: 10px 20px;
        }
        
        .search-box::placeholder {
            color: rgba(255,255,255,0.8);
        }
        
        .sort-button {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            border-radius: 20px;
            padding: 8px 15px;
            margin: 0 5px;
            transition: all 0.3s ease;
        }
        
        .sort-button:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
        }
        
        .sort-button.active {
            background: rgba(255,255,255,0.4);
            font-weight: bold;
        }
        
        .category-filter {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            border-radius: 20px;
            padding: 8px 15px;
            margin: 0 5px;
        }
        
        .category-filter option {
            background: #667eea;
            color: white;
        }
        
        .stats-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        
        .stats-card i {
            font-size: 40px;
            margin-bottom: 10px;
            color: #667eea;
        }
        
        .stats-card h3 {
            color: #333;
            margin: 10px 0;
        }
        
        .stats-card p {
            color: #666;
            margin: 0;
        }
        
        .pagination-container {
            text-align: center;
            margin-top: 20px;
        }
        
        .pagination > li > a {
            color: #667eea;
            border: 1px solid #ddd;
            margin: 0 2px;
        }
        
        .pagination > .active > a {
            background: #667eea;
            border-color: #667eea;
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
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- Header -->
    <jsp:include page="../include/header.jsp" />
    
    <!-- Sidebar -->
    <jsp:include page="../include/sidebar.jsp" />
    
    <!-- Content Wrapper -->
    <div class="content-wrapper" style="min-height:100vh;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- Content Header -->
                    <section class="content-header">
                        <h1>
                            📊 전체 암호화폐 시장
                            <small>실시간 시장 데이터</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li><a href="/crypto/dashboard">암호화폐</a></li>
                            <li class="active">전체 시장</li>
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
                        
                        <!-- 시장 통계 -->
                        <div class="row">
                            <div class="col-md-3">
                                <div class="stats-card">
                                    <i class="fa fa-coins"></i>
                                    <h3>${fn:length(coins)}</h3>
                                    <p>총 암호화폐</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stats-card">
                                    <i class="fa fa-chart-line"></i>
                                    <h3>24시간</h3>
                                    <p>거래량</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stats-card">
                                    <i class="fa fa-globe"></i>
                                    <h3>글로벌</h3>
                                    <p>시장</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stats-card">
                                    <i class="fa fa-clock-o"></i>
                                    <h3>24/7</h3>
                                    <p>거래</p>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 필터 섹션 -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="filter-section">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" class="form-control search-box" id="searchInput" placeholder="🔍 코인 검색...">
                                        </div>
                                        <div class="col-md-4">
                                            <select class="category-filter" id="categoryFilter">
                                                <option value="">전체 카테고리</option>
                                                <option value="Cryptocurrency">암호화폐</option>
                                                <option value="Platform">플랫폼</option>
                                                <option value="Infrastructure">인프라</option>
                                                <option value="Oracle">오라클</option>
                                                <option value="DEX">DEX</option>
                                                <option value="Gaming">게임</option>
                                                <option value="Storage">스토리지</option>
                                                <option value="Exchange">거래소</option>
                                                <option value="Stablecoin">스테이블코인</option>
                                                <option value="Meme">밈코인</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <button class="sort-button" data-sort="market_cap" data-order="desc">시가총액</button>
                                            <button class="sort-button" data-sort="changePercent24h" data-order="desc">변화율</button>
                                            <button class="sort-button" data-sort="volume24h" data-order="desc">거래량</button>
                                            <button class="sort-button" data-sort="currentPrice" data-order="desc">가격</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 시장 테이블 -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="market-table">
                                    <table class="table table-hover" id="marketTable">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>코인</th>
                                                <th>가격</th>
                                                <th>24h 변화</th>
                                                <th>7d 변화</th>
                                                <th>시가총액</th>
                                                <th>거래량(24h)</th>
                                                <th>유통량</th>
                                                <th>차트</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${coins}" var="coin" varStatus="status">
                                                <c:if test="${status.index < 10}">
                                                    <tr class="coin-row" data-symbol="${coin.symbol}">
                                                        <td>
                                                            <span class="market-cap-badge">${coin.rank}</span>
                                                        </td>
                                                        <td>
                                                            <div style="display: flex; align-items: center;">
                                                                <img src="${coin.imageUrl}" alt="${coin.name}" class="coin-icon" onerror="this.src='https://via.placeholder.com/30x30/667eea/ffffff?text=${coin.symbol}'">
                                                                <div>
                                                                    <strong>${coin.name}</strong><br>
                                                                    <small style="color: #666;">${coin.symbol}</small>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <strong>$<fmt:formatNumber value="${coin.currentPrice}" pattern="#,##0.00"/></strong><br>
                                                            <small style="color: #666;">₩<fmt:formatNumber value="${coin.currentPrice * 1300}" pattern="#,##0"/></small>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${coin.changePercent24h >= 0}">
                                                                    <span class="price-change-positive">
                                                                        +<fmt:formatNumber value="${coin.changePercent24h}" pattern="#,##0.00"/>%
                                                                    </span><br>
                                                                    <small style="color: #666;">
                                                                        ${coin.change24h >= 0 ? '+' : ''}$<fmt:formatNumber value="${coin.change24h}" pattern="#,##0.00"/>
                                                                    </small>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="price-change-negative">
                                                                        <fmt:formatNumber value="${coin.changePercent24h}" pattern="#,##0.00"/>%
                                                                    </span><br>
                                                                    <small style="color: #666;">
                                                                        ${coin.change24h >= 0 ? '+' : ''}$<fmt:formatNumber value="${coin.change24h}" pattern="#,##0.00"/>
                                                                    </small>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${coin.changePercent24h >= 0}">
                                                                    <span class="price-change-positive">
                                                                        +<fmt:formatNumber value="${coin.changePercent24h * 0.8}" pattern="#,##0.00"/>%
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="price-change-negative">
                                                                        <fmt:formatNumber value="${coin.changePercent24h * 0.8}" pattern="#,##0.00"/>%
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            $<fmt:formatNumber value="${coin.marketCap}" pattern="#,##0.0"/>B<br>
                                                            <small style="color: #666;">
                                                                <fmt:formatNumber value="${coin.marketCap / 2500000000000 * 100}" pattern="#,##0.0"/>% 시장 점유율
                                                            </small>
                                                        </td>
                                                        <td>
                                                            $<fmt:formatNumber value="${coin.volume24h}" pattern="#,##0.0"/>M<br>
                                                            <div class="volume-bar">
                                                                <div class="volume-fill" style="width: ${coin.volume24h / 1000000000 * 100}%"></div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber value="${coin.circulatingSupply}" pattern="#,##0.0"/>B<br>
                                                            <small style="color: #666;">
                                                                <fmt:formatNumber value="${coin.circulatingSupply / coin.totalSupply * 100}" pattern="#,##0.0"/>% 유통
                                                            </small>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-sm btn-primary" onclick="viewChart('${coin.symbol}')">
                                                                <i class="fa fa-chart-line"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-info" onclick="viewDetail('${coin.symbol}')">
                                                                <i class="fa fa-info-circle"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 페이지네이션 -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="pagination-container">
                                    <ul class="pagination">
                                        <li><a href="#">&laquo;</a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">&raquo;</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
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
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="${pageContext.request.contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/js/adminlte.min.js"></script>

<script>
// 실시간 업데이트
function updateLastUpdate() {
    const now = new Date();
    document.getElementById('lastUpdate').textContent = now.toLocaleTimeString();
}

setInterval(updateLastUpdate, 5000);
updateLastUpdate();

// 검색 기능
document.getElementById('searchInput').addEventListener('input', function() {
    const searchTerm = this.value.toLowerCase();
    const rows = document.querySelectorAll('#marketTable tbody tr');
    
    rows.forEach(row => {
        const coinName = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
        const coinSymbol = row.querySelector('td:nth-child(2) small').textContent.toLowerCase();
        
        if (coinName.includes(searchTerm) || coinSymbol.includes(searchTerm)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
});

// 정렬 기능
document.querySelectorAll('.sort-button').forEach(button => {
    button.addEventListener('click', function() {
        // 활성 버튼 표시
        document.querySelectorAll('.sort-button').forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');
        
        const sortBy = this.dataset.sort;
        const order = this.dataset.order;
        
        // 실제 정렬 로직은 서버에서 처리
        window.location.href = `/crypto/market?sortBy=${sortBy}&order=${order}`;
    });
});

// 카테고리 필터
document.getElementById('categoryFilter').addEventListener('change', function() {
    const category = this.value;
    if (category) {
        // 실제 필터링은 서버에서 처리
        window.location.href = `/crypto/market?category=${category}`;
    }
});

// 코인 상세 페이지로 이동
function viewDetail(symbol) {
    window.location.href = `/crypto/coin/${symbol}`;
}

// 차트 보기
function viewChart(symbol) {
    // 차트 모달 또는 새 페이지로 이동
    alert(`${symbol} 차트를 보여줍니다.`);
}

// 테이블 행 클릭 이벤트
document.querySelectorAll('.coin-row').forEach(row => {
    row.addEventListener('click', function() {
        const symbol = this.dataset.symbol;
        viewDetail(symbol);
    });
});

// 실시간 가격 업데이트 시뮬레이션
function simulatePriceUpdates() {
    const priceCells = document.querySelectorAll('#marketTable tbody tr td:nth-child(3) strong');
    priceCells.forEach(cell => {
        const currentPrice = parseFloat(cell.textContent.replace(/[$,]/g, ''));
        const change = (Math.random() - 0.5) * 0.01; // ±0.5% 변화
        const newPrice = currentPrice * (1 + change);
        cell.textContent = '$' + newPrice.toLocaleString('en-US', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    });
}

// 30초마다 가격 업데이트
setInterval(simulatePriceUpdates, 30000);

// DataTables 초기화
$(document).ready(function() {
    $('#marketTable').DataTable({
        "pageLength": 25,
        "order": [[ 0, "asc" ]],
        "language": {
            "search": "검색:",
            "lengthMenu": "페이지당 _MENU_개 항목 표시",
            "info": "_START_ - _END_ / _TOTAL_개 항목",
            "infoEmpty": "표시할 항목이 없습니다",
            "infoFiltered": "(_MAX_개 항목에서 필터링됨)",
            "paginate": {
                "first": "처음",
                "last": "마지막",
                "next": "다음",
                "previous": "이전"
            }
        }
    });
});
</script>

</body>
</html> 