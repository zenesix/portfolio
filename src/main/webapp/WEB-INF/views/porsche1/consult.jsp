<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매상담 신청</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .consult-wrapper {
        display: flex;
        max-width: 1200px;
        margin: 50px auto;
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        overflow: hidden;
    }
    .consult-image {
        flex: 1;
        background: url('https://images.unsplash.com/photo-1614200179396-2bdb7f545937?q=80&w=2574&auto=format&fit=crop') no-repeat center center;
        background-size: cover;
    }
    .consult-form {
        flex: 1;
        padding: 50px;
    }
    .consult-form h1 {
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 20px;
        color: #333;
    }
    .consult-form p {
        color: #777;
        margin-bottom: 30px;
    }
    .form-control {
        border-radius: 5px;
        padding: 10px;
        height: auto;
    }
    .btn-submit {
        width: 100%;
        padding: 12px;
        font-size: 18px;
        font-weight: 600;
        margin-top: 20px;
    }
     .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="consult-wrapper">
        <div class="consult-image"></div>
        <div class="consult-form">
            <h1><i class="fa fa-comments-o"></i> 전문가와 함께하는 구매상담</h1>
            <p>전문적인 상담을 통해 고객님께 가장 적합한 포르쉐 모델을 찾아보세요. 아래 양식을 작성해주시면 신속하게 연락드리겠습니다.</p>
            <form>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>성함</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>연락처</label>
                        <input type="text" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label>이메일</label>
                    <input type="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>관심 모델</label>
                    <select class="form-control">
                        <option>Porsche 911</option>
                        <option>Porsche 718 Cayman</option>
                        <option>Porsche Taycan</option>
                        <option>Porsche Panamera</option>
                        <option>Porsche Macan</option>
                        <option>Porsche Cayenne</option>
                        <option selected>Porsche 550 Spyder</option>
                    </select>
                </div>
                 <div class="form-group">
                    <label>상담 희망 날짜</label>
                    <div class="input-group date" id="datepicker">
                        <input type="text" class="form-control"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    </div>
                </div>
                <div class="form-group">
                    <label>추가 문의사항</label>
                    <textarea class="form-control" rows="4"></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-submit">상담 신청하기</button>
            </form>
             <a href="${pageContext.request.contextPath}/hyundai" class="back-link">메인으로 돌아가기</a>
        </div>
    </div>
    
    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
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