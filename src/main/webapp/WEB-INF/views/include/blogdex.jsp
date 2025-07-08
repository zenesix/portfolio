<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>블로그 점수/순위 비교 (Blogdex)</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .profile-box { display: flex; align-items: center; margin-bottom: 1rem; }
        .profile-img { width: 60px; height: 60px; border-radius: 50%; margin-right: 1rem; }
        .score-box { font-size: 1.2rem; margin-right: 2rem; }
        .blog-title { font-weight: bold; font-size: 1.3rem; }
        .chart-container { background: #fff; border-radius: 10px; box-shadow: 0 2px 8px #eee; padding: 2rem; margin-bottom: 2rem; }
    </style>
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="row mb-4">
        <div class="col-md-6">
            <div class="profile-box">
                <img src="https://via.placeholder.com/60" class="profile-img" alt="내 블로그">
                <div>
                    <div class="blog-title">myblog</div>
                    <div class="score-box">점수: <span class="text-primary font-weight-bold">82</span> | 순위: <span class="text-success font-weight-bold">15위</span></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="profile-box">
                <img src="https://via.placeholder.com/60/ff6666/ffffff?text=R" class="profile-img" alt="경쟁 블로그">
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
</script>
</body>
</html> 