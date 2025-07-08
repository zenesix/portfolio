<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche - 모델</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .model-header {
        background: url('https://images.unsplash.com/photo-1555505019-8c3f9e4f4853?q=80&w=2670&auto=format&fit=crop') no-repeat center center;
        background-size: cover;
        color: white;
        text-align: center;
        padding: 120px 0;
        text-shadow: 2px 2px 8px rgba(0,0,0,0.7);
    }
    .model-header h1 {
        font-size: 56px;
        font-weight: 700;
    }
    .model-header p {
        font-size: 24px;
        font-weight: 300;
    }
    .model-container {
        padding: 60px 0;
    }
    .model-card {
        background-color: #fff;
        border-radius: 15px;
        overflow: hidden;
        margin-bottom: 30px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
    }
    .model-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 30px rgba(0,0,0,0.15);
    }
    .model-card img {
        width: 100%;
        height: 250px;
        object-fit: cover;
    }
    .model-card-content {
        padding: 25px;
    }
    .model-card-content h3 {
        margin-top: 0;
        font-weight: 600;
    }
    .model-card-content .price {
        font-size: 18px;
        font-weight: 500;
        color: #337ab7;
        margin-bottom: 15px;
    }
    .model-card-content .features {
        list-style: none;
        padding: 0;
        margin-bottom: 20px;
        color: #666;
    }
    .model-card-content .features li {
        margin-bottom: 8px;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 40px;
        font-size: 16px;
    }
    .custom-modal-overlay {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: rgba(0,0,0,0.7);
      z-index: 9999;
      display: flex;
      align-items: center;
      justify-content: center;
      animation: fadeIn 0.3s;
    }
    .custom-modal-box {
      background: #18171c;
      color: #fff;
      border-radius: 18px;
      max-width: 420px;
      width: 90vw;
      padding: 36px 28px 28px 28px;
      box-shadow: 0 8px 40px rgba(0,0,0,0.25);
      position: relative;
      text-align: center;
      animation: modalPop 0.3s;
    }
    .custom-modal-img {
      width: 90%;
      max-width: 320px;
      border-radius: 12px;
      margin-bottom: 18px;
      box-shadow: 0 2px 16px rgba(0,0,0,0.18);
    }
    .custom-modal-close {
      position: absolute;
      top: 16px;
      right: 18px;
      background: none;
      border: none;
      color: #fff;
      font-size: 28px;
      cursor: pointer;
      transition: color 0.2s;
    }
    .custom-modal-close:hover { color: #ffcc00; }
    .custom-modal-desc {
      font-size: 16px;
      margin-bottom: 18px;
      color: #ccc;
    }
    .custom-modal-specs {
      list-style: none;
      padding: 0;
      margin: 0 0 8px 0;
      text-align: left;
      color: #eee;
      font-size: 15px;
    }
    .custom-modal-specs li { margin-bottom: 7px; }
    @keyframes fadeIn {
      from { opacity: 0; } to { opacity: 1; }
    }
    @keyframes modalPop {
      from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; }
    }
</style>
</head>
<body>

    <div class="model-header">
        <h1>Our Models</h1>
        <p>Find the Porsche that's right for you.</p>
    </div>

    <div class="container model-container">
        <div class="row">
            <!-- Model 1: 911 -->
            <div class="col-md-4">
                <div class="model-card">
                    <img src="https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-modelimage-sideshot/model/cfbb8ed3-1a15-11ed-80f5-005056bbdc38/porsche-model.png" alt="Porsche 911">
                    <div class="model-card-content">
                        <h3>Porsche 911</h3>
                        <p class="price">Starting at ₩167,300,000</p>
                        <ul class="features">
                            <li><i class="fa fa-cogs"></i> 3.0L Twin-Turbo Boxer 6</li>
                            <li><i class="fa fa-tachometer-alt"></i> 0-100 km/h: 4.2s</li>
                            <li><i class="fa fa-horse-head"></i> 385 PS</li>
                        </ul>
                        <button class="btn btn-primary btn-block" onclick="openModal('modal911')">자세히 보기</button>
                    </div>
                </div>
            </div>
            <!-- Model 2: Taycan -->
            <div class="col-md-4">
                <div class="model-card">
                    <img src="https://files.porsche.com/filestore/image/multimedia/none/j1-taycan-gts-modelimage-sideshot/model/03ac131a-d248-11eb-80d9-005056bbdc38/porsche-model.png" alt="Porsche Taycan">
                    <div class="model-card-content">
                        <h3>Porsche Taycan</h3>
                        <p class="price">Starting at ₩143,700,000</p>
                         <ul class="features">
                            <li><i class="fa fa-bolt"></i> All-Electric</li>
                            <li><i class="fa fa-tachometer-alt"></i> 0-100 km/h: 2.8s</li>
                            <li><i class="fa fa-charging-station"></i> Range: 450km</li>
                        </ul>
                        <button class="btn btn-primary btn-block" onclick="openModal('modalTaycan')">자세히 보기</button>
                    </div>
                </div>
            </div>
            <!-- Model 3: 550 Spyder -->
            <div class="col-md-4">
                <div class="model-card">
                    <img src="${pageContext.request.contextPath}/resources/img/porshe_411.jpg" alt="Porsche 550 Spyder">
                    <div class="model-card-content">
                        <h3>Porsche 550 Spyder</h3>
                        <p class="price">Classic Model</p>
                         <ul class="features">
                            <li><i class="fa fa-cogs"></i> 1.5L Flat-Four</li>
                            <li><i class="fa fa-tachometer-alt"></i> Top Speed: 220 km/h</li>
                            <li><i class="fa fa-star"></i> Legendary Heritage</li>
                        </ul>
                        <button class="btn btn-primary btn-block" onclick="openModal('modal550')">자세히 보기</button>
                    </div>
                </div>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/porsche" class="back-link">메인으로 돌아가기</a>
    </div>

    <!-- Modal Templates -->
    <div id="modal911" class="custom-modal-overlay" style="display:none;">
      <div class="custom-modal-box">
        <button class="custom-modal-close" onclick="closeModal('modal911')">&times;</button>
        <img src="https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-modelimage-sideshot/model/cfbb8ed3-1a15-11ed-80f5-005056bbdc38/porsche-model.png" alt="Porsche 911" class="custom-modal-img">
        <h2>Porsche 911</h2>
        <p class="custom-modal-desc">포르쉐 911은 1963년 첫 출시 이후, 스포츠카의 아이콘으로 자리매김한 모델입니다. 3.0L 트윈터보 박서 엔진, 후륜구동의 다이내믹한 주행감, 그리고 시대를 초월한 디자인이 결합되어 있습니다.</p>
        <ul class="custom-modal-specs">
          <li><b>최고출력:</b> 385 PS</li>
          <li><b>0-100km/h:</b> 4.2초</li>
          <li><b>최고속도:</b> 293 km/h</li>
          <li><b>드라이브:</b> 후륜구동(RWD)</li>
        </ul>
      </div>
    </div>
    <div id="modalTaycan" class="custom-modal-overlay" style="display:none;">
      <div class="custom-modal-box">
        <button class="custom-modal-close" onclick="closeModal('modalTaycan')">&times;</button>
        <img src="https://files.porsche.com/filestore/image/multimedia/none/j1-taycan-gts-modelimage-sideshot/model/03ac131a-d248-11eb-80d9-005056bbdc38/porsche-model.png" alt="Porsche Taycan" class="custom-modal-img">
        <h2>Porsche Taycan</h2>
        <p class="custom-modal-desc">포르쉐 타이칸은 브랜드 최초의 순수 전기 스포츠카로, 혁신적인 800V 시스템과 즉각적인 토크, 그리고 포르쉐만의 감성을 모두 담았습니다.</p>
        <ul class="custom-modal-specs">
          <li><b>최고출력:</b> 625 PS</li>
          <li><b>0-100km/h:</b> 2.8초</li>
          <li><b>주행거리:</b> 450 km</li>
          <li><b>충전:</b> 5분 충전 시 100km 주행</li>
        </ul>
      </div>
    </div>
    <div id="modal550" class="custom-modal-overlay" style="display:none;">
      <div class="custom-modal-box">
        <button class="custom-modal-close" onclick="closeModal('modal550')">&times;</button>
        <img src="${pageContext.request.contextPath}/resources/img/porshe_411.jpg" alt="Porsche 550 Spyder" class="custom-modal-img">
        <h2>Porsche 550 Spyder</h2>
        <p class="custom-modal-desc">550 스파이더는 경량 바디와 미드십 엔진 구조로 1950년대 모터스포츠를 지배했던 전설적인 모델입니다. 클래식한 디자인과 레이싱 헤리티지를 모두 갖췄습니다.</p>
        <ul class="custom-modal-specs">
          <li><b>엔진:</b> 1.5L 플랫-포</li>
          <li><b>최고속도:</b> 220 km/h</li>
          <li><b>구동방식:</b> 미드십(RMR)</li>
          <li><b>생산연도:</b> 1953~1956</li>
        </ul>
      </div>
    </div>

    <script>
    function openModal(id) {
      document.getElementById(id).style.display = 'flex';
      setTimeout(function() {
        document.getElementById(id).style.opacity = 1;
      }, 10);
      // ESC로 닫기
      document.onkeydown = function(e) {
        if (e.key === 'Escape') closeModal(id);
      };
    }
    function closeModal(id) {
      var modal = document.getElementById(id);
      modal.style.opacity = 0;
      setTimeout(function() { modal.style.display = 'none'; }, 200);
      document.onkeydown = null;
    }
    // 배경 클릭 시 닫기
    document.addEventListener('DOMContentLoaded', function() {
      ['modal911','modalTaycan','modal550'].forEach(function(id) {
        var modal = document.getElementById(id);
        if (modal) {
          modal.addEventListener('click', function(e) {
            if (e.target === modal) closeModal(id);
          });
        }
      });
    });
    </script>

</body>
</html> 