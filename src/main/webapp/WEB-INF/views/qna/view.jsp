<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Q&A 게시글 상세</title>
    <link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Q&A 게시글 상세</h2>
    <table class="table table-bordered">
        <tr><th>제목</th><td>${board.title}</td></tr>
        <tr><th>작성자</th><td>${board.writer}</td></tr>
        <tr><th>작성일</th><td>${board.createdAt}</td></tr>
        <tr><th>조회수</th><td>${board.viewCount}</td></tr>
        <tr><th>내용</th><td>${board.content}</td></tr>
        <tr><th>첨부파일</th>
            <td>
                <c:forEach var="file" items="${files}">
                    <a href="/download/${file.id}">${file.fileName}</a><br/>
                </c:forEach>
            </td>
        </tr>
    </table>
    <a href="/qna/edit/${board.id}" class="btn btn-warning">수정</a>
    <a href="/qna/list" class="btn btn-default">목록</a>
    <form action="/qna/delete/${board.id}" method="post" style="display:inline;">
        <button type="submit" class="btn btn-danger">삭제</button>
    </form>
    <hr/>
    <h4>댓글</h4>
    <ul>
        <c:forEach var="comment" items="${comments}">
            <li>${comment.commenter} : ${comment.comment} <small>(${comment.createdAt})</small></li>
        </c:forEach>
    </ul>
    <form action="/qna/comment/${board.id}" method="post">
        <input type="text" name="commenter" placeholder="작성자" required/>
        <input type="text" name="comment" placeholder="댓글" required/>
        <button type="submit" class="btn btn-primary btn-sm">댓글 등록</button>
    </form>
</div>
</body>
</html> 