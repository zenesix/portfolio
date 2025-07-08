<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>AI 아바타 메타버스</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #232526 0%, #414345 100%);
            min-height: 100vh;
            color: #f3f3f3;
        }
        .chat-container {
            max-width: 600px;
            margin: 40px auto;
            background: rgba(30, 34, 40, 0.95);
            border-radius: 18px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            padding: 0;
            overflow: hidden;
        }
        .chat-header {
            background: linear-gradient(90deg, #4e54c8 0%, #8f94fb 100%);
            padding: 1.2rem 2rem;
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff;
            letter-spacing: 1px;
        }
        .chat-body {
            height: 480px;
            overflow-y: auto;
            padding: 2rem 1.5rem 1rem 1.5rem;
            background: transparent;
        }
        .chat-message {
            display: flex;
            align-items: flex-end;
            margin-bottom: 1.2rem;
        }
        .chat-message.user {
            flex-direction: row-reverse;
        }
        .avatar {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: #8f94fb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            font-weight: bold;
            color: #fff;
            margin: 0 0.7rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }
        .bubble {
            max-width: 70%;
            padding: 1rem 1.2rem;
            border-radius: 18px;
            font-size: 1.08rem;
            line-height: 1.6;
            background: #353b48;
            color: #f3f3f3;
            position: relative;
            word-break: break-word;
        }
        .chat-message.user .bubble {
            background: linear-gradient(90deg, #4e54c8 0%, #8f94fb 100%);
            color: #fff;
        }
        .chat-footer {
            padding: 1.2rem 2rem;
            background: #232526;
            display: flex;
            gap: 1rem;
        }
        .chat-input {
            flex: 1;
            border-radius: 20px;
            border: none;
            padding: 0.8rem 1.2rem;
            font-size: 1.1rem;
            background: #2d2f36;
            color: #fff;
        }
        .chat-input:focus {
            outline: none;
            background: #232526;
        }
        .send-btn {
            background: linear-gradient(90deg, #4e54c8 0%, #8f94fb 100%);
            border: none;
            color: #fff;
            font-weight: bold;
            border-radius: 20px;
            padding: 0.8rem 2rem;
            font-size: 1.1rem;
            transition: background 0.2s;
        }
        .send-btn:active, .send-btn:focus {
            background: #4e54c8;
        }
        .loading-dot {
            display: inline-block;
            width: 8px;
            height: 8px;
            margin: 0 2px;
            background: #8f94fb;
            border-radius: 50%;
            animation: blink 1.4s infinite both;
        }
        .loading-dot:nth-child(2) { animation-delay: 0.2s; }
        .loading-dot:nth-child(3) { animation-delay: 0.4s; }
        @keyframes blink {
            0%, 80%, 100% { opacity: 0.2; }
            40% { opacity: 1; }
        }
    </style>
</head>
<body>
<div class="chat-container">
    <div class="chat-header">
        <span>🤖 AI 아바타 메타버스</span>
    </div>
    <div class="chat-body" id="chatBody">
        <!-- 채팅 메시지 동적 추가 -->
    </div>
    <div class="chat-footer">
        <input type="text" class="chat-input" id="chatInput" placeholder="메시지를 입력하세요..." autocomplete="off" />
        <button class="send-btn" id="sendBtn">전송</button>
    </div>
</div>
<script>
    const chatBody = document.getElementById('chatBody');
    const chatInput = document.getElementById('chatInput');
    const sendBtn = document.getElementById('sendBtn');

    function appendMessage(text, sender) {
        const msgDiv = document.createElement('div');
        msgDiv.className = 'chat-message ' + sender;
        const avatar = document.createElement('div');
        avatar.className = 'avatar';
        avatar.textContent = sender === 'user' ? '나' : 'AI';
        const bubble = document.createElement('div');
        bubble.className = 'bubble';
        bubble.textContent = text;
        msgDiv.appendChild(avatar);
        msgDiv.appendChild(bubble);
        chatBody.appendChild(msgDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
    }

    function appendLoading() {
        const msgDiv = document.createElement('div');
        msgDiv.className = 'chat-message ai';
        msgDiv.id = 'loadingMsg';
        const avatar = document.createElement('div');
        avatar.className = 'avatar';
        avatar.textContent = 'AI';
        const bubble = document.createElement('div');
        bubble.className = 'bubble';
        bubble.innerHTML = '<span class="loading-dot"></span><span class="loading-dot"></span><span class="loading-dot"></span>';
        msgDiv.appendChild(avatar);
        msgDiv.appendChild(bubble);
        chatBody.appendChild(msgDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
    }

    function removeLoading() {
        const loadingMsg = document.getElementById('loadingMsg');
        if (loadingMsg) loadingMsg.remove();
    }

    function sendMessage() {
        const text = chatInput.value.trim();
        if (!text) return;
        appendMessage(text, 'user');
        chatInput.value = '';
        appendLoading();
        fetch('/metaverse/chat', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ message: text })
        })
        .then(res => res.json())
        .then(data => {
            removeLoading();
            if (data.success) {
                appendMessage(data.answer, 'ai');
            } else {
                appendMessage('AI 응답 오류: ' + (data.error || '알 수 없음'), 'ai');
            }
        })
        .catch(err => {
            removeLoading();
            appendMessage('서버 오류: ' + err, 'ai');
        });
    }

    chatInput.addEventListener('keydown', function(e) {
        if (e.key === 'Enter') sendMessage();
    });
    sendBtn.addEventListener('click', sendMessage);
</script>
</body>
</html> 