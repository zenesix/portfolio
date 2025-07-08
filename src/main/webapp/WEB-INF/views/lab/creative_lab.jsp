<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>AI Interactive Art & Music Canvas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');
        body { margin: 0; height: 100vh; background-color: #000; overflow: hidden; font-family: 'Poppins', sans-serif; cursor: crosshair; }
        #p5-canvas { position: fixed; top: 0; left: 0; z-index: 1; }
        .control-panel {
            position: fixed;
            top: 50%;
            left: 30px;
            transform: translateY(-50%);
            z-index: 10;
            background: rgba(10, 10, 10, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 25px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            color: #fff;
            transition: all 0.3s ease;
        }
        .control-panel:hover {
            transform: translateY(-50%) scale(1.02);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5);
        }
        .control-panel h1, .control-panel h2 { margin: 0; padding-bottom: 10px; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .control-panel h1 { font-size: 24px; margin-bottom: 20px; }
        .control-panel h2 { font-size: 16px; margin-top: 20px; }
        .mood-buttons button {
            display: block; width: 100%;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff; padding: 12px; margin-bottom: 10px;
            border-radius: 8px; cursor: pointer;
            font-size: 14px; text-align: left;
            transition: all 0.2s ease;
        }
        .mood-buttons button:hover, .mood-buttons button.active {
            background: #fff; color: #000;
            border-color: #fff;
            transform: translateX(5px);
        }
        .mood-buttons button i { margin-right: 12px; width: 20px; text-align: center; }
        .playback-controls button, .record-controls button {
            background: transparent; border: 1px solid #fff;
            color: #fff; border-radius: 8px;
            width: calc(50% - 5px); height: 40px;
            font-size: 14px; cursor: pointer;
            margin-top: 5px;
            transition: all 0.2s ease;
        }
        .playback-controls button:hover, .record-controls button:hover { background: #fff; color: #000; }
        .record-controls button#record-btn {
            border-color: #e84393; color: #e84393;
        }
        .record-controls button#record-btn.recording {
             background: #e84393; color: #fff; animation: pulse 1.5s infinite;
        }
        #download-link {
            display: none; background: #00b894; color: #fff; border: none;
            text-decoration: none; text-align: center; line-height: 40px;
        }
        .info-box {
            position: fixed; bottom: 20px; right: 20px;
            font-size: 12px; color: rgba(255,255,255,0.4); z-index: 5;
        }
        @keyframes pulse { 0% { box-shadow: 0 0 0 0 rgba(232, 67, 147, 0.7); } 70% { box-shadow: 0 0 0 10px rgba(232, 67, 147, 0); } 100% { box-shadow: 0 0 0 0 rgba(232, 67, 147, 0); } }

        /* AI Conductor Toggle Switch */
        .ai-conductor-toggle { display: flex; align-items: center; justify-content: space-between; margin-top: 15px; }
        .switch { position: relative; display: inline-block; width: 50px; height: 28px; }
        .switch input { opacity: 0; width: 0; height: 0; }
        .slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #333; transition: .4s; border-radius: 28px; }
        .slider:before { position: absolute; content: ""; height: 20px; width: 20px; left: 4px; bottom: 4px; background-color: white; transition: .4s; border-radius: 50%; }
        input:checked + .slider { background-color: #00b894; }
        input:checked + .slider:before { transform: translateX(22px); }
        
        #ai-orb {
            position: fixed;
            z-index: 11;
            width: 20px;
            height: 20px;
            background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(0,212,255,0.5) 50%, rgba(255,255,255,0) 70%);
            border-radius: 50%;
            pointer-events: none;
            display: none; /* Initially hidden */
        }
    </style>
</head>
<body>
    <div id="p5-canvas"></div>
    <div id="ai-orb"></div>
    <div class="control-panel">
        <h1><i class="fa-solid fa-wand-magic-sparkles"></i> AI Creator Studio</h1>
        
        <h2><i class="fa-solid fa-brain"></i> AI Conductor</h2>
        <div class="ai-conductor-toggle">
            <span>Activate AI</span>
            <label class="switch">
                <input type="checkbox" id="ai-mode-switch" onchange="toggleAiMode(this.checked)">
                <span class="slider"></span>
            </label>
        </div>

        <h2><i class="fa-solid fa-music"></i> Select Music Mood</h2>
        <div class="mood-buttons">
            <button id="mood-calm" onclick="setMood('calm', this)"><i class="fa-solid fa-leaf"></i> Calm & Serene</button>
            <button id="mood-upbeat" onclick="setMood('upbeat', this)"><i class="fa-solid fa-sun"></i> Upbeat & Joyful</button>
            <button id="mood-intense" onclick="setMood('intense', this)"><i class="fa-solid fa-bolt"></i> Intense & Epic</button>
            <button id="mood-ethereal" onclick="setMood('ethereal', this)"><i class="fa-solid fa-star"></i> Ethereal & Dreamy</button>
        </div>
        <h2><i class="fa-solid fa-sliders"></i> Performance</h2>
        <div class="playback-controls">
            <button id="play-btn" onclick="playMusic()"><i class="fa-solid fa-play"></i> Play</button>
            <button id="stop-btn" onclick="stopMusic()"><i class="fa-solid fa-stop"></i> Stop</button>
        </div>
        <h2><i class="fa-solid fa-video"></i> Create Video</h2>
        <div class="record-controls">
            <button id="record-btn" onclick="toggleRecording()">● Record</button>
            <a id="download-link" download="my-art-video.webm">Download Video</a>
        </div>
    </div>
    <div class="info-box">Move mouse to perform or activate AI Conductor.</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.1/p5.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tone/14.7.77/Tone.js"></script>

    <script>
        let particles = [], currentMood = 'calm', p5Canvas;
        let isAiMode = false;
        let aiOrb, t = { x: 0, y: 10000 }, lastNote = 'C4';
        // AI 모드에서 무드 자동 전환 중복 방지용 타임스탬프
        let lastMoodChangeSec = -100;

        function setup() {
            p5Canvas = createCanvas(windowWidth, windowHeight);
            p5Canvas.parent('p5-canvas');
            background(0);
            aiOrb = document.getElementById('ai-orb');
        }

        function draw() {
            background(0, 0, 0, 25);
            let performanceX = isAiMode ? (noise(t.x) * width) : (isFinite(mouseX) ? mouseX : width/2);
            let performanceY = isAiMode ? (noise(t.y) * height) : (isFinite(mouseY) ? mouseY : height/2);
            if(isAiMode) {
                t.x += 0.002;
                t.y += 0.002;
                aiOrb.style.left = performanceX - 10 + 'px';
                aiOrb.style.top = performanceY - 10 + 'px';
            }
            for (let i = 0; i < 5; i++) particles.push(new Particle(performanceX, performanceY));
            for (let i = particles.length - 1; i >= 0; i--) { particles[i].update(); particles[i].show(); if (particles[i].finished()) particles.splice(i, 1); }
            if (isInitialized && Tone.Transport.state === 'started') {
                const filterFreq = map(performanceY, height, 0, 200, 10000, true);
                if(filter) filter.frequency.rampTo(filterFreq, 0.1);
                // AI Conductor auto-mood progression (20초마다 단 번만)
                if(isAiMode && Tone.Transport.seconds > 0) {
                    let nowSec = Math.floor(Tone.Transport.seconds);
                    if (nowSec % 20 === 0 && nowSec !== lastMoodChangeSec) {
                        let moods = ['calm', 'upbeat', 'intense', 'ethereal'];
                        let nextMoodIndex = (moods.indexOf(currentMood) + 1) % moods.length;
                        setMood(moods[nextMoodIndex], document.getElementById(`mood-${moods[nextMoodIndex]}`));
                        lastMoodChangeSec = nowSec;
                    }
                }
            }
        }
        class Particle {
            constructor(x, y) {
                this.x = x; this.y = y; this.lifespan = 255;
                this.mood = currentMood;
                if (this.mood === 'calm') { this.vx = random(-1, 1); this.vy = random(-1, 1); this.hue = random(180, 240); this.size = random(10, 20); }
                else if (this.mood === 'upbeat') { this.vx = random(-4, 4); this.vy = random(-4, 4); this.hue = random(30, 90); this.size = random(5, 10); }
                else if (this.mood === 'intense') { this.vx = random(-8, 8); this.vy = random(-8, 8); this.hue = random(300, 360); this.size = random(5, 15); }
                else if (this.mood === 'ethereal') { this.vx = random(-0.5, 0.5); this.vy = random(-0.5, 0.5); this.hue = random(240, 300); this.size = random(20, 30); }
            }
            finished() { return this.lifespan < 0; }
            update() { this.x += this.vx; this.y += this.vy; this.lifespan -= 4; }
            show() {
                noStroke(); colorMode(HSB);
                let level = fft && Tone.Transport.state === 'started' ? fft.getValue()[0] : -100;
                let sizeMultiplier = map(level, -60, 0, 1, 4, true);
                fill(this.hue, 90, 90, this.lifespan / 255);
                if (this.mood === 'calm' || this.mood === 'ethereal') ellipse(this.x, this.y, this.size * sizeMultiplier);
                else if (this.mood === 'upbeat') rect(this.x, this.y, this.size * sizeMultiplier, this.size * sizeMultiplier);
                else if (this.mood === 'intense') { let s = this.size * sizeMultiplier; triangle(this.x, this.y - s, this.x - s, this.y + s, this.x + s, this.y + s); }
            }
        }
        function windowResized() { resizeCanvas(windowWidth, windowHeight); }

        // --- Music & Recording ---
        let synths = {}, mainLoop, drumLoop, filter, fft, mediaRecorder, recordedChunks = [], isInitialized = false, recDest;

        function initializeMusic() {
            if (isInitialized) return;
            
            // --- Corrected Audio Routing ---
            // 1. Create a master filter that all sounds will pass through.
            filter = new Tone.Filter(800, "lowpass").toDestination();
            
            // 2. Create a destination for recording.
            recDest = Tone.context.createMediaStreamDestination();
            
            // 3. Connect the master filter to BOTH speakers (toDestination) and the recording stream.
            filter.connect(recDest);
            
            // 4. Also connect an FFT analyzer to the filter to power the visuals.
            fft = new Tone.FFT(32);
            filter.connect(fft);

            // --- Synths ---
            // Now, connect all synths to the single master filter.
            synths.calm = new Tone.FMSynth({ volume: -8, harmonicity: 0.5, modulationIndex: 5, envelope: { attack: 0.1, release: 2 } }).connect(filter);
            synths.upbeat = new Tone.FMSynth({ volume: -8, harmonicity: 2 }).connect(filter);
            synths.intense = new Tone.MetalSynth({ volume: -10, harmonicity: 5, resonance: 800 }).connect(filter);
            synths.ethereal = new Tone.PolySynth(Tone.Synth, { oscillator: { type: 'sine' }, volume: -10, envelope: {attack: 0.2, release: 2}}).connect(filter);
            
            // --- Loops ---
            drumLoop = new Tone.Loop(time => {
                // Ensure the drum also goes through the filter to be heard and recorded.
                new Tone.MembraneSynth({volume: -10}).connect(filter).triggerAttackRelease('C1', '8n', time);
            }, '4n');

            // --- AI Music Logic (Markov Chain) ---
            const markovChains = {
                calm: { 'C4': ['G4', 'E4'], 'E4': ['C4', 'G4'], 'G4': ['C4', 'B4'], 'B4': ['G4', 'D5'], 'D5': ['B4'] },
                upbeat: { 'C5': ['E5', 'G5'], 'D5': ['A5', 'C5'], 'E5': ['G5', 'A5'], 'G5': ['C5', 'D5'], 'A5': ['E5'] },
                intense: { 'C3': ['G3', 'C4'], 'G3': ['C4', 'D#4'], 'C4': ['D#4', 'C3'], 'D#4': ['C3', 'G3'] },
                ethereal: { 'C4': ['Eb4', 'G4'], 'Eb4': ['G4', 'Bb4'], 'G4': ['Bb4', 'Db5'], 'Bb4': ['Db5', 'C4'], 'Db5': ['C4'] }
            };

            mainLoop = new Tone.Loop(time => {
                try {
                    let note;
                    let performanceX = isAiMode ? (noise(t.x) * width) : mouseX;
                    let performanceY = isAiMode ? (noise(t.y) * height) : mouseY;
                    performanceX = Math.max(0, Math.min(width, isFinite(performanceX) ? performanceX : width/2));
                    performanceY = Math.max(0, Math.min(height, isFinite(performanceY) ? performanceY : height/2));

                    if (isAiMode) {
                        // Use correct Markov chain for current mood
                        let chain = markovChains[currentMood] || markovChains.calm;
                        let safeLastNote = lastNote;
                        if (!chain[safeLastNote]) safeLastNote = Object.keys(chain)[0];
                        let possibleNextNotes = chain[safeLastNote] || Object.keys(chain);
                        if (!possibleNextNotes || possibleNextNotes.length === 0) possibleNextNotes = Object.keys(chain);
                        note = possibleNextNotes[Math.floor(Math.random() * possibleNextNotes.length)];
                        lastNote = note;
                    } else {
                        const scales = {
                            calm: ['C4', 'E4', 'G4', 'B4', 'D5'],
                            upbeat: ['C5', 'D5', 'E5', 'G5', 'A5'],
                            intense: ['C3', 'G3', 'C4', 'D#4'],
                            ethereal: ['C4', 'Eb4', 'G4', 'Bb4', 'Db5']
                        };
                        const scale = scales[currentMood];
                        let baseNote = scale[Math.floor(Math.random() * scale.length)];
                        let pitchShift = map(performanceX, 0, width, -12, 12, true);
                        if (!isFinite(pitchShift)) pitchShift = 0;
                        if (!baseNote) baseNote = 'C4';
                        note = Tone.Frequency(baseNote).transpose(pitchShift);
                    }
                    switch (currentMood) {
                        case 'calm': if (Math.random() < 0.15) synths.calm.triggerAttackRelease(note, '2n', time); break;
                        case 'upbeat': synths.upbeat.triggerAttackRelease(note, '16n', time); break;
                        case 'intense': if (Tone.Transport.ticks % Tone.Transport.PPQ === 0) synths.intense.triggerAttackRelease(note, '8n', time); break;
                        case 'ethereal': if (Math.random() < 0.1) synths.ethereal.triggerAttackRelease(note, '2n', time); break;
                    }
                } catch (e) {
                    // Prevent any error from freezing the app
                    console.error('Music loop error:', e);
                }
            }, '16n');

            isInitialized = true;
        }

        function playMusic() { Tone.start(); if (!isInitialized) initializeMusic(); if (Tone.Transport.state !== 'started') { Tone.Transport.start(); mainLoop.start(0); } }
        function stopMusic() { if (Tone.Transport.state === 'started') { Tone.Transport.stop(); mainLoop.stop(); drumLoop.stop(); } }
        
        function setMood(mood, element) {
            currentMood = mood;
            document.querySelectorAll('.mood-buttons button').forEach(b => b.classList.remove('active'));
            if (element && element.classList) {
                element.classList.add('active');
            }
            background(0); particles = [];
            if (!isInitialized) return;
            if (drumLoop && drumLoop.state === 'started' && mood !== 'intense') drumLoop.stop();
            else if (drumLoop && drumLoop.state !== 'started' && mood === 'intense' && Tone.Transport.state === 'started') drumLoop.start(0);
            switch (mood) {
                case 'calm': Tone.Transport.bpm.rampTo(70, 1); break;
                case 'upbeat': Tone.Transport.bpm.rampTo(140, 1); break;
                case 'intense': Tone.Transport.bpm.rampTo(160, 1); break;
                case 'ethereal': Tone.Transport.bpm.rampTo(60, 1); break;
            }
        }
        
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('mood-calm').classList.add('active');
        });

        function toggleRecording() {
            if (!isInitialized) initializeMusic();
            const recordBtn = document.getElementById('record-btn');
            if (mediaRecorder && mediaRecorder.state === "recording") {
                mediaRecorder.stop();
                recordBtn.classList.remove('recording');
                recordBtn.innerHTML = "● Record";
            } else {
                const videoStream = p5Canvas.elt.captureStream(30);
                const combinedStream = new MediaStream([...videoStream.getVideoTracks(), ...recDest.stream.getAudioTracks()]);
                mediaRecorder = new MediaRecorder(combinedStream, { mimeType: 'video/webm; codecs=vp9,opus' });
                recordedChunks = [];
                mediaRecorder.ondataavailable = event => { if (event.data.size > 0) recordedChunks.push(event.data); };
                mediaRecorder.onstop = () => {
                    const blob = new Blob(recordedChunks, { type: 'video/webm' });
                    const url = URL.createObjectURL(blob);
                    const downloadLink = document.getElementById('download-link');
                    downloadLink.href = url;
                    downloadLink.style.display = 'block';
                };
                mediaRecorder.start();
                recordBtn.classList.add('recording');
                recordBtn.innerHTML = "■ Stop Rec";
                document.getElementById('download-link').style.display = 'none';
            }
        }

        function toggleAiMode(checked) {
            isAiMode = checked;
            aiOrb.style.display = isAiMode ? 'block' : 'none';
            document.body.style.cursor = isAiMode ? 'none' : 'crosshair';
            // 안전하게 상태 초기화
            if (!isAiMode) {
                // AI용 좌표 변수 리셋
                t.x = 0; t.y = 10000;
                // lastNote를 현재 무드의 기본값으로 재설정
                const moodDefaults = { calm: 'C4', upbeat: 'C5', intense: 'C3', ethereal: 'C4' };
                lastNote = moodDefaults[currentMood] || 'C4';
            }
        }
    </script>
</body>
</html> 