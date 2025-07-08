<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche - 브랜드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        color: #333;
    }
    .parallax {
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
        text-shadow: 2px 2px 8px rgba(0,0,0,0.8);
    }
    .parallax-1 { background-image: url("https://images.unsplash.com/photo-1568605117036-5fe5e7185743?q=80&w=2670&auto=format&fit=crop"); }
    .parallax-2 { background-image: url("https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?q=80&w=2564&auto=format&fit=crop"); }
    
    .parallax h1 {
        font-size: 60px;
        font-weight: 700;
    }
    .content-section {
        padding: 80px 20px;
        background: #fff;
    }
     .content-section h2 {
        text-align: center;
        font-size: 36px;
        font-weight: 600;
        margin-bottom: 40px;
    }
    .timeline {
        position: relative;
        max-width: 1200px;
        margin: 0 auto;
    }
    .timeline::after {
        content: '';
        position: absolute;
        width: 6px;
        background-color: #ddd;
        top: 0;
        bottom: 0;
        left: 50%;
        margin-left: -3px;
    }
    .timeline-container {
        padding: 10px 40px;
        position: relative;
        background-color: inherit;
        width: 50%;
    }
    .timeline-container.left { left: 0; }
    .timeline-container.right { left: 50%; }
    .timeline-container::after {
        content: '';
        position: absolute;
        width: 25px;
        height: 25px;
        right: -17px;
        background-color: white;
        border: 4px solid #FF9F55;
        top: 15px;
        border-radius: 50%;
        z-index: 1;
    }
    .right::after { left: -16px; }
    .timeline-content {
        padding: 20px 30px;
        background-color: #f4f6f9;
        position: relative;
        border-radius: 6px;
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

    <div class="parallax parallax-1">
        <h1>The Soul of Porsche</h1>
    </div>

    <div class="content-section">
        <div class="container">
            <h2>Our Heritage</h2>
            <div class="timeline">
                <div class="timeline-container left">
                    <div class="timeline-content">
                        <h3>1948: The Birth of a Legend</h3>
                        <p>The first Porsche 356 is built in Gmünd, Austria. A sports car legend is born.</p>
                    </div>
                </div>
                <div class="timeline-container right">
                    <div class="timeline-content">
                        <h3>1963: The 911 Arrives</h3>
                        <p>The iconic Porsche 911 is introduced at the Frankfurt Motor Show, setting a new benchmark for sports cars.</p>
                    </div>
                </div>
                <div class="timeline-container left">
                    <div class="timeline-content">
                        <h3>1970: Le Mans Victory</h3>
                        <p>Porsche achieves its first overall victory at the 24 Hours of Le Mans with the 917 KH.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="parallax parallax-2">
        <h1>Engineered for Magic.</h1>
    </div>
    
    <div class="content-section">
        <div class="container text-center">
            <h2>Our Philosophy</h2>
            <p class="lead">To build a sports car, you have to have a goal. Not a sales target, but an ideal. The Porsche principle is to always get the most out of everything. To translate performance into speed - and success - in the most intelligent way possible.</p>
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