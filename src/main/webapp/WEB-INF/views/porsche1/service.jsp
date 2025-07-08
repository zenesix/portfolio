<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 정비예약</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .service-container {
        max-width: 900px;
        margin: 50px auto;
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }
    .service-header {
        background-color: #337ab7;
        color: white;
        padding: 30px;
        text-align: center;
    }
    .service-header h1 {
        margin: 0;
        font-size: 28px;
        font-weight: 700;
    }
    .service-body {
        padding: 40px;
    }
    .form-section {
        margin-bottom: 40px;
        padding-bottom: 20px;
        border-bottom: 1px solid #eee;
    }
    .form-section h3 {
        font-size: 22px;
        font-weight: 600;
        color: #333;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #337ab7;
        display: inline-block;
    }
    .checkbox-group label {
        margin-right: 20px;
        font-weight: 500;
    }
    .form-control {
        border-radius: 5px;
        box-shadow: none;
        border-color: #d2d6de;
    }
    .btn-submit {
        width: 100%;
        padding: 12px;
        font-size: 18px;
        font-weight: 600;
        border-radius: 5px;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
    }
</style>
<style>
/* Hero Video Section Styles */
.service-hero-section {
    position: relative;
    width: 100vw;
    left: 50%;
    right: 50%;
    margin-left: -50vw;
    margin-right: -50vw;
    height: 520px;
    min-height: 320px;
    max-height: 600px;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #111;
}
.service-hero-bg {
    position: absolute;
    top: 0; left: 0; width: 100%; height: 100%;
    object-fit: cover;
    z-index: 1;
    filter: brightness(0.7) saturate(1.1);
}
.service-hero-overlay {
    position: absolute;
    top: 0; left: 0; width: 100%; height: 100%;
    background: linear-gradient(180deg,rgba(0,0,0,0.45) 60%,rgba(0,0,0,0.15) 100%);
    z-index: 2;
}
.service-hero-content {
    position: relative;
    z-index: 3;
    color: #fff;
    text-align: center;
    width: 100%;
    max-width: 700px;
    margin: 0 auto;
}
.service-hero-content h1 {
    font-size: 2.8rem;
    font-weight: 700;
    text-shadow: 0 2px 8px rgba(0,0,0,0.3);
    margin-bottom: 1.2rem;
    letter-spacing: 0.04em;
}
.service-hero-content p {
    font-size: 1.15rem;
    margin-bottom: 1.7rem;
    text-shadow: 0 1px 4px rgba(0,0,0,0.18);
}
.service-hero-btn {
    display: inline-block;
    background: #007bff;
    color: #fff;
    padding: 0.8rem 2.2rem;
    border-radius: 2rem;
    font-size: 1.1rem;
    font-weight: 600;
    text-decoration: none;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    transition: background 0.2s;
}
.service-hero-btn:hover {
    background: #0056b3;
}
@media (max-width: 768px) {
    .service-hero-section { height: 260px; }
    .service-hero-content h1 { font-size: 1.5rem; }
    .service-hero-content p { font-size: 0.95rem; }
}
</style>
</head>
<body>
    <!-- Hero Video Section -->
    <div class="service-hero-section">
        <video class="service-hero-bg" src="${pageContext.request.contextPath}/resources/video/service_hero_30s.mp4" autoplay loop muted playsinline></video>
        <div class="service-hero-overlay"></div>
        <div class="service-hero-content">
            <h1>서비스 & 멤버십</h1>
            <p>최고의 전문가에게 차량을 맡기세요.<br>포르쉐 공식 서비스 센터에서 정확하고 신속한 정비를 경험하실 수 있습니다.</p>
            <a href="#service-form" class="service-hero-btn">온라인 정비 예약 ➔</a>
        </div>
    </div>
    <div class="container" id="service-form">
        <div class="service-container">
            <div class="service-header">
                <h1><i class="fa fa-calendar-check-o"></i> 온라인 정비예약</h1>
            </div>
            <div class="service-body">
                <form>
                    <div class="form-section">
                        <h3>1. 차량 정보</h3>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>차량 모델</label>
                                <input type="text" class="form-control" placeholder="예) Porsche 550 Spyder">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>차량 번호</label>
                                <input type="text" class="form-control" placeholder="예) 12가 3456">
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3>2. 서비스 선택 (중복 가능)</h3>
                        <div class="form-group checkbox-group">
                            <label><input type="checkbox"> 엔진 오일 교환</label>
                            <label><input type="checkbox"> 타이어 교체</label>
                            <label><input type="checkbox"> 브레이크 점검</label>
                            <label><input type="checkbox"> 정기 점검</label>
                            <label><input type="checkbox"> 기타</label>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3>3. 예약 시간 선택</h3>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>예약 날짜</label>
                                <div class="input-group date" id="datepicker">
                                    <input type="text" class="form-control"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>예약 시간</label>
                                <select class="form-control">
                                    <option>오전 09:00</option>
                                    <option>오전 10:00</option>
                                    <option>오전 11:00</option>
                                    <option>오후 14:00</option>
                                    <option>오후 15:00</option>
                                    <option>오후 16:00</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3>4. 고객 정보</h3>
                         <div class="row">
                            <div class="col-md-6 form-group">
                                <label>예약자명</label>
                                <input type="text" class="form-control" placeholder="성함을 입력하세요">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>연락처</label>
                                <input type="text" class="form-control" placeholder="'-' 없이 숫자만 입력">
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary btn-submit">예약 신청하기</button>
                </form>
                <a href="${pageContext.request.contextPath}/porsche" class="back-link">메인으로 돌아가기</a>
            </div>
        </div>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
           
        </a>
    </div>

    <script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.ko.min.js"></script>
    <script>
        $(function () {
            $('#datepicker').datepicker({
                format: "yyyy-mm-dd",
                language: "ko",
                autoclose: true,
                todayHighlight: true
            });
        });
    </script>
</body>
</html> 