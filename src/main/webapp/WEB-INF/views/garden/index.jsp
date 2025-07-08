<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Starlight Garden</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap');

        :root {
            --bg-color: #020418;
            --panel-bg-color: rgba(10, 25, 47, 0.85);
            --border-color: rgba(135, 206, 250, 0.2);
            --text-color: #e0e0e0;
            --text-secondary-color: #88a1b9;
            --accent-color: #90b8f8;
            --accent-hover-color: #a9c7fa;
        }

        body, html {
            margin: 0; padding: 0; width: 100%; height: 100%;
            overflow: hidden;
            font-family: 'Noto Sans KR', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            display: flex;
        }

        #canvas-container {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        #mainCanvas { display: block; width: 100%; height: 100%; }
        
        .control-panel {
            position: relative;
            z-index: 2;
            width: 340px;
            height: 100%;
            background: rgba(30,40,80,0.35);
            backdrop-filter: blur(18px);
            border-radius: 18px;
            box-shadow: 0 8px 32px 0 rgba(31,38,135,0.37);
            border: 1.5px solid rgba(255,255,255,0.18);
            padding: 32px 32px 32px 32px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 25px;
            overflow: hidden;
        }
        .panel-neon-bar {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 7px;
            border-radius: 18px 18px 0 0;
            background: linear-gradient(270deg, #a9c7fa, #d5aaff, #90b8f8, #ffb6ff, #a9c7fa);
            background-size: 400% 400%;
            animation: auroraBar 8s linear infinite;
            z-index: 3;
            pointer-events: none;
        }
        @keyframes auroraBar {
            0% {background-position:0% 50%}
            100% {background-position:100% 50%}
        }
        .panel-stars-canvas {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            z-index: 1;
            pointer-events: none;
        }
        .panel-content { position: relative; z-index: 2; }
        .panel-header h1 {
            font-size: 26px;
            font-weight: 500;
            margin: 0;
            background: linear-gradient(45deg, #a9c7fa, #d5aaff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .panel-header p {
            font-size: 14px;
            color: var(--text-secondary-color);
            margin: 8px 0 10px 0;
            line-height: 1.5;
        }

        .panel-section h2 {
            font-size: 16px;
            font-weight: 400;
            color: var(--text-secondary-color);
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 8px;
            margin: 0 0 16px 0;
        }

        .control-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 28px;
        }

        .switch input {
            display: none;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #2a2a2a;
            transition: .4s;
            border-radius: 28px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 20px;
            width: 20px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background: linear-gradient(90deg, var(--accent-color), #d5aaff);
        }

        input:checked + .slider:before {
            transform: translateX(22px);
        }

        .mood-selector button {
            width: 100%; padding: 12px; margin-bottom: 10px;
            background-color: transparent; border: 1px solid var(--border-color);
            color: var(--text-color); border-radius: 8px;
            text-align: left; cursor: pointer; font-size: 14px;
            transition: box-shadow 0.3s, text-shadow 0.3s;
        }
        
        .mood-selector button:hover {
            box-shadow: 0 0 8px 2px #a9c7fa;
            text-shadow: 0 0 6px #a9c7fa;
        }

        .mood-selector button.active {
            box-shadow: 0 0 12px 2px #a9c7fa, 0 0 24px 4px #d5aaff;
            text-shadow: 0 0 8px #a9c7fa, 0 0 16px #d5aaff;
        }

        .performance-controls {
            display: flex;
            gap: 10px;
        }

        .performance-controls button {
            flex-grow: 1; padding: 12px; border-radius: 8px; cursor: pointer;
            transition: background-color 0.3s;
            background-color: rgba(135, 206, 250, 0.1);
            border: 1px solid var(--border-color);
            color: var(--text-color); font-size: 14px;
        }

        .performance-controls button:hover {
            background-color: rgba(135, 206, 250, 0.2);
        }

        .info-text {
            position: absolute;
            bottom: 16px;
            right: 16px;
            color: var(--text-secondary-color);
            font-size: 12px;
            z-index: 3;
            text-align: right;
        }
    </style>
</head>
<body>
    <div id="canvas-container">
        <canvas id="mainCanvas"></canvas>
    </div>
    
    <div class="info-text">Click to create a gravity wave.<br>Activate comets and move mouse to conduct your starlight.</div>
    
    <div class="control-panel">
        <div class="panel-neon-bar"></div>
        <canvas id="panelStars" class="panel-stars-canvas"></canvas>
        <div class="panel-content">
            <div class="panel-header">
                <h1>🌌 별빛 정원</h1>
                <p>마우스와 클릭으로 당신만의 우주를 연주하세요.</p>
            </div>
            <div class="panel-section">
                <h2>별빛 뿌리기</h2>
                <div class="control-item">
                    <span>혜성 활성화</span>
                    <label class="switch"><input type="checkbox" id="cometToggle"><span class="slider"></span></label>
                </div>
            </div>
            <div class="panel-section">
                <h2>Cosmic Harmonies</h2>
                <div class="mood-selector" id="moodSelector">
                    <button data-mood="calm" class="active">🌠 고요한 성운</button>
                    <button data-mood="upbeat">🌟 떠오르는 샛별</button>
                    <button data-mood="intense">💥 초신성</button>
                    <button data-mood="ethereal">✨ 꿈꾸는 은하수</button>
                </div>
            </div>
            <div class="panel-section">
                <h2>Performance</h2>
                <div class="performance-controls">
                    <button id="playBtn">▶ Play</button>
                    <button id="stopBtn">■ Stop</button>
                </div>
            </div>
            <div class="panel-section" style="padding-top:10px; border:none;">
                <input type="range" id="musicSlider" min="0" max="100" value="0" step="1" style="width:100%;">
            </div>
        </div>
    </div>

    <iframe id="soundcloud-player" style="display:none;" width="100%" height="120" scrolling="no" frameborder="no" allow="autoplay"
        src="https://w.soundcloud.com/player/?url=https%3A//soundcloud.com/kayd_wav/melody-mp3-mp3&auto_play=false&hide_related=true&show_comments=false&show_user=false&show_reposts=false&visual=false">
    </iframe>

    <script src="https://w.soundcloud.com/player/api.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const canvas = document.getElementById('mainCanvas');
        const ctx = canvas.getContext('2d');
        let width = canvas.width = window.innerWidth;
        let height = canvas.height = window.innerHeight;

        const cometToggle = document.getElementById('cometToggle');
        const playBtn = document.getElementById('playBtn');
        const stopBtn = document.getElementById('stopBtn');
        const moodSelector = document.getElementById('moodSelector');

        // --- SoundCloud Player Setup ---
        const iframeElement = document.getElementById('soundcloud-player');
        const scPlayer = SC.Widget(iframeElement);
        let musicPlaying = false;
        scPlayer.bind(SC.Widget.Events.PLAY, () => { musicPlaying = true; });
        scPlayer.bind(SC.Widget.Events.PAUSE, () => { musicPlaying = false; });
        scPlayer.bind(SC.Widget.Events.FINISH, () => { musicPlaying = false; });

        let isCometActive = false;
        let stars = [];
        let comets = [];
        let ripples = [];
        let mouse = { x: width / 2, y: height / 2 };

        const visualMoods = {
            calm: { color: "50, 150, 255" },
            upbeat: { color: "255, 220, 100" },
            intense: { color: "255, 50, 50" },
            ethereal: { color: "200, 160, 255" }
        };
        let currentMood = "calm";

        function createStars() {
            for (let i = 0; i < 200; i++) {
                stars.push({
                    x: Math.random() * width,
                    y: Math.random() * height,
                    size: Math.random() * 1.5 + 0.5,
                    opacity: Math.random() * 0.5 + 0.2
                });
            }
        }

        class Comet {
            constructor(x, y, color, behavior) {
                this.x = x;
                this.y = y;
                this.size = Math.random() * 2.5 + 1;
                this.life = 1;
                this.history = [];
                this.color = color;
                this.behavior = behavior;
                this.vx = 0;
                this.vy = 0;
                this.angle = Math.random() * Math.PI * 2;
                this.speed = Math.random() * 2 + 1;
                this.decay = Math.random() * 0.0005 + 0.0008;

                if(this.behavior === 'intense'){
                    this.vx = (Math.random() - 0.5) * 12;
                    this.vy = (Math.random() - 0.5) * 12;
                    this.decay *= 2;
                }
                if(this.behavior === 'meteor'){
                    this.vx = (Math.random() - 0.5) * 6;
                    this.vy = Math.random() * 4 + 4;
                }
            }
            update(ripples) {
                this.behaviorUpdate();
                ripples.forEach(ripple => {
                    const dx = this.x - ripple.x;
                    const dy = this.y - ripple.y;
                    const dist = Math.sqrt(dx * dx + dy * dy);
                    if (dist < ripple.radius + this.size) {
                        const angle = Math.atan2(dy, dx);
                        this.vx += Math.cos(angle) * (1 - dist/ripple.radius) * 2;
                        this.vy += Math.sin(angle) * (1 - dist/ripple.radius) * 2;
                    }
                });

                this.history.push({ x: this.x, y: this.y });
                if (this.history.length > 15) this.history.shift();
                
                this.x += this.vx; this.y += this.vy;
                this.life -= this.decay;
            }
            behaviorUpdate(){
                if(this.behavior === 'calm'){
                    this.vx *= 0.98; this.vy *= 0.98;
                } else if(this.behavior === 'upbeat'){
                    this.vx = (mouse.x - this.x) * 0.005; this.vy = (mouse.y - this.y) * 0.005;
                } else if(this.behavior === 'intense'){
                     this.vx *= 0.99; this.vy *= 0.99;
                } else if(this.behavior === 'ethereal'){
                    const dx = this.x - mouse.x;
                    const dy = this.y - mouse.y;
                    const dist = Math.sqrt(dx * dx + dy * dy);
                    const angle = Math.atan2(dy, dx);
                    this.vx += Math.cos(angle + Math.PI/2) * 0.2;
                    this.vy += Math.sin(angle + Math.PI/2) * 0.2;
                    this.vx *= 0.96; this.vy *= 0.96;
                } else if(this.behavior === 'meteor'){
                    this.vy += 0.05;
                }
            }
            draw() {
                if (this.history.length < 2) return;
                    ctx.beginPath();
                ctx.moveTo(this.history[0].x, this.history[0].y);
                for (let i = 1; i < this.history.length; i++) {
                    ctx.lineTo(this.history[i].x, this.history[i].y);
                }
                ctx.strokeStyle = `rgba(${this.color}, ${this.life * 0.5})`;
                ctx.lineWidth = this.size;
                ctx.stroke();

                ctx.beginPath();
                ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                ctx.fillStyle = `rgba(${this.color}, ${this.life})`;
                ctx.shadowColor = `rgb(${this.color})`;
                ctx.shadowBlur = 10;
                ctx.fill();
                ctx.shadowBlur = 0;
            }
        }
        
        canvas.addEventListener('click', e => ripples.push(new Ripple(e.clientX, e.clientY)));
        class Ripple {
            constructor(x, y) { this.x = x; this.y = y; this.radius = 0; this.maxRadius = 150; this.life = 1; }
            update() { this.radius += 3; this.life -= 0.02; }
            draw() {
                ctx.beginPath();
                ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
                ctx.strokeStyle = `rgba(135, 206, 250, ${this.life})`;
                ctx.lineWidth = 1;
                ctx.stroke();
             }
        }

        // --- Controls ---
        cometToggle.addEventListener('change', () => { isCometActive = cometToggle.checked; });
        canvas.addEventListener('mousemove', e => { mouse.x = e.clientX; mouse.y = e.clientY; });
        playBtn.addEventListener('click', () => { scPlayer.play(); });
        stopBtn.addEventListener('click', () => { scPlayer.pause(); });
        moodSelector.addEventListener('click', e => { if ("BUTTON" === e.target.tagName) { document.querySelector('.mood-selector button.active').classList.remove('active'); e.target.classList.add('active'); currentMood = e.target.dataset.mood; comets = []; } });

        function animate() {
            ctx.clearRect(0, 0, width, height);
            stars.forEach(s => { ctx.fillStyle = `rgba(227, 237, 247, ${s.opacity})`; ctx.beginPath(); ctx.arc(s.x, s.y, s.size, 0, Math.PI * 2); ctx.fill(); });
            
            if (musicPlaying && Math.random() > 0.985 && comets.length < 60) {
                const mood = visualMoods[currentMood];
                comets.push(new Comet(Math.random() * width, 0, mood.color, 'meteor'));
            }

            if (isCometActive && comets.length < 40) {
                 const mood = visualMoods[currentMood];
                 comets.push(new Comet(mouse.x, mouse.y, mood.color, currentMood));
            }

            for (let i = comets.length - 1; i >= 0; i--) {
                const comet = comets[i];
                comet.update(ripples);
                comet.draw();
                if (comet.life <= 0) comets.splice(i, 1);
            }
            
            for (let i = ripples.length - 1; i >= 0; i--) {
                ripples[i].update();
                ripples[i].draw();
                if (ripples[i].life <= 0) ripples.splice(i, 1);
            }
            requestAnimationFrame(animate);
        }
        createStars();
        animate();
        window.addEventListener('resize', () => { width = canvas.width = window.innerWidth; height = canvas.height = window.innerHeight; stars = []; createStars(); });

        // --- Super Meteor Shower (every 12 seconds) ---
        function spawnSuperMeteors() {
            const count = Math.floor(Math.random() * 4) + 5; // 5~8 meteors
            const mood = visualMoods[currentMood];
            for (let i = 0; i < count; i++) {
                const x = Math.random() * width;
                // Super meteor: bigger, brighter, faster, longer tail
                const comet = new Comet(x, 0, mood.color, 'meteor');
                comet.size = Math.random() * 4 + 4;
                comet.vy = Math.random() * 6 + 8;
                comet.vx = (Math.random() - 0.5) * 8;
                comet.decay = Math.random() * 0.0003 + 0.0005; // even longer life
                comet.history = [];
                comets.push(comet);
            }
        }
        setInterval(spawnSuperMeteors, 12000);

        // --- Music Slider Logic ---
        const musicSlider = document.getElementById('musicSlider');
        let isSeeking = false;
        // Update slider as music plays (every 1s)
        setInterval(() => {
            if (!isSeeking) {
                scPlayer.getDuration(duration => {
                    scPlayer.getPosition(pos => {
                        if (duration > 0) {
                            musicSlider.value = Math.floor((pos / duration) * 100);
                        }
                    });
                });
            }
        }, 1000);
        musicSlider.addEventListener('input', e => {
            isSeeking = true;
            scPlayer.getDuration(duration => {
                const seekTo = (e.target.value / 100) * duration;
                scPlayer.seekTo(seekTo);
            });
            setTimeout(() => { isSeeking = false; }, 500);
        });

        // --- Panel Starlight Animation (optimized, denser, twinkling, shooting stars) ---
        const panelStarsCanvas = document.getElementById('panelStars');
        const panelCtx = panelStarsCanvas.getContext('2d');
        let panelStars = [], panelShooting = [];
        function resizePanelStars() {
            panelStarsCanvas.width = panelStarsCanvas.offsetWidth;
            panelStarsCanvas.height = panelStarsCanvas.offsetHeight;
            panelStars = [];
            for(let i=0;i<100;i++){
                panelStars.push({
                    x: Math.random()*panelStarsCanvas.width,
                    y: Math.random()*panelStarsCanvas.height,
                    r: Math.random()*1.3+0.5,
                    o: Math.random()*0.5+0.5,
                    s: Math.random()*0.3+0.1,
                    vy: Math.random()*0.12+0.04,
                    tw: Math.random()*Math.PI*2,
                    tws: Math.random()*0.03+0.01
                });
            }
            panelShooting = [];
        }
        function animatePanelStars(){
            panelCtx.clearRect(0,0,panelStarsCanvas.width,panelStarsCanvas.height);
            // Twinkling stars
            for(const star of panelStars){
                star.tw += star.tws;
                let twinkle = 0.7 + 0.3*Math.sin(star.tw);
                panelCtx.save();
                panelCtx.globalAlpha = star.o * twinkle;
                panelCtx.beginPath();
                panelCtx.arc(star.x,star.y,star.r,0,2*Math.PI);
                panelCtx.fillStyle = '#e0eaff';
                panelCtx.shadowColor = '#a9c7fa';
                panelCtx.shadowBlur = 10;
                panelCtx.fill();
                panelCtx.restore();
                star.y += star.vy;
                if(star.y > panelStarsCanvas.height){ star.y = 0; star.x = Math.random()*panelStarsCanvas.width; }
            }
            // Shooting star (rare)
            if(Math.random() < 0.008){
                panelShooting.push({
                    x: Math.random()*panelStarsCanvas.width,
                    y: 0,
                    vx: Math.random()*1.5+1,
                    vy: Math.random()*2+2,
                    life: 1
                });
            }
            for(let i=panelShooting.length-1;i>=0;i--){
                let s = panelShooting[i];
                panelCtx.save();
                panelCtx.globalAlpha = s.life;
                panelCtx.beginPath();
                panelCtx.moveTo(s.x, s.y);
                panelCtx.lineTo(s.x-s.vx*10, s.y-s.vy*10);
                panelCtx.strokeStyle = '#fffbe9';
                panelCtx.lineWidth = 2;
                panelCtx.shadowColor = '#fffbe9';
                panelCtx.shadowBlur = 12;
                panelCtx.stroke();
                panelCtx.restore();
                s.x += s.vx; s.y += s.vy; s.life -= 0.02;
                if(s.life <= 0 || s.x > panelStarsCanvas.width || s.y > panelStarsCanvas.height) panelShooting.splice(i,1);
            }
            requestAnimationFrame(animatePanelStars);
        }
        resizePanelStars();
        animatePanelStars();
        window.addEventListener('resize', resizePanelStars);
    });
    </script>
</body>
</html> 
