<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현대 Q&A 게시판</title>
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
            color: #00a0e9;
        }
        .container {
            max-width: 1200px;
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
        .btn-primary {
            background: #00a0e9;
            border: none;
            color: #fff;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
            transition: background 0.3s;
        }
        .btn-primary:hover {
            background: #0088cc;
            color: #fff;
            text-decoration: none;
        }
        .table {
            background: #18171c;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #232228;
        }
        .table thead th {
            background: #232228;
            color: #fff;
            border: none;
            padding: 16px;
            font-weight: 600;
        }
        .table tbody td {
            border: none;
            border-bottom: 1px solid #232228;
            padding: 16px;
            color: #ccc;
        }
        .table tbody tr:hover {
            background: #1f1e24;
        }
        .table tbody tr:last-child td {
            border-bottom: none;
        }
        .title-link {
            color: #00a0e9;
            text-decoration: none;
            font-weight: 500;
        }
        .title-link:hover {
            color: #0088cc;
            text-decoration: none;
        }
        .secret-icon {
            color: #ff6b6b;
        }
        .back-link {
            color: #00a0e9;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }
        .back-link:hover {
            color: #0088cc;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <nav class="top-nav">
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
        <h1 class="page-title">현대 Q&A 게시판</h1>
        <a href="${pageContext.request.contextPath}/porsche/qna/write" class="btn-primary">
            <i class="fas fa-plus"></i> 글쓰기
        </a>
        
        <table class="table">
            <thead>
                <tr>
                    <th width="10%">번호</th>
                    <th width="40%">제목</th>
                    <th width="15%">작성자</th>
                    <th width="15%">작성일</th>
                    <th width="10%">조회수</th>
                    <th width="10%">비밀글</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${boards}">
                    <tr>
                        <td>${board.id}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/porsche/qna/view/${board.id}" class="title-link">
                                ${board.title}
                            </a>
                        </td>
                        <td>${board.writer}</td>
                        <td>${board.createdAt}</td>
                        <td>${board.viewCount}</td>
                        <td>
                            <c:if test="${board.isSecret}">
                                <i class="fas fa-lock secret-icon"></i>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <a href="${pageContext.request.contextPath}/porsche" class="back-link">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>
</body>
</html> 