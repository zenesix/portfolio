<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Future Porsche Experience</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css"/>
    <style>
        body { margin:0; font-family:'Pretendard',sans-serif; background:#111; color:#fff; transition:background 0.5s,color 0.5s; }
        .future-header { text-align:center; padding:60px 0 30px 0; font-size:3rem; font-weight:900; letter-spacing:-2px; }
        .toggle-mode { position:fixed; top:24px; right:32px; z-index:1000; background:none; border:none; color:#ffcc00; font-size:2rem; cursor:pointer; }
        .section { max-width:1200px; margin:60px auto; padding:40px; border-radius:24px; background:rgba(30,30,30,0.95); box-shadow:0 8px 40px rgba(0,0,0,0.25);}
        .section-title { font-size:2rem; font-weight:700; margin-bottom:24px; }
        .ai-recommend { margin-top:24px; }
        .news-feed { max-height:220px; overflow:auto; }
        @media (max-width: 900px) {
            .section { padding:20px; }
            .future-header { font-size:2rem; }
        }
    </style>
</head>
<body>
    <button class="toggle-mode" onclick="toggleMode()"><i class="fa fa-moon"></i></button>
    <div class="future-header animate__animated animate__fadeInDown">Future Porsche Experience</div>
    <div class="section animate__animated animate__fadeInUp">
        <div class="section-title"><i class="fa fa-car-side"></i> 3D Porsche 모델 체험</div>
        <div id="porsche-3d" style="width:100%;height:400px;background:#222;border-radius:16px;"></div>
    </div>
    <div class="section animate__animated animate__fadeInUp">
        <div class="section-title"><i class="fa fa-bolt"></i> 실시간 EV 충전소 현황 </div>
        <div id="map" style="width:100%;height:300px;border-radius:16px;background:#222;display:flex;align-items:center;justify-content:center;color:#ffcc00;font-size:1.2rem;">Demo: 지도 API 연동 필요</div>
    </div>
    <div class="section animate__animated animate__fadeInUp">
        <div class="section-title"><i class="fa fa-robot"></i> AI 맞춤형 차량 추천 </div>
        <form id="ai-form">
            <input type="text" id="userPref" placeholder="당신의 라이프스타일/선호를 입력하세요" style="width:60%;padding:8px;">
            <button type="submit" class="btn" style="background:#ffcc00;color:#18171c;font-weight:700;padding:8px 18px;border-radius:8px;">추천받기</button>
        </form>
        <div class="ai-recommend" id="ai-recommend"></div>
    </div>
    <div class="section animate__animated animate__fadeInUp">
        <div class="section-title"><i class="fa fa-newspaper"></i> 실시간 Porsche 뉴스/이벤트 (Demo)</div>
        <div class="news-feed" id="news-feed">로딩 중...</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/three@0.152.2/build/three.min.js"></script>
    <script>
        // 다크/라이트 모드 토글
        function toggleMode() {
            document.body.classList.toggle('light');
            document.body.style.background = document.body.classList.contains('light') ? '#fff' : '#111';
            document.body.style.color = document.body.classList.contains('light') ? '#222' : '#fff';
        }
        // 3D Porsche 모델 (Three.js 예시)
        window.onload = function() {
            const scene = new THREE.Scene();
            const camera = new THREE.PerspectiveCamera(75, 2.5, 0.1, 1000);
            const renderer = new THREE.WebGLRenderer({antialias:true});
            renderer.setSize(document.getElementById('porsche-3d').offsetWidth, 400);
            document.getElementById('porsche-3d').appendChild(renderer.domElement);
            const geometry = new THREE.BoxGeometry(2, 1, 4); // 실제 Porsche 모델로 교체 가능
            const material = new THREE.MeshStandardMaterial({color:0xffcc00});
            const car = new THREE.Mesh(geometry, material);
            scene.add(car);
            camera.position.z = 8;
            const light = new THREE.PointLight(0xffffff, 1, 100);
            light.position.set(10, 10, 10);
            scene.add(light);
            function animate() {
                requestAnimationFrame(animate);
                car.rotation.y += 0.01;
                renderer.render(scene, camera);
            }
            animate();
        };
        // AI 추천 (Demo)
        document.getElementById('ai-form').onsubmit = function(e) {
            e.preventDefault();
            const pref = document.getElementById('userPref').value;
            document.getElementById('ai-recommend').innerHTML = '<i class="fa fa-spinner fa-spin"></i> AI가 추천 중...';
            setTimeout(function() {
                document.getElementById('ai-recommend').innerHTML = '<b>추천 차량:</b> Taycan Turbo S<br><span style="color:#ffcc00">' + pref + '</span> 라이프스타일에 최적화!';
            }, 1500);
        };
        // 실시간 뉴스/이벤트 (Demo, 실제 API키 필요)
        fetch('https://newsapi.org/v2/everything?q=porsche&apiKey=demo')
            .then(res=>res.json()).then(data=>{
                let html = '';
                (data.articles||[]).slice(0,5).forEach(a=>{
                    html += `<div style='margin-bottom:12px;'><a href='${a.url}' target='_blank' style='color:#ffcc00;font-weight:600;'>${a.title}</a><br><span style='font-size:13px;color:#aaa;'>${a.source.name}</span></div>`;
                });
                document.getElementById('news-feed').innerHTML = html || '최신 뉴스를 불러올 수 없습니다.';
            }).catch(()=>{document.getElementById('news-feed').innerHTML='최신 뉴스를 불러올 수 없습니다.';});
    </script>
</body>
</html> 