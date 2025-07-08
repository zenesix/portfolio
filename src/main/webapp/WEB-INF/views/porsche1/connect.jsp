<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche Connect</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        background-color: #000;
        color: #fff;
        font-family: 'Arial', sans-serif;
    }
    .connect-header {
        height: 80vh;
        background: url('https://images.unsplash.com/photo-1533106418989-8742337199a1?q=80&w=2574&auto=format&fit=crop') no-repeat center center;
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
    }
    .connect-header-content {
        background: rgba(0,0,0,0.6);
        padding: 40px;
        border-radius: 15px;
    }
    .connect-header h1 {
        font-size: 52px;
        font-weight: 700;
    }
    .page-section { padding: 80px 0; }
    .section-title {
        text-align: center;
        font-size: 36px;
        font-weight: 600;
        margin-bottom: 50px;
    }
    .feature-card {
        background: #1a1a1a;
        padding: 30px;
        text-align: center;
        border-radius: 15px;
        transition: all 0.3s ease;
        height: 100%;
    }
    .feature-card:hover {
        background: #333;
        transform: translateY(-10px);
    }
    .feature-card .fa {
        font-size: 48px;
        color: #007bff;
        margin-bottom: 20px;
    }
    .feature-card h3 {
        font-weight: 600;
        margin-bottom: 15px;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 40px;
        font-size: 16px;
        color: #fff;
    }
</style>
</head>
<body>

    <div class="connect-header">
        <div class="connect-header-content">
            <h1>Porsche Connect</h1>
            <p class="lead">Your digital co-pilot.</p>
        </div>
    </div>

    <div class="container page-section">
        <h2 class="section-title">Key Features</h2>
        <div class="row">
            <div class="col-md-4" style="margin-bottom: 30px;">
                <div class="feature-card">
                    <i class="fa fa-mobile-alt"></i>
                    <h3>Remote Services</h3>
                    <p>스마트폰으로 차량의 문을 잠그거나, 주행 가능 거리를 확인하고, 주차 위치를 찾을 수 있습니다.</p>
                </div>
            </div>
            <div class="col-md-4" style="margin-bottom: 30px;">
                <div class="feature-card">
                    <i class="fa fa-map-marked-alt"></i>
                    <h3>Navigation Plus</h3>
                    <p>실시간 교통 정보가 반영된 최적의 경로를 안내받고, 온라인으로 목적지를 검색할 수 있습니다.</p>
                </div>
            </div>
            <div class="col-md-4" style="margin-bottom: 30px;">
                <div class="feature-card">
                    <i class="fa fa-shield-alt"></i>
                    <h3>Safety and Security</h3>
                    <p>긴급 상황 발생 시 자동으로 구조 요청을 보내고, 도난 방지 알림을 받을 수 있습니다.</p>
                </div>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/hyundai" class="back-link">메인으로 돌아가기</a>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>

</body>
</html> 