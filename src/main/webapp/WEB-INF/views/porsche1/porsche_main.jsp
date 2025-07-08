<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        background: #131217;
        color: #fff;
        font-family: 'Pretendard', 'Noto Sans KR', Arial, sans-serif;
        margin: 0;
        min-height: 100vh;
    }
    .top-nav {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px 40px;
        background-color: #18171c;
        border-bottom: 1px solid #232228;
    }
    .top-nav a {
        text-decoration: none;
        color: #fff;
        font-weight: 500;
        margin: 0 20px;
        font-size: 16px;
        transition: color 0.3s;
    }
    .top-nav a:hover {
        color: #ffcc00;
    }
    .main-headline {
        font-size: 48px;
        font-weight: 700;
        text-align: center;
        margin: 60px 0 50px 0;
        letter-spacing: -2px;
    }
    .model-cards {
        display: flex;
        justify-content: center;
        gap: 48px;
        max-width: 1200px;
        margin: 0 auto;
        flex-wrap: wrap;
    }
    .model-card {
        background: #18171c;
        border-radius: 18px;
        overflow: hidden;
        width: 420px;
        min-width: 320px;
        box-shadow: 0 4px 32px rgba(0,0,0,0.25);
        position: relative;
        transition: transform 0.2s, box-shadow 0.2s;
        cursor: pointer;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
    }
    .model-card:hover {
        transform: translateY(-8px) scale(1.03);
        box-shadow: 0 8px 40px rgba(255,204,0,0.10);
    }
    .model-card-img {
        width: 100%;
        height: 320px;
        object-fit: cover;
        display: block;
    }
    .model-card-title {
        position: absolute;
        top: 24px;
        left: 28px;
        font-size: 32px;
        font-weight: 800;
        letter-spacing: 2px;
        color: #fff;
        text-shadow: 0 2px 8px rgba(0,0,0,0.4);
    }
    .model-card-desc {
        font-size: 15px;
        color: #ccc;
        margin: 0 0 18px 0;
        padding-left: 10px;
    }
    .model-card-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 24px 18px 24px;
    }
    .model-card-tag {
        background: #232228;
        color: #bbb;
        font-size: 13px;
        border-radius: 6px;
        padding: 3px 12px;
        margin-bottom: 0;
        margin-top: 10px;
        display: inline-block;
    }
    .model-card-arrow {
        color: #fff;
        font-size: 22px;
        background: rgba(255,255,255,0.08);
        border-radius: 50%;
        width: 36px;
        height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: background 0.2s, color 0.2s;
    }
    .model-card:hover .model-card-arrow {
        background: #ffcc00;
        color: #18171c;
    }
    @media (max-width: 950px) {
        .model-cards { flex-direction: column; align-items: center; }
        .model-card { width: 90vw; min-width: 0; }
    }
    .media-hover-wrap {
        position: relative;
        width: 100%;
        height: 320px;
        overflow: hidden;
    }
    .model-card-img, .model-card-video {
        position: absolute;
        top: 0; left: 0; width: 100%; height: 100%; object-fit: cover;
        border-radius: 0;
        transition: opacity 0.5s cubic-bezier(.4,0,.2,1);
        display: block;
    }
    .model-card-img {
        z-index: 1;
    }
    .model-card-video {
        opacity: 0;
        pointer-events: none;
        z-index: 2;
        background: #000;
    }
    .model-card:hover .model-card-video {
        opacity: 1;
        pointer-events: auto;
    }
    .model-card:hover .model-card-img {
        opacity: 0;
    }
</style>
</head>
<body>
    <nav class="top-nav">
        <a href="${pageContext.request.contextPath}/porsche/qna/list">질문게시판</a>
        <a href="${pageContext.request.contextPath}/porsche/model">모델</a>
        <a href="${pageContext.request.contextPath}/porsche/purchase">구매/이벤트</a>
        <a href="${pageContext.request.contextPath}/porsche/service-membership">서비스/멤버십</a>
        <a href="${pageContext.request.contextPath}/porsche/support">디지털/고객지원</a>
        <a href="${pageContext.request.contextPath}/porsche/brand">브랜드</a>
        <a href="${pageContext.request.contextPath}/porsche/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/porsche/connect">Porsche Connect</a>
        <a href="${pageContext.request.contextPath}/porsche/store">Brand Studio</a>
        <a href="${pageContext.request.contextPath}/porsche/ev">EV</a>
        <a href="${pageContext.request.contextPath}/porsche/future" style="color:#ffcc00;font-weight:900;margin-left:24px;">
            <i class="fa fa-rocket"></i> Future Porsche Experience
        </a>
    </nav>
    <div class="main-headline">당신의 포르쉐 여정은 지금 시작됩니다.</div>
    <div class="model-cards">
        <!-- 911 Card -->
        <div class="model-card" onclick="location.href='${pageContext.request.contextPath}/pprshe/model'">
            <div class="media-hover-wrap">
                <img class="model-card-img" src="${pageContext.request.contextPath}/resources/img/porshe_119.jpg" alt="Porsche 911">
                <video class="model-card-video" src="${pageContext.request.contextPath}/resources/video/porsche_911_clip.mp4" loop playsinline preload="none"></video>
            </div>
            <div class="model-card-title">911</div>
            <div class="model-card-footer">
                <span class="model-card-tag">가솔린</span>
                <span class="model-card-arrow"><i class="fas fa-arrow-right"></i></span>
            </div>
            <div class="model-card-desc">아이코닉한 2도어 리어 엔진 스포츠카.</div>
        </div>
        <!-- 718 Card -->
        <div class="model-card" onclick="location.href='${pageContext.request.contextPath}/porsche/model'">
            <div class="media-hover-wrap">
                <img class="model-card-img" src="${pageContext.request.contextPath}/resources/img/porshe_411.jpg" alt="Porsche 718">
                <video class="model-card-video" src="${pageContext.request.contextPath}/resources/video/porsche_718_clip.mp4" loop playsinline preload="none"></video>
            </div>
            <div class="model-card-title">718</div>
            <div class="model-card-footer">
                <span class="model-card-tag">가솔린</span>
                <span class="model-card-arrow"><i class="fas fa-arrow-right"></i></span>
            </div>
            <div class="model-card-desc">미드 엔진 2인승 스포츠카.</div>
        </div>
    </div>
    <!-- 질문게시판 바로가기 버튼 -->
    <div style="text-align:center; margin-top:48px;">
        <a href="${pageContext.request.contextPath}/porsche/qna/list" style="display:inline-block; background:#ffcc00; color:#18171c; font-weight:700; font-size:20px; padding:18px 48px; border-radius:12px; box-shadow:0 4px 24px rgba(0,0,0,0.15); text-decoration:none; transition:background 0.2s;">
            <i class="fas fa-question-circle"></i> 질문게시판 바로가기
        </a>
    </div>
    
    <!-- 메인으로 돌아가기 링크 (일관성을 위해 추가) -->
    <div style="text-align:center; margin-top:20px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color:#ffcc00; text-decoration:none; font-weight:600; font-size:16px;">
            <i class="fas fa-home"></i> 메인 페이지
        </a>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.model-card').forEach(function(card) {
            var video = card.querySelector('.model-card-video');
            card.addEventListener('mouseenter', function() {
                if(video) {
                    video.currentTime = 0;
                    video.muted = false;
                    video.play();
                }
            });
            card.addEventListener('mouseleave', function() {
                if(video) {
                    video.pause();
                    video.currentTime = 0;
                    video.muted = true;
                }
            });
            // 모바일 터치 대응 (탭 시 사운드 재생)
            card.addEventListener('touchstart', function() {
                if(video) {
                    video.muted = false;
                    video.play();
                }
            });
        });
    });
    </script>
</body>
</html> 