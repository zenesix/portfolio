<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매혜택</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .benefits-container {
        max-width: 1200px;
        margin: 50px auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    .benefits-container h1 {
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 30px;
        text-align: center;
        color: #333;
    }
    .benefit-card {
        background: #fff;
        border-radius: 15px;
        overflow: hidden;
        margin-bottom: 30px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        transition: all 0.3s ease;
    }
    .benefit-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 25px rgba(0,0,0,0.12);
    }
    .benefit-card .card-image {
        height: 200px;
        background-size: cover;
        background-position: center;
    }
    .benefit-card .card-content {
        padding: 25px;
    }
    .benefit-card h3 {
        margin-top: 0;
        font-size: 22px;
        font-weight: 600;
        color: #337ab7;
    }
    .benefit-card p {
        color: #666;
        font-size: 15px;
        line-height: 1.6;
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
        <div class="benefits-container">
            <h1><i class="fa fa-gift"></i> 이 달의 구매혜택</h1>
            <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="benefit-card">
                        <div class="card-image" style="background-image: url('${pageContext.request.contextPath}/resources/img/porshe_411.jpg');"></div>
                        <div class="card-content">
                            <h3>신차 구매 특별 프로모션</h3>
                            <p>Porsche 550 Spyder 구매 시, 36개월 무이자 할부 또는 5% 현금 할인을 제공합니다.</p>
                            <a href="#" class="btn btn-primary">자세히 보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="benefit-card">
                         <div class="card-image" style="background-image: url('https://i.ytimg.com/vi/f_3-aC_iB-c/maxresdefault.jpg');"></div>
                        <div class="card-content">
                            <h3>재구매 고객 감사 혜택</h3>
                            <p>기존 고객님께서 차량을 재구매하시면, 평생 엔진오일 무상 교체 서비스를 제공합니다.</p>
                             <a href="#" class="btn btn-primary">자세히 보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="benefit-card">
                         <div class="card-image" style="background-image: url('https://www.top-rider.com/news/photo/202111/60517_130327_523.jpg');"></div>
                        <div class="card-content">
                            <h3>전시차량 특별 할인</h3>
                            <p>각 지점별 전시 차량을 구매하실 경우, 최대 15%의 파격적인 할인 혜택을 드립니다.</p>
                            <a href="#" class="btn btn-primary">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/porsche" class="back-link">메인으로 돌아가기</a>
        </div>
    </div>
    
    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>
</body>
</html> 