<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시승 신청</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .testdrive-container {
        max-width: 1000px;
        margin: 50px auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    .testdrive-container h1 {
        text-align: center;
        font-weight: 700;
        margin-bottom: 30px;
    }
    .car-select-card {
        border: 2px solid #eee;
        border-radius: 10px;
        padding: 15px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-bottom: 20px;
    }
    .car-select-card:hover, .car-select-card.selected {
        border-color: #337ab7;
        box-shadow: 0 5px 15px rgba(0, 123, 255, 0.2);
        transform: translateY(-5px);
    }
    .car-select-card img {
        max-width: 100%;
        height: 120px;
        object-fit: cover;
        border-radius: 5px;
        margin-bottom: 15px;
    }
    .car-select-card h4 {
        font-weight: 600;
        margin-top: 0;
    }
    .section-title {
        font-size: 22px;
        font-weight: 600;
        color: #333;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #337ab7;
        display: inline-block;
    }
    .btn-submit {
        width: 100%;
        padding: 12px;
        font-size: 18px;
        font-weight: 600;
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
        <div class="testdrive-container">
            <h1><i class="fa fa-road"></i> 시승 신청</h1>
            
            <div class="form-section">
                <h3 class="section-title">1. 시승 차량 선택</h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="car-select-card" data-car="Porsche 550 Spyder">
                            <img src="${pageContext.request.contextPath}/resources/img/porshe_411.jpg" alt="Porsche 550 Spyder">
                            <h4>Porsche 550 Spyder</h4>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="car-select-card" data-car="Porsche 911">
                            <img src="https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-modelimage-sideshot/model/cfbb8ed3-1a15-11ed-80f5-005056bbdc38/porsche-model.png" alt="Porsche 911">
                            <h4>Porsche 911</h4>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="car-select-card" data-car="Porsche Taycan">
                           <img src="https://files.porsche.com/filestore/image/multimedia/none/j1-taycan-gts-modelimage-sideshot/model/03ac131a-d248-11eb-80d9-005056bbdc38/porsche-model.png" alt="Porsche Taycan">
                            <h4>Porsche Taycan</h4>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="selectedCar" name="selectedCar">
            </div>

            <form>
                 <div class="form-section">
                    <h3 class="section-title">2. 예약 정보 입력</h3>
                     <div class="row">
                         <div class="col-md-6 form-group">
                            <label>시승 희망일</label>
                            <div class="input-group date" id="datepicker">
                                <input type="text" class="form-control"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>시승 시간</label>
                            <select class="form-control">
                                <option>오전 10:00</option>
                                <option>오후 13:00</option>
                                <option>오후 15:00</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-title">3. 신청자 정보 입력</h3>
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
                        <label><input type="checkbox" required> 본인은 유효한 운전면허증을 소지하고 있습니다.</label>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary btn-submit">시승 신청하기</button>
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
            // Datepicker 초기화
            $('#datepicker').datepicker({
                format: "yyyy-mm-dd",
                language: "ko",
                autoclose: true,
                todayHighlight: true,
                startDate: new Date()
            });

            // 차량 선택 카드 클릭 이벤트
            $('.car-select-card').on('click', function() {
                // 모든 카드에서 'selected' 클래스 제거
                $('.car-select-card').removeClass('selected');
                // 클릭된 카드에 'selected' 클래스 추가
                $(this).addClass('selected');
                // 숨겨진 input에 선택된 차량 이름 저장
                var carName = $(this).data('car');
                $('#selectedCar').val(carName);
            });
        });
    </script>
</body>
</html> 