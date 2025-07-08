<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche - 서비스/멤버십</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .page-header { display: none; }
    .page-section {
        padding: 60px 0;
    }
    .section-title {
        text-align: center;
        font-size: 32px;
        font-weight: 600;
        margin-bottom: 40px;
    }
    .service-booking-card {
        background: #fff;
        border-radius: 15px;
        padding: 40px;
        text-align: center;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        max-width: 800px;
        margin: 0 auto;
    }
    .service-booking-card h3 {
        margin-top: 0;
        font-weight: 600;
    }
    .membership-tier {
        background: #fff;
        border-radius: 15px;
        padding: 30px;
        text-align: center;
        box-shadow: 0 5px 20px rgba(0,0,0,0.07);
        transition: all 0.3s ease;
        border-top: 5px solid transparent;
    }
    .membership-tier:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }
    .membership-tier.silver { border-color: #c0c0c0; }
    .membership-tier.gold { border-color: #ffd700; }
    .membership-tier.platinum { border-color: #e5e4e2; }
    .membership-tier .fa-gem, .membership-tier .fa-trophy, .membership-tier .fa-crown {
        font-size: 40px;
        margin-bottom: 15px;
    }
    .membership-tier.silver .fa-gem { color: #c0c0c0; }
    .membership-tier.gold .fa-trophy { color: #ffd700; }
    .membership-tier.platinum .fa-crown { color: #8a2be2; }
    .membership-tier h3 {
        font-weight: 600;
        font-size: 24px;
    }
    .membership-tier ul {
        list-style: none;
        padding: 0;
        margin: 20px 0;
        text-align: left;
    }
    .membership-tier ul li {
        margin-bottom: 10px;
        color: #555;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 40px;
        font-size: 16px;
    }

    /* Hero Video Section Styles */
    .membership-hero-bgwrap {
        position: relative;
        width: 100vw;
        left: 50%;
        right: 50%;
        margin-left: -50vw;
        margin-right: -50vw;
        min-height: 520px;
        max-height: none;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        background: #111;
        padding-bottom: 40px;
    }
    .membership-hero-bg {
        position: absolute;
        top: 0; left: 0; width: 100%; height: 100%;
        object-fit: cover;
        z-index: 1;
        filter: brightness(0.6) saturate(1.1);
    }
    .membership-hero-overlay {
        position: absolute;
        top: 0; left: 0; width: 100%; height: 100%;
        background: linear-gradient(180deg,rgba(0,0,0,0.55) 60%,rgba(0,0,0,0.18) 100%);
        z-index: 2;
    }
    .membership-hero-foreground {
        position: relative;
        z-index: 3;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
    }
    .membership-hero-content {
        color: #fff;
        text-align: center;
        width: 100%;
        max-width: 700px;
        margin: 0 auto 32px auto;
        padding-top: 70px;
    }
    .membership-hero-content h1 {
        font-size: 2.8rem;
        font-weight: 800;
        text-shadow: 0 4px 16px rgba(0,0,0,0.45), 0 1px 0 #222;
        margin-bottom: 0.5rem;
        letter-spacing: 0.04em;
    }
    .hero-card {
        background: rgba(255,255,255,0.92);
        box-shadow: 0 8px 32px rgba(0,0,0,0.18);
        border-radius: 18px;
        padding: 38px 32px 32px 32px;
        margin-bottom: 0;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }
    .hero-card h3 {
        font-size: 1.35rem;
        font-weight: 700;
        color: #222;
        margin-bottom: 1.1rem;
    }
    .hero-card p {
        color: #444;
        font-size: 1.08rem;
        margin-bottom: 1.5rem;
    }
    .hero-card .btn-primary {
        font-size: 1.08rem;
        font-weight: 600;
        border-radius: 2rem;
        padding: 0.7rem 2.2rem;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        transition: background 0.2s;
    }
    .hero-card .btn-primary:hover {
        background: #0056b3;
    }
    @media (max-width: 768px) {
        .membership-hero-bgwrap { min-height: 320px; padding-bottom: 18px; }
        .membership-hero-content { padding-top: 32px; }
        .membership-hero-content h1 { font-size: 1.5rem; }
        .hero-card { padding: 22px 8px 18px 8px; }
    }
</style>
</head>
<body>
    <!-- Hero + 안내 카드 전체를 비디오 배경으로 감싸기 -->
    <div class="membership-hero-bgwrap">
        <video class="membership-hero-bg" src="${pageContext.request.contextPath}/resources/video/service_membership_30s.mp4" autoplay loop muted playsinline></video>
        <div class="membership-hero-overlay"></div>
        <div class="membership-hero-foreground">
            <div class="membership-hero-content">
                <h1>서비스 & 멤버십</h1>
            </div>
            <div class="container page-section" style="background:transparent;box-shadow:none;">
                <div class="service-booking-card hero-card">
                    <h3>최고의 전문가에게 차량을 맡기세요.</h3>
                    <p>포르쉐 공식 서비스 센터에서 정확하고 신속한 정비를 경험하실 수 있습니다. 지금 바로 온라인으로 예약하세요.</p>
                    <a href="${pageContext.request.contextPath}/porsche/service" class="btn btn-primary btn-lg">온라인 정비 예약 <i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div style="background: #fff;">
        <div class="container page-section">
            <h2 class="section-title">프리미엄 멤버십</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="membership-tier silver">
                        <i class="fa fa-gem"></i>
                        <h3>Silver</h3>
                        <ul>
                            <li><i class="fa fa-check-circle"></i> 웰컴 기프트 제공</li>
                            <li><i class="fa fa-check-circle"></i> 서비스센터 우선 예약</li>
                            <li><i class="fa fa-check-circle"></i> 액세서리 5% 할인</li>
                        </ul>
                        <button class="btn btn-default btn-block">가입 안내</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="membership-tier gold">
                        <i class="fa fa-trophy"></i>
                        <h3>Gold</h3>
                        <ul>
                            <li><i class="fa fa-check-circle"></i> Silver 혜택 모두 포함</li>
                            <li><i class="fa fa-check-circle"></i> 24시간 긴급 출동 서비스</li>
                            <li><i class="fa fa-check-circle"></i> 이벤트 초청 우선권</li>
                        </ul>
                         <button class="btn btn-default btn-block">가입 안내</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="membership-tier platinum">
                        <i class="fa fa-crown"></i>
                        <h3>Platinum</h3>
                        <ul>
                            <li><i class="fa fa-check-circle"></i> Gold 혜택 모두 포함</li>
                            <li><i class="fa fa-check-circle"></i> 전용 컨시어지 서비스</li>
                            <li><i class="fa fa-check-circle"></i> 서킷 주행 프로그램 제공</li>
                        </ul>
                         <button class="btn btn-default btn-block">가입 안내</button>
                    </div>
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