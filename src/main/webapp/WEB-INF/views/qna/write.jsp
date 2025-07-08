<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Q&A 글쓰기</title>
    <link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Q&A 글쓰기</h2>
    <form action="/qna/write" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>제목</label>
            <input type="text" name="title" class="form-control" required />
        </div>
        <div class="form-group">
            <label>내용</label>
            <textarea name="content" class="form-control" rows="5" required></textarea>
        </div>
        <div class="form-group">
            <label>작성자</label>
            <input type="text" name="writer" class="form-control" required />
        </div>
        <div class="form-group">
            <label>비밀글</label>
            <input type="checkbox" name="isSecret" value="true" />
            <input type="text" name="password" class="form-control" placeholder="비밀글 비밀번호" />
        </div>
        <div class="form-group">
            <label>첨부파일</label>
            <input type="file" name="files" multiple class="form-control" />
        </div>
        <button type="submit" class="btn btn-primary">등록</button>
        <a href="/qna/list" class="btn btn-default">목록</a>
    </form>
</div>
</body>
</html> 