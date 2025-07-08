<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Porsche Q&A 글쓰기</title>
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
            max-width: 800px;
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
        .form-group {
            margin-bottom: 24px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #fff;
            font-weight: 500;
        }
        .form-control {
            width: 100%;
            padding: 12px 16px;
            background: #18171c;
            border: 1px solid #232228;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            box-sizing: border-box;
        }
        .form-control:focus {
            outline: none;
            border-color: #ffcc00;
            box-shadow: 0 0 0 2px rgba(255, 204, 0, 0.2);
        }
        .form-control::placeholder {
            color: #666;
        }
        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 16px;
        }
        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #ffcc00;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 12px;
            transition: all 0.3s;
        }
        .btn-primary {
            background: #ffcc00;
            color: #18171c;
            font-weight: 600;
        }
        .btn-primary:hover {
            background: #e6b800;
        }
        .btn-secondary {
            background: #232228;
            color: #fff;
        }
        .btn-secondary:hover {
            background: #2a2a2a;
        }
        .file-input {
            background: #18171c;
            border: 2px dashed #232228;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            color: #666;
            transition: border-color 0.3s;
        }
        .file-input:hover {
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
        <h1 class="page-title">Porsche Q&A 글쓰기</h1>
        
        <form action="${pageContext.request.contextPath}/porsche/qna/write" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label><i class="fas fa-heading"></i> 제목</label>
                <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" required />
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-user"></i> 작성자</label>
                <input type="text" name="writer" class="form-control" placeholder="작성자를 입력하세요" required />
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-edit"></i> 내용</label>
                <textarea name="content" class="form-control" placeholder="내용을 입력하세요" required></textarea>
            </div>
            
            <div class="form-group">
                <div class="checkbox-group">
                    <input type="checkbox" name="isSecret" value="true" id="isSecret" />
                    <label for="isSecret"><i class="fas fa-lock"></i> 비밀글</label>
                </div>
                <input type="text" name="password" class="form-control" placeholder="비밀글 비밀번호 (비밀글 선택 시)" />
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-paperclip"></i> 첨부파일</label>
                <div class="file-input">
                    <input type="file" name="files" multiple class="form-control" style="border: none; background: transparent;" />
                    <p style="margin: 10px 0 0 0; color: #666;">여러 파일을 선택할 수 있습니다</p>
                </div>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> 등록
                </button>
                <a href="${pageContext.request.contextPath}/porsche/qna/list" class="btn btn-secondary">
                    <i class="fas fa-list"></i> 목록
                </a>
            </div>
        </form>
        
        <a href="${pageContext.request.contextPath}/porsche" class="back-link">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>
</body>
</html> 