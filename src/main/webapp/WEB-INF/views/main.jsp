<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ page session="true" %>

  
<div class="content-wrapper">
<section class="content">
<div>${contextPath}  <br>
전달 받은 내용 출력: ${name } 
</div>
<div><a href="login/loginForm">로그인하기</a> </div>
<div style="margin-top:20px;">
  <h4>Q&A 게시판 REST API 안내</h4>
  <ul>
    <li>게시글 목록: <code>GET /api/qna/boards</code></li>
    <li>게시글 상세: <code>GET /api/qna/boards/{id}</code></li>
    <li>게시글 작성: <code>POST /api/qna/boards</code> (JSON+파일 첨부)</li>
    <li>게시글 수정: <code>PUT /api/qna/boards/{id}</code> (JSON+파일 첨부)</li>
    <li>게시글 삭제: <code>DELETE /api/qna/boards/{id}</code></li>
    <li>비밀글 확인: <code>POST /api/qna/boards/{id}/check-secret</code> (body: 비밀번호)</li>
    <li>첨부파일 목록: <code>GET /api/qna/boards/{boardId}/files</code></li>
    <li>첨부파일 단건: <code>GET /api/qna/files/{fileId}</code></li>
    <li>첨부파일 삭제: <code>DELETE /api/qna/files/{fileId}</code></li>
    <li>댓글 등록: <code>POST /api/qna/comments</code> (JSON)</li>
    <li>댓글 목록: <code>GET /api/qna/comments/{boardId}</code></li>
    <li>댓글 삭제: <code>DELETE /api/qna/comments/{id}</code></li>
  </ul>
  <div style="color:gray;font-size:13px;">※ 위 API는 Postman 등 REST 클라이언트로 테스트하세요.<br> (JSP에서 직접 이동은 불가)</div>
</div>
</section>
</div>
<!--  <@% include file="header.jsp"%>  -->
<!--  <@% include file="footer.jsp"%>  -->
