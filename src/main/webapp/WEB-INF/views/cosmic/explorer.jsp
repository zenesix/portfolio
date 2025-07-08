<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cosmic Data Explorer - 우주 데이터 탐험가</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Three.js for 3D visualization -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <!-- Chart.js for data visualization -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- AOS Animation Library -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <style>
        :root {
            --cosmic-primary: #0B1426;
            --cosmic-secondary: #1E3A8A;
            --cosmic-accent: #3B82F6;
            --cosmic-glow: #60A5FA;
            --cosmic-text: #E5E7EB;
            --cosmic-dark: #111827;
        }
        
        body {
            background: linear-gradient(135deg, var(--cosmic-primary) 0%, var(--cosmic-dark) 100%);
            color: var(--cosmic-text);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
        }
        
        .cosmic-header {
            background: rgba(11, 20, 38, 0.9);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--cosmic-accent);
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .cosmic-title {
            background: linear-gradient(45deg, var(--cosmic-accent), var(--cosmic-glow));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            margin: 0;
        }
        
        .cosmic-card {
            background: rgba(30, 58, 138, 0.1);
            border: 1px solid var(--cosmic-accent);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            margin-bottom: 2rem;
        }
        
        .cosmic-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(59, 130, 246, 0.3);
            border-color: var(--cosmic-glow);
        }
        
        .cosmic-card-header {
            background: linear-gradient(45deg, var(--cosmic-secondary), var(--cosmic-accent));
            color: white;
            padding: 1.5rem;
            border-radius: 15px 15px 0 0;
            border-bottom: 1px solid var(--cosmic-accent);
        }
        
        .cosmic-card-body {
            padding: 2rem;
        }
        
        .data-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .metric-card {
            background: rgba(59, 130, 246, 0.1);
            border: 1px solid var(--cosmic-accent);
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .metric-card:hover {
            background: rgba(59, 130, 246, 0.2);
            transform: scale(1.05);
        }
        
        .metric-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--cosmic-glow);
            margin-bottom: 0.5rem;
        }
        
        .metric-label {
            color: var(--cosmic-text);
            font-size: 0.9rem;
            opacity: 0.8;
        }
        
        .loading-spinner {
            border: 3px solid rgba(59, 130, 246, 0.3);
            border-top: 3px solid var(--cosmic-accent);
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 2rem auto;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .cosmic-btn {
            background: linear-gradient(45deg, var(--cosmic-accent), var(--cosmic-glow));
            border: none;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .cosmic-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.4);
        }
        
        .earth-container {
            position: relative;
            height: 400px;
            border-radius: 15px;
            overflow: hidden;
            background: var(--cosmic-dark);
        }
        
        .stellar-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-image: 
                radial-gradient(2px 2px at 20px 30px, #eee, transparent),
                radial-gradient(2px 2px at 40px 70px, rgba(255,255,255,0.8), transparent),
                radial-gradient(1px 1px at 90px 40px, #fff, transparent),
                radial-gradient(1px 1px at 130px 80px, rgba(255,255,255,0.6), transparent),
                radial-gradient(2px 2px at 160px 30px, #ddd, transparent);
            background-repeat: repeat;
            background-size: 200px 100px;
            animation: twinkle 20s linear infinite;
        }
        
        @keyframes twinkle {
            0% { opacity: 0.3; }
            50% { opacity: 1; }
            100% { opacity: 0.3; }
        }
        
        .floating-particles {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }
        
        .particle {
            position: absolute;
            width: 2px;
            height: 2px;
            background: var(--cosmic-glow);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 0; }
            50% { transform: translateY(-20px) rotate(180deg); opacity: 1; }
        }
        
        .apod-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
            border: 2px solid var(--cosmic-accent);
        }
        
        .neo-list {
            max-height: 300px;
            overflow-y: auto;
            background: rgba(11, 20, 38, 0.5);
            border-radius: 10px;
            padding: 1rem;
        }
        
        .neo-item {
            background: rgba(59, 130, 246, 0.1);
            border: 1px solid var(--cosmic-accent);
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 0.5rem;
            transition: all 0.3s ease;
        }
        
        .neo-item:hover {
            background: rgba(59, 130, 246, 0.2);
            transform: translateX(5px);
        }
        
        .danger-level {
            padding: 0.25rem 0.5rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .danger-low { background: #10B981; color: white; }
        .danger-medium { background: #F59E0B; color: white; }
        .danger-high { background: #EF4444; color: white; }
        
        .weather-indicator {
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 0.5rem;
        }
        
        .weather-normal { background: #10B981; }
        .weather-warning { background: #F59E0B; }
        .weather-danger { background: #EF4444; }
    </style>
</head>
<body>
    <div class="stellar-background"></div>
    <div class="floating-particles" id="particles"></div>
    
    <header class="cosmic-header">
        <div class="container">
            <h1 class="cosmic-title">
                <i class="fas fa-rocket"></i> Cosmic Data Explorer
            </h1>
            <p class="text-center text-light mt-2">실시간 NASA API 연동 우주 데이터 탐험가</p>
        </div>
    </header>
    
    <div class="container mt-4">
        <!-- 실시간 메트릭 대시보드 -->
        <div class="cosmic-card" data-aos="fade-up">
            <div class="cosmic-card-header">
                <h3><i class="fas fa-chart-line"></i> 실시간 우주 메트릭</h3>
            </div>
            <div class="cosmic-card-body">
                <div class="data-grid">
                    <div class="metric-card" data-aos="zoom-in" data-aos-delay="100">
                        <div class="metric-value" id="neoCount">-</div>
                        <div class="metric-label">근지구 천체</div>
                    </div>
                    <div class="metric-card" data-aos="zoom-in" data-aos-delay="200">
                        <div class="metric-value" id="solarWind">-</div>
                        <div class="metric-label">태양풍 속도 (km/s)</div>
                    </div>
                    <div class="metric-card" data-aos="zoom-in" data-aos-delay="300">
                        <div class="metric-value" id="spaceWeather">-</div>
                        <div class="metric-label">우주 날씨 상태</div>
                    </div>
                    <div class="metric-card" data-aos="zoom-in" data-aos-delay="400">
                        <div class="metric-value" id="earthDistance">-</div>
                        <div class="metric-label">지구-달 거리 (km)</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 천문학 사진 -->
        <div class="cosmic-card" data-aos="fade-up" data-aos-delay="200">
            <div class="cosmic-card-header">
                <h3><i class="fas fa-image"></i> NASA 천문학 사진 (APOD)</h3>
            </div>
            <div class="cosmic-card-body">
                <div class="loading-spinner" id="apodLoading"></div>
                <div id="apodContent" style="display: none;">
                    <img id="apodImage" class="apod-image mb-3" alt="NASA APOD">
                    <h4 id="apodTitle" class="text-light"></h4>
                    <p id="apodExplanation" class="text-light-50"></p>
                    <p class="text-muted"><small id="apodDate"></small></p>
                </div>
            </div>
        </div>
        
        <!-- 근지구 천체 모니터링 -->
        <div class="cosmic-card" data-aos="fade-up" data-aos-delay="300">
            <div class="cosmic-card-header">
                <h3><i class="fas fa-asterisk"></i> 근지구 천체 모니터링</h3>
            </div>
            <div class="cosmic-card-body">
                <div class="loading-spinner" id="neoLoading"></div>
                <div id="neoContent" style="display: none;">
                    <div class="neo-list" id="neoList"></div>
                </div>
            </div>
        </div>
        
        <!-- 우주 날씨 차트 -->
        <div class="cosmic-card" data-aos="fade-up" data-aos-delay="400">
            <div class="cosmic-card-header">
                <h3><i class="fas fa-sun"></i> 우주 날씨 모니터링</h3>
            </div>
            <div class="cosmic-card-body">
                <canvas id="spaceWeatherChart" width="400" height="200"></canvas>
            </div>
        </div>
        
        <!-- 지구 이미지 -->
        <div class="cosmic-card" data-aos="fade-up" data-aos-delay="500">
            <div class="cosmic-card-header">
                <h3><i class="fas fa-globe-americas"></i> 지구 위성 이미지</h3>
            </div>
            <div class="cosmic-card-body">
                <div class="loading-spinner" id="earthLoading"></div>
                <div id="earthContent" style="display: none;">
                    <div class="earth-container">
                        <img id="earthImage" style="width: 100%; height: 100%; object-fit: cover;" alt="Earth from Space">
                    </div>
                    <div class="mt-3">
                        <label for="latitude" class="form-label">위도:</label>
                        <input type="number" id="latitude" class="form-control" value="37.5665" step="0.0001">
                        <label for="longitude" class="form-label">경도:</label>
                        <input type="number" id="longitude" class="form-control" value="126.9780" step="0.0001">
                        <button class="cosmic-btn mt-2" onclick="loadEarthImagery()">
                            <i class="fas fa-search"></i> 위치 검색
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // AOS 초기화
        AOS.init({
            duration: 1000,
            once: true
        });
        
        // 플로팅 파티클 생성
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            for (let i = 0; i < 50; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 6 + 's';
                particle.style.animationDuration = (Math.random() * 3 + 3) + 's';
                particlesContainer.appendChild(particle);
            }
        }
        
        // NASA APOD 데이터 로드
        async function loadAPOD() {
            try {
                const response = await fetch('/cosmic/apod');
                const data = await response.json();
                
                if (data.success) {
                    const apod = data.data;
                    document.getElementById('apodImage').src = apod.url;
                    document.getElementById('apodTitle').textContent = apod.title;
                    document.getElementById('apodExplanation').textContent = apod.explanation;
                    document.getElementById('apodDate').textContent = apod.date;
                    
                    document.getElementById('apodLoading').style.display = 'none';
                    document.getElementById('apodContent').style.display = 'block';
                }
            } catch (error) {
                console.error('APOD 로드 실패:', error);
                document.getElementById('apodLoading').innerHTML = '<p class="text-danger">데이터 로드 실패</p>';
            }
        }
        
        // 근지구 천체 데이터 로드 (NEO Browse)
        async function loadNEO() {
            try {
                const response = await fetch('/cosmic/neo');
                const data = await response.json();
                if (data.success) {
                    const neoData = data.data;
                    const neoList = document.getElementById('neoList');
                    neoList.innerHTML = '';
                    // NEO 카운트 업데이트
                    document.getElementById('neoCount').textContent = neoData.near_earth_objects.length;
                    // NEO 리스트 생성
                    neoData.near_earth_objects.forEach(neo => {
                        const neoItem = document.createElement('div');
                        neoItem.className = 'neo-item';
                        const isHazardous = neo.is_potentially_hazardous_asteroid;
                        const dangerClass = isHazardous ? 'danger-high' : 'danger-low';
                        const dangerText = isHazardous ? '위험' : '안전';
                        const diameter = (neo.estimated_diameter && neo.estimated_diameter.kilometers && typeof neo.estimated_diameter.kilometers.estimated_diameter_max === 'number')
                            ? neo.estimated_diameter.kilometers.estimated_diameter_max.toFixed(2)
                            : '알 수 없음';
                        neoItem.innerHTML = `
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <strong>${neo.name}</strong><br>
                                    <small>크기: ${diameter} km</small>
                                </div>
                                <span class="danger-level ${dangerClass}">${dangerText}</span>
                            </div>
                        `;
                        neoList.appendChild(neoItem);
                    });
                    document.getElementById('neoLoading').style.display = 'none';
                    document.getElementById('neoContent').style.display = 'block';
                }
            } catch (error) {
                console.error('NEO 로드 실패:', error);
                document.getElementById('neoLoading').innerHTML = '<p class="text-danger">데이터 로드 실패</p>';
            }
        }
        
        // 우주 날씨 데이터 로드 (DONKI)
        let spaceWeatherChartInstance = null;
        async function loadSpaceWeather() {
            try {
                // 최근 7일간 알림
                const today = new Date();
                const endDate = today.toISOString().slice(0, 10);
                const startDate = new Date(today.getTime() - 6 * 24 * 60 * 60 * 1000).toISOString().slice(0, 10);
                const response = await fetch(`/cosmic/donki?startDate=${startDate}&endDate=${endDate}`);
                const data = await response.json();
                if (data.success) {
                    // 차트 데이터 예시: 알림 개수 추이
                    const notifications = data.data;
                    const dateCount = {};
                    notifications.forEach(n => {
                        const date = n.messageIssueTime ? n.messageIssueTime.slice(0, 10) : '알수없음';
                        dateCount[date] = (dateCount[date] || 0) + 1;
                    });
                    const labels = Object.keys(dateCount);
                    const counts = Object.values(dateCount);
                    // Chart.js destroy 처리
                    if (spaceWeatherChartInstance) {
                        spaceWeatherChartInstance.destroy();
                    }
                    const ctx = document.getElementById('spaceWeatherChart').getContext('2d');
                    spaceWeatherChartInstance = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: '우주날씨 알림 개수',
                                data: counts,
                                backgroundColor: 'rgba(59, 130, 246, 0.5)',
                                borderColor: '#3B82F6',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: { legend: { labels: { color: '#E5E7EB' } } },
                            scales: {
                                x: { ticks: { color: '#E5E7EB' }, grid: { color: 'rgba(229, 231, 235, 0.1)' } },
                                y: { ticks: { color: '#E5E7EB' }, grid: { color: 'rgba(229, 231, 235, 0.1)' } }
                            }
                        }
                    });
                    // 메트릭 업데이트
                    document.getElementById('spaceWeather').textContent = counts.length > 0 ? '활발' : '정상';
                }
            } catch (error) {
                console.error('우주 날씨 로드 실패:', error);
            }
        }
        
        // 지구 위성 이미지 (EPIC)
        async function loadEarthImagery() {
            try {
                const response = await fetch('/cosmic/epic');
                const data = await response.json();
                if (data.success && data.data.length > 0) {
                    const img = data.data[0];
                    const dateParts = img.date.split(' ')[0].split('-');
                    const imgUrl = `https://epic.gsfc.nasa.gov/archive/natural/${dateParts[0]}/${dateParts[1]}/${dateParts[2]}/png/${img.image}.png`;
                    document.getElementById('earthImage').src = imgUrl;
                    document.getElementById('earthLoading').style.display = 'none';
                    document.getElementById('earthContent').style.display = 'block';
                } else {
                    document.getElementById('earthLoading').innerHTML = '<p class="text-danger">이미지 없음</p>';
                }
            } catch (error) {
                console.error('지구 이미지 로드 실패:', error);
                document.getElementById('earthLoading').innerHTML = '<p class="text-danger">이미지 로드 실패</p>';
            }
        }
        
        // 페이지 로드 시 초기화
        document.addEventListener('DOMContentLoaded', function() {
            createParticles();
            loadAPOD();
            loadNEO();
            loadSpaceWeather();
            loadEarthImagery();
            document.getElementById('earthDistance').textContent = Math.floor(Math.random() * 50000 + 350000);
            setInterval(() => {
                loadNEO();
                loadSpaceWeather();
            }, 30000);
        });
    </script>
</body>
</html> 