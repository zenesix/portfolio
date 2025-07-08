<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche - 구매/이벤트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .page-header {
        background: #333;
        color: white;
        text-align: center;
        padding: 80px 0;
    }
    .page-header h1 {
        font-size: 48px;
        font-weight: 700;
    }
    .page-section {
        padding: 60px 0;
    }
    .section-title {
        text-align: center;
        font-size: 32px;
        font-weight: 600;
        margin-bottom: 40px;
    }
    .quick-links {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 20px;
    }
    .quick-link-card {
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.07);
        text-align: center;
        padding: 30px;
        width: 180px;
        text-decoration: none;
        color: #333;
        transition: all 0.3s ease;
    }
    .quick-link-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        color: #007bff;
    }
    .quick-link-card .fa {
        font-size: 42px;
        margin-bottom: 15px;
    }
    .quick-link-card p {
        margin: 0;
        font-size: 16px;
        font-weight: 500;
    }
    .event-card {
        display: flex;
        background: #fff;
        border-radius: 15px;
        overflow: hidden;
        margin-bottom: 30px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }
    .event-card img {
        width: 40%;
        object-fit: cover;
    }
    .event-content {
        padding: 30px;
    }
    .event-content h3 {
        margin-top: 0;
        font-weight: 600;
    }
    .event-content .date {
        color: #777;
        margin-bottom: 15px;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 40px;
        font-size: 16px;
    }
</style>
</head>
<body>

    <div class="page-header">
        <h1>구매 및 이벤트</h1>
    </div>

    <div class="container page-section">
        <h2 class="section-title">구매 지원 프로그램</h2>
        <div class="quick-links">
            <a href="${pageContext.request.contextPath}/porsche/quote" class="quick-link-card">
                <i class="fa fa-calculator"></i><p>견적내기</p>
            </a>
            <a href="${pageContext.request.contextPath}/porsche/consult" class="quick-link-card">
                <i class="fa fa-headphones"></i><p>구매상담</p>
            </a>
            <a href="${pageContext.request.contextPath}/porsche/testdrive" class="quick-link-card">
                <i class="fa fa-car"></i><p>시승신청</p>
            </a>
            <a href="${pageContext.request.contextPath}/porsche/dealer" class="quick-link-card">
                <i class="fa fa-map-marker-alt"></i><p>전시장 찾기</p>
            </a>
            <a href="${pageContext.request.contextPath}/porsche/benefits" class="quick-link-card">
                <i class="fa fa-gift"></i><p>구매혜택</p>
            </a>
        </div>
    </div>
    
    <div style="background: #fff;">
        <div class="container page-section">
            <h2 class="section-title">진행중인 이벤트</h2>
            <div class="event-card">
                <img src="https://i.ytimg.com/vi/f_3-aC_iB-c/maxresdefault.jpg" alt="Event Image">
                <div class="event-content">
                    <h3>Porsche World Roadshow 2024</h3>
                    <p class="date"><i class="fa fa-calendar-alt"></i> 2024.08.01 ~ 2024.08.15</p>
                    <p>포르쉐의 전 라인업을 서킷에서 직접 경험할 수 있는 특별한 기회. 지금 바로 신청하세요.</p>
                    <a href="#" class="btn btn-primary">자세히 보기</a>
                </div>
            </div>
             <div class="event-card">
                <img src="https://www.top-rider.com/news/photo/202111/60517_130327_523.jpg" alt="Event Image">
                <div class="event-content">
                    <h3>Taycan 출시 기념 특별 프로모션</h3>
                    <p class="date"><i class="fa fa-calendar-alt"></i> 2024.07.01 ~ 2024.09.30</p>
                    <p>이벤트 기간 내 타이칸 출고 고객에게 포르쉐 순정 충전기 또는 특별 금융 혜택을 제공합니다.</p>
                    <a href="#" class="btn btn-primary">자세히 보기</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container page-section">
         <a href="${pageContext.request.contextPath}/hyundai" class="back-link">메인으로 돌아가기</a>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>

</body>
</html> 