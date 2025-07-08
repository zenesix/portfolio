<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>블덱스 - 코스팅 분석</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background: #f7fafd; }
        .blogdex-tabs-header {
            background: #2362c7;
            color: #fff;
            padding: 1.2rem 0 0.7rem 0;
            margin-bottom: 0;
        }
        .blogdex-tabs-header h2 {
            font-size: 1.7rem;
            font-weight: bold;
            margin: 0 0 0.5rem 0;
        }
        .nav-tabs {
            border-bottom: none;
            background: #2362c7;
            padding-left: 0;
            padding-right: 0;
        }
        .nav-tabs .nav-item {
            margin-bottom: 0;
        }
        .nav-tabs .nav-link {
            color: #fff;
            font-weight: 500;
            border: none;
            border-radius: 0;
            background: #2362c7;
            margin-right: 0.2rem;
            padding: 1rem 2.5rem 1rem 2.5rem;
            font-size: 1.1rem;
            transition: background 0.2s, color 0.2s;
            
            
        }
        .nav-tabs .nav-link.active, .nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover {
            background: #1a4fa0;
            color: #fff;
            font-weight: bold;
            border: none;
            box-shadow: 0 2px 0 #fff inset;
        }
        .tab-content {
            background: #fff;
            border-radius: 0 0 1rem 1rem;
            box-shadow: 0 2px 8px #e3eaf7;
            padding: 2rem 2rem 2rem 2rem;
            min-height: 400px;
        }
        .profile-box { display: flex; align-items: center; margin-bottom: 1rem; }
        .profile-img { width: 60px; height: 60px; border-radius: 50%; margin-right: 1rem; }
        .score-box { font-size: 1.2rem; margin-right: 2rem; }
        .blog-title { font-weight: bold; font-size: 1.3rem; }
        .chart-container { background: #fff; border-radius: 10px; box-shadow: 0 2px 8px #eee; padding: 2rem; margin-bottom: 2rem; }
    </style>
</head>
<body>
<div class="container-fluid px-0">
    <div class="blogdex-tabs-header text-center">
        <h2>블덱스</h2>
        <ul class="nav nav-tabs justify-content-center" id="blogdexTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="myblog-tab" data-toggle="tab" href="#myblog" role="tab" aria-controls="myblog" aria-selected="false">내 블로그</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="score-tab" data-toggle="tab" href="#score" role="tab" aria-controls="score" aria-selected="false">지수 조회</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="total-tab" data-toggle="tab" href="#total" role="tab" aria-controls="total" aria-selected="false">누적 조회</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="posting-tab" data-toggle="tab" href="#posting" role="tab" aria-controls="posting" aria-selected="false">포스팅 분석</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="costing-tab" data-toggle="tab" href="#costing" role="tab" aria-controls="costing" aria-selected="true">경쟁사분석</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="seo-tab" data-toggle="tab" href="#seo" role="tab" aria-controls="seo" aria-selected="false">SEO 점검기</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="traffic-tab" data-toggle="tab" href="#traffic" role="tab" aria-controls="traffic" aria-selected="false">트래픽 급증/급감</a>
            </li>
        </ul>
    </div>
    <div class="tab-content mx-auto" id="blogdexTabContent" style="max-width:900px;">
        <div class="tab-pane fade" id="myblog" role="tabpanel" aria-labelledby="myblog-tab">
            <div class="text-center text-muted py-5">내 블로그 정보 영역 (추후 구현)</div>
        </div>
        <div class="tab-pane fade" id="score" role="tabpanel" aria-labelledby="score-tab">
            <div class="text-center text-muted py-5">지수 조회 영역 (추후 구현)</div>
        </div>
        <div class="tab-pane fade" id="total" role="tabpanel" aria-labelledby="total-tab">
            <div class="text-center text-muted py-5">누적 조회 영역 (추후 구현)</div>
        </div>
        <div class="tab-pane fade" id="posting" role="tabpanel" aria-labelledby="posting-tab">
            <div class="text-center text-muted py-5">포스팅 분석 영역 (추후 구현)</div>
        </div>
        <div class="tab-pane fade show active" id="costing" role="tabpanel" aria-labelledby="costing-tab">
            <!-- blogdex.jsp의 차트 영역 복사 -->
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="profile-box">
                        <img src="/resources/img/default_profile.png" class="profile-img" alt="내 블로그">
                        <div>
                            <div class="blog-title">myblog</div>
                            <div class="score-box">점수: <span class="text-primary font-weight-bold">82</span> | 순위: <span class="text-success font-weight-bold">15위</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-box">
                        <img src="/resources/img/rival_profile.png" class="profile-img" alt="경쟁 블로그">
                        <div>
                            <div class="blog-title">rivalblog</div>
                            <div class="score-box">점수: <span class="text-danger font-weight-bold">78</span> | 순위: <span class="text-warning font-weight-bold">22위</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="chart-container mb-4">
                <h5 class="mb-3">점수 추이 비교</h5>
                <canvas id="scoreChart" height="80"></canvas>
            </div>
            <div class="chart-container">
                <h5 class="mb-3">순위 추이 비교</h5>
                <canvas id="rankChart" height="80"></canvas>
            </div>
        </div>
        <div class="tab-pane fade" id="seo" role="tabpanel" aria-labelledby="seo-tab">
            <div class="text-center mb-4">
                <h4>SEO 점검기</h4>
                <form id="seoForm" class="form-inline justify-content-center mb-3">
                    <input type="url" class="form-control mr-2" id="seoUrl" placeholder="분석할 URL 입력" style="width:350px;" required>
                    <button type="submit" class="btn btn-primary">분석</button>
                </form>
                <div id="seoLoading" style="display:none;">
                    <div class="spinner-border text-primary" role="status"><span class="sr-only">분석중...</span></div>
                    <div>분석중입니다...</div>
                </div>
            </div>
            <div id="seoResult" style="display:none;">
                <div class="seo-summary-box" style="display:flex;justify-content:center;align-items:center;gap:2rem;margin:2rem 0;">
                    <div style="text-align:center;">
                        <div style="font-size:2.5rem;font-weight:bold;" id="seoScoreSummary">0</div>
                        <div style="font-size:1.1rem;">SEO 점수</div>
                        <div style="font-size:0.9rem;color:#888;">분석 결과를 확인하세요</div>
                    </div>
                    <div style="border-left:1px solid #eee;height:60px;"></div>
                    <div style="text-align:center;">
                        <div style="font-size:1.1rem;">분석 결과 요약</div>
                        <div>
                            <span style="color:#28a745;font-weight:bold;" id="seoPassSummary">0</span> 통과 &nbsp;
                            <span style="color:#ffc107;font-weight:bold;" id="seoWarnSummary">0</span> 주의 &nbsp;
                            <span style="color:#dc3545;font-weight:bold;" id="seoFailSummary">0</span> 실패
                        </div>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4 text-center">
                        <canvas id="seoScoreChart" width="120" height="120"></canvas>
                        <div class="mt-2" id="seoScoreLabel"></div>
                    </div>
                    <div class="col-md-8">
                        <div class="progress mb-2" style="height: 25px;">
                            <div id="seoProgressBar" class="progress-bar" role="progressbar" style="width: 0%;">0%</div>
                        </div>
                        <div id="seoStats" class="mb-2"></div>
                    </div>
                </div>
                <div id="seoAdvice" class="alert alert-info" style="display:none;"></div>
                <ul class="list-group mb-3" id="seoChecklist" style="display:none;">
                    <!-- 체크리스트 항목 동적 생성 -->
                </ul>
            </div>
        </div>
        <div class="tab-pane fade" id="traffic" role="tabpanel" aria-labelledby="traffic-tab">
            <div class="chart-container mb-4">
                <h5 class="mb-3">최근 트래픽 추이 및 급증/급감 알림</h5>
                <canvas id="trafficChart" height="80"></canvas>
                <div id="trafficAlerts" class="mt-3"></div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 더미 데이터
    const labels = ["4/1", "4/2", "4/3", "4/4", "4/5", "4/6", "4/7", "4/8", "4/9", "4/10"];
    const myScores = [70, 72, 74, 75, 77, 78, 80, 81, 82, 82];
    const rivalScores = [68, 69, 71, 73, 74, 75, 76, 77, 78, 78];
    const myRanks = [25, 23, 22, 20, 18, 17, 16, 15, 15, 15];
    const rivalRanks = [30, 28, 27, 25, 24, 23, 23, 22, 22, 22];

    // 점수 추이 차트
    new Chart(document.getElementById('scoreChart').getContext('2d'), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'myblog',
                    data: myScores,
                    borderColor: '#007bff',
                    backgroundColor: 'rgba(0,123,255,0.1)',
                    fill: true,
                    tension: 0.3
                },
                {
                    label: 'rivalblog',
                    data: rivalScores,
                    borderColor: '#ff6666',
                    backgroundColor: 'rgba(255,102,102,0.1)',
                    fill: true,
                    tension: 0.3
                }
            ]
        },
        options: {
            responsive: true,
            plugins: { legend: { position: 'top' } },
            scales: { y: { beginAtZero: true } }
        }
    });

    // 순위 추이 차트
    new Chart(document.getElementById('rankChart').getContext('2d'), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'myblog',
                    data: myRanks,
                    borderColor: '#007bff',
                    backgroundColor: 'rgba(0,123,255,0.1)',
                    fill: true,
                    tension: 0.3
                },
                {
                    label: 'rivalblog',
                    data: rivalRanks,
                    borderColor: '#ff6666',
                    backgroundColor: 'rgba(255,102,102,0.1)',
                    fill: true,
                    tension: 0.3
                }
            ]
        },
        options: {
            responsive: true,
            plugins: { legend: { position: 'top' } },
            scales: { y: { reverse: true, beginAtZero: false } } // 순위는 낮을수록 상위
        }
    });

    // SEO 점검기 스크립트
    // 강제 seoItems 및 테스트용 렌더링 (무조건 텍스트 표시)
    window.seoItems = [
        { key: 'structure', label: 'HTML 문서 구조 검사', desc: 'HTML5 doctype, head/body 구조 등 확인' },
        { key: 'title', label: 'Title 태그 길이 검증 (30-60자)', desc: '검색엔진에 적합한 제목 길이' },
        { key: 'meta', label: 'Meta Description 길이 검증 (120-160자)', desc: '검색엔진에 적합한 설명 길이' },
        { key: 'h1', label: 'H1 태그 유일성 검사', desc: '페이지에 H1 태그가 1개만 존재' },
        { key: 'alt', label: '이미지 Alt 속성 검사', desc: '모든 이미지에 대체 텍스트 제공' },
        { key: 'og', label: 'Open Graph 태그 확인', desc: 'SNS 공유를 위한 OG 태그 존재' },
        { key: 'canonical', label: 'Canonical 태그 확인', desc: '중복 방지를 위한 canonical 태그' },
        { key: 'lang', label: '페이지 언어 설정 확인', desc: 'html lang 속성 지정' },
        { key: 'viewport', label: 'Viewport 메타 태그 확인', desc: '모바일 대응을 위한 viewport' },
        { key: 'ssl', label: 'SSL 인증서 확인', desc: 'HTTPS로 서비스되는지 확인' }
    ];

    function renderSeoChecklist(results) {
        const checklist = document.getElementById('seoChecklist');
        checklist.innerHTML = '';
        (window.seoItems || []).forEach(item => {
            const result = results && results[item.key] ? results[item.key] : {};
            const status = result.status || '진단불가';
            const advice = result.advice || '분석 결과 없음';
            const icon = status === 'pass' ? '✅' : status === 'fail' ? '❌' : status === 'warn' ? '⚠️' : '❓';
            let statusText = '';
            if(status === 'pass') statusText = '통과';
            else if(status === 'warn') statusText = '주의';
            else if(status === 'fail') statusText = '실패';
            else statusText = '진단불가';

            const label = item.label || '항목명 없음';
            const desc = item.desc || '';

            const li = document.createElement('li');
            li.className = 'list-group-item d-flex flex-column';
            li.innerHTML = `
                <div><b>[${statusText}] ${label}</b> ${icon}</div>
                <div><small>${desc}</small></div>
                <div><small class="text-muted">${advice}</small></div>
            `;
            checklist.appendChild(li);
        });
    }

    // 테스트용 더미 데이터로 강제 실행 (실제 분석 결과가 없을 때도 텍스트가 뜸)
    if (document.getElementById('seoChecklist') && (!window.lastSeoChecklistRendered || window.lastSeoChecklistRendered + 1000 < Date.now())) {
        renderSeoChecklist({});
        window.lastSeoChecklistRendered = Date.now();
    }

    function renderSeoScoreChart(score) {
        const ctx = document.getElementById('seoScoreChart').getContext('2d');
        if(window.seoScoreChartObj) window.seoScoreChartObj.destroy();
        window.seoScoreChartObj = new Chart(ctx, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [score, 100-score],
                    backgroundColor: [score >= 80 ? '#28a745' : score >= 60 ? '#ffc107' : '#dc3545', '#e9ecef'],
                    borderWidth: 0
                }],
                labels: ['점수', '']
            },
            options: {
                cutout: '80%',
                plugins: { legend: { display: false } },
                tooltips: { enabled: false }
            }
        });
        document.getElementById('seoScoreLabel').innerHTML = `<b style="font-size:2rem;">${score}</b> / 100`;
    }

    function renderSeoProgressBar(pass, warn, fail) {
        const total = pass + warn + fail;
        const percent = Math.round((pass/total)*100);
        const bar = document.getElementById('seoProgressBar');
        bar.style.width = percent + '%';
        bar.innerText = `${percent}%`;
        bar.className = 'progress-bar ' + (percent >= 80 ? 'bg-success' : percent >= 60 ? 'bg-warning' : 'bg-danger');
        document.getElementById('seoStats').innerHTML = `통과: <b>${pass}</b> | 주의: <b>${warn}</b> | 실패: <b>${fail}</b>`;
    }

    function renderSeoAdvice(score, results) {
        let advice = '';
        if(score >= 80) advice = 'SEO가 우수합니다!';
        else if(score >= 60) advice = 'SEO가 양호하나, 일부 개선이 필요합니다.';
        else advice = 'SEO 개선이 필요합니다. 아래 항목을 참고하세요.';
        // 항목별 개선점
        Object.entries(results).forEach(([key, val]) => {
            if(val.status === 'fail') advice += '<br>❌ <b>' + (window.seoItems || []).find(function(i){return i.key===key;}).label + '</b>: ' + val.advice;
        });
        const adviceDiv = document.getElementById('seoAdvice');
        adviceDiv.innerHTML = advice;
        adviceDiv.style.display = 'block';
    }

    function updateSeoSummary(score, pass, warn, fail) {
        document.getElementById('seoScoreSummary').textContent = score;
        document.getElementById('seoPassSummary').textContent = pass;
        document.getElementById('seoWarnSummary').textContent = warn;
        document.getElementById('seoFailSummary').textContent = fail;
    }

    $('#seoForm').on('submit', function(e) {
        e.preventDefault();
        const url = $('#seoUrl').val();
        $('#seoLoading').show();
        $('#seoResult').hide();
        $('#seoAdvice').hide();
        // 실제 분석은 ajax로 백엔드 호출
        $.ajax({
            url: '/seo/check',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ url }),
            success: function(resp) {
                $('#seoLoading').hide();
                $('#seoResult').show();
                renderSeoChecklist(resp.results);
                renderSeoScoreChart(resp.score);
                renderSeoProgressBar(resp.pass, resp.warn, resp.fail);
                renderSeoAdvice(resp.score, resp.results);
                updateSeoSummary(resp.score, resp.pass, resp.warn, resp.fail);
            },
            error: function() {
                $('#seoLoading').hide();
                alert('분석에 실패했습니다. 올바른 URL인지 확인하세요.');
            }
        });
    });
    $('#seoUrl').on('keydown', function(e) {
        if(e.key === 'Enter') $('#seoForm').submit();
    });

    // 트래픽 급증/급감 차트 및 알림
    function renderTrafficChart(data) {
        const ctx = document.getElementById('trafficChart').getContext('2d');
        if(window.trafficChartObj) window.trafficChartObj.destroy();
        // 점 색상 강조: 급증(빨강), 급감(파랑), 일반(회색)
        const pointColors = data.labels.map((date, idx) => {
            const alert = (data.alerts||[]).find(a => a.date === date);
            if(alert && alert.type === 'spike') return '#dc3545';
            if(alert && alert.type === 'drop') return '#007bff';
            return '#888';
        });
        window.trafficChartObj = new Chart(ctx, {
            type: 'line',
            data: {
                labels: data.labels,
                datasets: [{
                    label: '방문자수',
                    data: data.traffic,
                    borderColor: '#2362c7',
                    backgroundColor: 'rgba(35,98,199,0.1)',
                    fill: true,
                    tension: 0.3,
                    pointBackgroundColor: pointColors,
                    pointRadius: 6,
                    pointHoverRadius: 8
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { position: 'top' } },
                scales: { y: { beginAtZero: true } },
                tooltips: { enabled: true }
            }
        });
    }
    function renderTrafficAlerts(alerts) {
        const div = document.getElementById('trafficAlerts');
        if(!alerts || alerts.length === 0) {
            div.innerHTML = '<span class="text-muted">급증/급감 구간이 없습니다.</span>';
            return;
        }
        div.innerHTML = alerts.map(a => {
            const icon = a.type === 'spike' ? '🔺' : '🔻';
            const color = a.type === 'spike' ? 'text-danger' : 'text-primary';
            return `<div class="${color}">${icon} <b>${a.date}</b> : ` + (a.type === 'spike' ? '급증' : '급감') + ` (${a.change}%)</div>`;
        }).join('');
    }
    // 탭 클릭 시 데이터 로드
    $(document).on('shown.bs.tab', 'a[data-toggle="tab"]', function (e) {
        if(e.target.id === 'traffic-tab') {
            // 이미 로드했다면 재호출 방지
            if(window.trafficLoaded) return;
            window.trafficLoaded = true;
            $.ajax({
                url: '/traffic/alert',
                method: 'GET',
                success: function(resp) {
                    renderTrafficChart(resp);
                    renderTrafficAlerts(resp.alerts);
                },
                error: function() {
                    $('#trafficAlerts').html('<span class="text-danger">트래픽 데이터를 불러오지 못했습니다.</span>');
                }
            });
        }
    });
</script>
</body>
</html>