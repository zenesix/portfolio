<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Porsche Q&A 게시글 상세</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background: #131217;
            color: #fff;
            font-family: 'Pretendard', 'Noto Sans KR', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }
        .top-nav {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px 40px;
            background-color: #18171c;
            border-bottom: 1px solid #232228;
        }
        .top-nav a {
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            margin: 0 20px;
            font-size: 16px;
            transition: color 0.3s;
        }
        .top-nav a:hover {
            color: #ffcc00;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        .page-title {
            font-size: 36px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 40px;
            color: #fff;
        }
        .board-detail {
            background: #18171c;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #232228;
            margin-bottom: 30px;
        }
        .board-header {
            background: #232228;
            padding: 20px;
            border-bottom: 1px solid #2a2a2a;
        }
        .board-title {
            font-size: 24px;
            font-weight: 600;
            color: #fff;
            margin-bottom: 10px;
        }
        .board-meta {
            display: flex;
            gap: 20px;
            color: #ccc;
            font-size: 14px;
        }
        .board-meta span {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .board-content {
            padding: 30px;
            line-height: 1.6;
            color: #ccc;
        }
        .board-files {
            padding: 20px 30px;
            background: #1f1e24;
            border-top: 1px solid #232228;
        }
        .file-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
        }
        .file-item a {
            color: #ffcc00;
            text-decoration: none;
        }
        .file-item a:hover {
            color: #e6b800;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
            transition: all 0.3s;
        }
        .btn-warning {
            background: #ff9500;
            color: #fff;
        }
        .btn-warning:hover {
            background: #e6850e;
        }
        .btn-danger {
            background: #ff3b30;
            color: #fff;
        }
        .btn-danger:hover {
            background: #d63031;
        }
        .btn-secondary {
            background: #232228;
            color: #fff;
        }
        .btn-secondary:hover {
            background: #2a2a2a;
        }
        .comments-section {
            background: #18171c;
            border-radius: 12px;
            border: 1px solid #232228;
            margin-top: 30px;
        }
        .comments-header {
            background: #232228;
            padding: 20px;
            border-bottom: 1px solid #2a2a2a;
        }
        .comments-title {
            font-size: 20px;
            font-weight: 600;
            color: #fff;
        }
        .comment-item {
            padding: 20px;
            border-bottom: 1px solid #232228;
        }
        .comment-item:last-child {
            border-bottom: none;
        }
        .comment-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .comment-author {
            font-weight: 500;
            color: #ffcc00;
        }
        .comment-date {
            color: #666;
            font-size: 14px;
        }
        .comment-content {
            color: #ccc;
            line-height: 1.5;
        }
        .comment-form {
            padding: 20px;
            background: #1f1e24;
        }
        .comment-inputs {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }
        .comment-inputs input {
            flex: 1;
            padding: 8px 12px;
            background: #18171c;
            border: 1px solid #232228;
            border-radius: 6px;
            color: #fff;
        }
        .comment-inputs input:focus {
            outline: none;
            border-color: #ffcc00;
        }
        .comment-textarea {
            width: 100%;
            padding: 12px;
            background: #18171c;
            border: 1px solid #232228;
            border-radius: 6px;
            color: #fff;
            resize: vertical;
            min-height: 80px;
            margin-bottom: 10px;
        }
        .comment-textarea:focus {
            outline: none;
            border-color: #ffcc00;
        }
        .back-link {
            color: #ffcc00;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }
        .back-link:hover {
            color: #e6b800;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <nav class="top-nav">
        <a href="${pageContext.request.contextPath}/porsche/qna/list">질문게시판</a>
        <a href="${pageContext.request.contextPath}/porsche/model">모델</a>
        <a href="${pageContext.request.contextPath}/porsche/purchase">구매/이벤트</a>
        <a href="${pageContext.request.contextPath}/porsche/service-membership">서비스/멤버십</a>
        <a href="${pageContext.request.contextPath}/porsche/support">디지털/고객지원</a>
        <a href="${pageContext.request.contextPath}/porsche/brand">브랜드</a>
        <a href="${pageContext.request.contextPath}/porsche/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/porsche/connect">Porsche Connect</a>
        <a href="${pageContext.request.contextPath}/porsche/store">Brand Studio</a>
        <a href="${pageContext.request.contextPath}/porsche/ev">EV</a>
    </nav>
    
    <div class="container">
        <h1 class="page-title">Porsche Q&A 게시글</h1>
        
        <div class="board-detail">
            <div class="board-header">
                <div class="board-title">${board.title}</div>
                <div class="board-meta">
                    <span><i class="fas fa-user"></i> ${board.writer}</span>
                    <span><i class="fas fa-calendar"></i> ${board.createdAt}</span>
                    <span><i class="fas fa-eye"></i> 조회수 ${board.viewCount}</span>
                    <c:if test="${board.isSecret}">
                        <span><i class="fas fa-lock"></i> 비밀글</span>
                    </c:if>
                </div>
            </div>
            
            <div class="board-content">
                ${board.content}
            </div>
            
            <c:if test="${not empty files}">
                <div class="board-files">
                    <h4><i class="fas fa-paperclip"></i> 첨부파일</h4>
                    <c:forEach var="file" items="${files}">
                        <div class="file-item">
                            <i class="fas fa-file"></i>
                            <a href="${pageContext.request.contextPath}/download/${file.id}">${file.fileName}</a>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
        
        <div class="board-actions">
            <a href="${pageContext.request.contextPath}/porsche/qna/edit/${board.id}" class="btn btn-warning">
                <i class="fas fa-edit"></i> 수정
            </a>
            <a href="${pageContext.request.contextPath}/porsche/qna/list" class="btn btn-secondary">
                <i class="fas fa-list"></i> 목록
            </a>
            <form action="${pageContext.request.contextPath}/porsche/qna/delete/${board.id}" method="post" style="display:inline;">
                <button type="submit" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">
                    <i class="fas fa-trash"></i> 삭제
                </button>
            </form>
        </div>
        
        <div class="comments-section">
            <div class="comments-header">
                <h3 class="comments-title"><i class="fas fa-comments"></i> 댓글</h3>
            </div>
            
            <c:forEach var="comment" items="${comments}">
                <div class="comment-item">
                    <div class="comment-meta">
                        <span class="comment-author">${comment.commenter}</span>
                        <span class="comment-date">${comment.createdAt}</span>
                    </div>
                    <div class="comment-content">${comment.comment}</div>
                </div>
            </c:forEach>
            
            <form action="${pageContext.request.contextPath}/porsche/qna/comment/${board.id}" method="post" class="comment-form">
                <div class="comment-inputs">
                    <input type="text" name="commenter" placeholder="작성자" required />
                </div>
                <textarea name="comment" class="comment-textarea" placeholder="댓글을 입력하세요" required></textarea>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-paper-plane"></i> 댓글 등록
                </button>
            </form>
        </div>
        
        <a href="${pageContext.request.contextPath}/porsche" class="back-link">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>
</body>
</html> 