<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매처 검색</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .dealer-container {
        max-width: 1200px;
        margin: 50px auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    .dealer-container h1 {
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 30px;
        text-align: center;
        color: #333;
    }
    .search-bar {
        margin-bottom: 30px;
    }
    .map-container {
        height: 400px;
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 30px;
    }
    .dealer-list .dealer-item {
        background: #fff;
        border: 1px solid #eee;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 15px;
        transition: all 0.3s ease;
    }
    .dealer-list .dealer-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 15px rgba(0,0,0,0.1);
    }
    .dealer-item h4 {
        margin-top: 0;
        font-weight: 600;
        color: #337ab7;
    }
    .dealer-item p {
        margin-bottom: 5px;
        color: #666;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="dealer-container">
            <h1><i class="fa fa-map-marker"></i> 판매처 찾기</h1>

            <div class="search-bar">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="지역 또는 판매처명을 입력하세요">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="button"><i class="fa fa-search"></i> 검색</button>
                    </span>
                </div>
            </div>

            <div class="map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d202404.2285322972!2d126.978292!3d37.566687!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca277d34199f5%3A0x27745b4b84b3e8d6!2z7ISc7Jq47Yq567OE7Iuc!5e0!3m2!1sko!2skr!4v1688973719183!5m2!1sko!2skr" 
                    width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>

            <div class="dealer-list">
                <div class="row">
                    <div class="col-md-6">
                        <div class="dealer-item">
                            <h4><i class="fa fa-building"></i> 강남중앙 전시장</h4>
                            <p><i class="fa fa-location-arrow"></i> 서울특별시 강남구 테헤란로 123</p>
                            <p><i class="fa fa-phone"></i> 02-1234-5678</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="dealer-item">
                            <h4><i class="fa fa-building"></i> 여의도 전시장</h4>
                            <p><i class="fa fa-location-arrow"></i> 서울특별시 영등포구 국제금융로 10</p>
                            <p><i class="fa fa-phone"></i> 02-5678-1234</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="dealer-item">
                            <h4><i class="fa fa-building"></i> 분당오리 전시장</h4>
                            <p><i class="fa fa-location-arrow"></i> 경기도 성남시 분당구 성남대로 34</p>
                            <p><i class="fa fa-phone"></i> 031-123-4567</p>
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="dealer-item">
                            <h4><i class="fa fa-building"></i> 수원중부 전시장</h4>
                            <p><i class="fa fa-location-arrow"></i> 경기도 수원시 팔달구 경수대로 456</p>
                            <p><i class="fa fa-phone"></i> 031-456-7890</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <a href="${pageContext.request.contextPath}/hyundai" class="back-link">메인으로 돌아가기</a>
        </div>
    </div>
    
    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>
</body>
</html> 