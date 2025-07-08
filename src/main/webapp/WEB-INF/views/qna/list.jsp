<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Q&A 게시판 목록</title>
    <link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Q&A 게시판 목록</h2>
    <a href="/qna/write" class="btn btn-primary" style="margin-bottom:10px;">글쓰기</a>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>비밀글</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boards}">
            <tr>
                <td>${board.id}</td>
                <td><a href="/qna/view/${board.id}">${board.title}</a></td>
                <td>${board.writer}</td>
                <td>${board.createdAt}</td>
                <td>${board.viewCount}</td>
                <td><c:if test="${board.isSecret}">🔒</c:if></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html> 