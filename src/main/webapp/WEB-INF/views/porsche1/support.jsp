<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche - 디지털/고객지원</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .support-header {
        background-color: #002c57;
        color: white;
        padding: 60px 20px;
        text-align: center;
    }
    .support-header h1 {
        font-size: 42px;
        font-weight: 700;
        margin-bottom: 15px;
    }
    .search-bar {
        max-width: 600px;
        margin: 0 auto;
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
    .faq-panel .panel-heading {
        padding: 15px;
        background-color: #fff !important;
        border-color: #ddd !important;
    }
    .faq-panel .panel-title a {
        display: block;
        text-decoration: none;
        font-weight: 500;
        color: #333;
    }
     .faq-panel .panel-title a:after {
        font-family: 'FontAwesome';
        content: "\\f078";
        float: right;
        transition: transform 0.3s;
    }
    .faq-panel .panel-title a.collapsed:after {
        transform: rotate(-90deg);
    }
    .contact-info-box {
        background: #fff;
        padding: 30px;
        text-align: center;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.07);
        margin-bottom: 20px;
    }
    .contact-info-box .fa {
        font-size: 36px;
        color: #007bff;
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

    <div class="support-header">
        <h1>무엇을 도와드릴까요?</h1>
        <div class="search-bar">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="궁금한 점을 검색해보세요...">
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </div>
    </div>
    
    <div class="container page-section">
        <h2 class="section-title">자주 묻는 질문</h2>
        <div class="panel-group" id="faqAccordion">
            <div class="panel panel-default faq-panel">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#faqAccordion" href="#collapseOne" class="collapsed">시승 신청은 어떻게 하나요?</a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                        저희 웹사이트의 '시승 신청' 페이지에서 원하시는 모델과 시간을 선택하여 간편하게 신청하실 수 있습니다.
                    </div>
                </div>
            </div>
            <div class="panel panel-default faq-panel">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#faqAccordion" href="#collapseTwo" class="collapsed">보증 기간은 어떻게 되나요?</a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        포르쉐 차량의 보증 기간은 모델 및 구매 조건에 따라 상이합니다. 일반적으로 신차 구매 시 4년/80,000km의 보증이 제공됩니다. 자세한 내용은 구매 계약서를 참고하시거나 가까운 전시장으로 문의해주시기 바랍니다.
                    </div>
                </div>
            </div>
             <div class="panel panel-default faq-panel">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#faqAccordion" href="#collapseThree" class="collapsed">Porsche Connect 서비스는 어떻게 가입하나요?</a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                        차량 출고 시 담당 딜러를 통해 가입하시거나, My Porsche 포털을 통해 온라인으로 직접 가입하실 수 있습니다.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="background: #fff;">
        <div class="container page-section">
            <h2 class="section-title">추가 문의</h2>
             <div class="row">
                <div class="col-md-4">
                    <div class="contact-info-box">
                        <i class="fa fa-phone"></i>
                        <h4>전화 상담</h4>
                        <p>1588-0000</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-info-box">
                        <i class="fa fa-envelope"></i>
                        <h4>이메일 문의</h4>
                        <p>support@porsche.co.kr</p>
                    </div>
                </div>
                 <div class="col-md-4">
                    <div class="contact-info-box">
                        <i class="fa fa-comments"></i>
                        <h4>1:1 채팅 상담</h4>
                        <p>웹사이트 하단 채팅 버튼 클릭</p>
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

    <script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html> 