<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>NFT 마켓</title>
    <style>body{font-family:sans-serif;padding:2em;}h1{color:#667eea;}table{border-collapse:collapse;width:100%;}th,td{border:1px solid #ccc;padding:0.5em;}th{background:#f0f0ff;}</style>
</head>
<body>
    <h1>NFT 마켓</h1>
    <c:if test="${not empty nftCollections}">
        <table>
            <thead><tr><th>컬렉션</th><th>Floor Price</th><th>24h 판매량</th></tr></thead>
            <tbody>
                <c:forEach var="nft" items="${nftCollections}">
                    <tr>
                        <td>${nft.name}</td>
                        <td><fmt:formatNumber value="${nft.floorPrice}" pattern="#0.00"/></td>
                        <td><fmt:formatNumber value="${nft.sales24h}" pattern="#0"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty nftCollections}">
        <p>NFT 컬렉션 데이터가 없습니다.</p>
    </c:if>
    <h2>NFT 메트릭</h2>
    <c:if test="${not empty nftMetrics}">
        <pre>${nftMetrics}</pre>
    </c:if>
    <c:if test="${empty nftMetrics}">
        <p>메트릭 데이터가 없습니다.</p>
    </c:if>
    <h2>트렌딩 NFT</h2>
    <c:if test="${not empty trendingNFTs}">
        <ul>
            <c:forEach var="nft" items="${trendingNFTs}">
                <li>${nft.name} - 24h 변동률: <fmt:formatNumber value="${nft.changePercent24h}" pattern="#0.00"/>%</li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty trendingNFTs}">
        <p>트렌딩 NFT 데이터가 없습니다.</p>
    </c:if>
</body>
</html> 