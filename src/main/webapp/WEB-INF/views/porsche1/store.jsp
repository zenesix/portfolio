<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche Brand Studio</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: #fff;
    }
    .store-header {
        position: relative;
        height: 70vh;
        overflow: hidden;
    }
    .store-header img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .store-header .overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0,0,0,0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
    }
    .store-header h1 {
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
    .info-section {
        display: flex;
        align-items: center;
        gap: 50px;
    }
    .info-section .text-content {
        flex: 1;
    }
    .info-section .map-content {
        flex: 1;
        height: 400px;
        border-radius: 15px;
        overflow: hidden;
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

    <div class="store-header">
        <img src="https://images.unsplash.com/photo-1590362247335-90a614d9b657?q=80&w=2670&auto=format&fit=crop" alt="Brand Studio">
        <div class="overlay">
            <div>
                <h1>Porsche Brand Studio</h1>
                <p class="lead">An experience beyond the dealership.</p>
            </div>
        </div>
    </div>
    
    <div class="container page-section">
        <h2 class="section-title">About the Studio</h2>
        <p class="lead text-center" style="max-width: 800px; margin: 0 auto 50px auto;">
            포르쉐 브랜드 스튜디오는 자동차와 라이프스타일, 그리고 사람이 만나는 새로운 문화 공간입니다. 차량 전시는 물론, 브랜드의 가치를 공유하는 다양한 프로그램을 통해 포르쉐의 모든 것을 경험해보세요.
        </p>
        
        <div class="info-section">
            <div class="text-content">
                <h3><i class="fa fa-map-marker-alt"></i> 찾아오시는 길</h3>
                <p><strong>주소:</strong> 서울특별시 강남구 영동대로 123</p>
                <p><strong>운영시간:</strong> 매일 10:00 - 20:00</p>
                <p><strong>연락처:</strong> 02-123-4567</p>
                <br>
                <h3><i class="fa fa-calendar-check"></i> 현재 프로그램</h3>
                <p><strong>전시:</strong> The Art of Engineering</p>
                <p><strong>클래스:</strong> Porsche Design Sketch Class (매주 토요일)</p>
            </div>
            <div class="map-content">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.783157523214!2d127.0571953151663!3d37.51268487980838!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca441a95a623f%3A0x9483a21641068c2!2z7Iug7ZSp7YGg66eI7J207Iuc!5e0!3m2!1sko!2skr!4v1620000000000!5m2!1sko!2skr" 
                width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
        
         <a href="${pageContext.request.contextPath}/porsche" class="back-link">메인으로 돌아가기</a>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>

</body>
</html> 