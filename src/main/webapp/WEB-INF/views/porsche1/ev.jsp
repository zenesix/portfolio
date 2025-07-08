<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche - EV</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: #000;
        color: #fff;
    }
    .ev-header {
        position: relative;
        height: 100vh;
        overflow: hidden;
    }
    #bg-video {
        position: absolute;
        top: 50%;
        left: 50%;
        min-width: 100%;
        min-height: 100%;
        width: auto;
        height: auto;
        z-index: -100;
        transform: translateX(-50%) translateY(-50%);
    }
    .ev-header .overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0,0,0,0.6);
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
    }
    .ev-header h1 {
        font-size: 56px;
        font-weight: 700;
    }
    .page-section { padding: 80px 0; }
    .section-title {
        text-align: center;
        font-size: 36px;
        font-weight: 600;
        margin-bottom: 50px;
    }
    .ev-feature {
        display: flex;
        align-items: center;
        gap: 50px;
        margin-bottom: 80px;
    }
    .ev-feature.reverse { flex-direction: row-reverse; }
    .ev-feature-text { flex: 1; }
    .ev-feature-img { flex: 1; }
    .ev-feature-img img {
        width: 100%;
        border-radius: 15px;
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
    <div class="ev-header">
        <video autoplay muted loop id="bg-video">
            <source src="https://videos.pexels.com/video-files/7059104/7059104-hd_1920_1080_25fps.mp4" type="video/mp4">
        </video>
        <div class="overlay">
            <h1>Soul, Electrified.</h1>
            <p class="lead">The future of performance is electric. Discover the Porsche Taycan.</p>
        </div>
    </div>

    <div class="container page-section">
        <div class="ev-feature">
            <div class="ev-feature-text">
                <h2>Thrilling Performance</h2>
                <p>0-100km/h 가속 시간 2.8초. 숨 막히는 가속력과 즉각적인 반응성. 포르쉐의 DNA는 그대로, 심장만 바뀌었을 뿐입니다.</p>
            </div>
            <div class="ev-feature-img">
                <img src="https://images.unsplash.com/photo-1620984455331-b0d685791334?q=80&w=2670&auto=format&fit=crop" alt="Performance">
            </div>
        </div>
        
        <div class="ev-feature reverse">
            <div class="ev-feature-text">
                <h2>Charging and Range</h2>
                <p>단 5분의 충전으로 100km 주행 가능. 혁신적인 800볼트 기술이 당신의 여정을 멈추지 않게 합니다.</p>
            </div>
             <div class="ev-feature-img">
                <img src="https://images.unsplash.com/photo-1619679492934-6681e4a1c56a?q=80&w=2670&auto=format&fit=crop" alt="Charging">
            </div>
        </div>

        <div class="ev-feature">
            <div class="ev-feature-text">
                <h2>Puristic Design</h2>
                <p>날렵한 실루엣과 미래지향적인 디테일. 포르쉐의 디자인 정체성은 전기차에서도 계속됩니다.</p>
            </div>
             <div class="ev-feature-img">
                <img src="https://images.unsplash.com/photo-1621564849339-b883c5a61099?q=80&w=2670&auto=format&fit=crop" alt="Design">
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