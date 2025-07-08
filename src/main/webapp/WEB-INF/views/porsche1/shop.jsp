<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Porsche - Shop</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
    }
    .shop-header {
        background: url('https://images.unsplash.com/photo-1516762689621-2c7bcf25c947?q=80&w=2670&auto=format&fit=crop') no-repeat center center;
        background-size: cover;
        color: white;
        text-align: center;
        padding: 100px 0;
        text-shadow: 2px 2px 8px rgba(0,0,0,0.6);
    }
    .shop-header h1 {
        font-size: 48px;
        font-weight: 700;
    }
    .page-section { padding: 60px 0; }
    .filters {
        text-align: center;
        margin-bottom: 40px;
    }
    .product-card {
        background-color: #fff;
        border-radius: 15px;
        overflow: hidden;
        margin-bottom: 30px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.07);
        transition: all 0.3s ease;
        text-align: center;
    }
    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }
    .product-card img {
        width: 100%;
        height: 280px;
        object-fit: cover;
    }
    .product-info { padding: 20px; }
    .product-info h4 { font-weight: 600; }
    .product-info .price {
        font-size: 18px;
        font-weight: 500;
        color: #337ab7;
        margin-top: 10px;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 40px;
        font-size: 16px;
    }
</style>
</head>
<body>
    <div class="shop-header">
        <h1>Porsche Lifestyle</h1>
    </div>

    <div class="container page-section">
        <div class="filters">
            <button class="btn btn-default">All</button>
            <button class="btn btn-default">Model Cars</button>
            <button class="btn btn-default">Fashion</button>
            <button class="btn btn-default">Accessories</button>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/resources/img/1.jpg" alt="Product 1">
                    <div class="product-info">
                        <h4>911 Carrera RS 2.7 1:18</h4>
                        <p class="price">₩250,000</p>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
            </div>
             <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/resources/img/2.jpg" alt="Product 2">
                    <div class="product-info">
                        <h4>Racing Collection Jacket</h4>
                        <p class="price">₩450,000</p>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/resources/img/3.jpg" alt="Product 3">
                    <div class="product-info">
                        <h4>Porsche Crest Mug</h4>
                        <p class="price">₩35,000</p>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
            </div>
             <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/resources/img/4.jpg" alt="Product 4">
                    <div class="product-info">
                        <h4>Baseball Cap</h4>
                        <p class="price">₩55,000</p>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/hyundai" class="back-link">메인으로 돌아가기</a>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <a href="${pageContext.request.contextPath}/porsche" style="color: #ffcc00; text-decoration: none; font-weight: 600; font-size: 16px;">
            <i class="fas fa-arrow-left"></i> 메인으로 돌아가기
        </a>
    </div>
</body>
</html> 