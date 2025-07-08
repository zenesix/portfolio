<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적내기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .quote-container {
        max-width: 800px;
        margin: 50px auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    .quote-container h1 {
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 30px;
        text-align: center;
        color: #333;
    }
    .form-group label {
        font-size: 16px;
        font-weight: 600;
        color: #555;
    }
    .form-control {
        height: 50px;
        border-radius: 10px;
        box-shadow: none;
        border-color: #ddd;
    }
    .form-control:focus {
        border-color: #337ab7;
        box-shadow: none;
    }
    .btn-primary {
        width: 100%;
        height: 50px;
        border-radius: 10px;
        font-size: 18px;
        font-weight: 600;
        background-color: #337ab7;
        border-color: #337ab7;
        transition: all 0.3s ease;
    }
    .btn-primary:hover {
        background-color: #286090;
        border-color: #204d74;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="quote-container">
            <h1><i class="fa fa-car"></i> 온라인 견적내기</h1>
            <form>
                <div class="form-group">
                    <label for="carModel">차량 모델</label>
                    <select class="form-control" id="carModel">
                        <option>Porsche 550 Spyder</option>
                        <option>CASPER Electric</option>
                        <option>GRANDEUR</option>
                        <option>SONATA</option>
                        <option>AVANTE</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="userName">이름</label>
                    <input type="text" class="form-control" id="userName" placeholder="성함을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="userPhone">연락처</label>
                    <input type="tel" class="form-control" id="userPhone" placeholder="'-' 없이 숫자만 입력하세요">
                </div>
                 <div class="form-group">
                    <label for="userEmail">이메일</label>
                    <input type="email" class="form-control" id="userEmail" placeholder="이메일 주소를 입력하세요">
                </div>
                <button type="submit" class="btn btn-primary">견적 신청하기</button>
            </form>
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