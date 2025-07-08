<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>포트폴리오</title>
    <style>body{font-family:sans-serif;padding:2em;}h1{color:#667eea;}table{border-collapse:collapse;width:100%;}th,td{border:1px solid #ccc;padding:0.5em;}th{background:#f0f0ff;}</style>
</head>
<body>
    <h1>포트폴리오</h1>
    <c:if test="${not empty portfolio}">
        <table>
            <thead><tr><th>코인</th><th>수량</th><th>평균매수가</th><th>평가금액</th><th>수익률</th></tr></thead>
            <tbody>
                <c:forEach var="coin" items="${portfolio}">
                    <tr>
                        <td>${coin.name} (${coin.symbol})</td>
                        <td><fmt:formatNumber value="${coin.quantity}" pattern="#0.00"/></td>
                        <td><fmt:formatNumber value="${coin.avgBuyPrice}" pattern="#0.00"/></td>
                        <td><fmt:formatNumber value="${coin.totalValue}" pattern="#0.00"/></td>
                        <td><fmt:formatNumber value="${coin.unrealizedPnL}" pattern="#0.00"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty portfolio}">
        <p>포트폴리오 데이터가 없습니다.</p>
    </c:if>
    <h2>포트폴리오 통계</h2>
    <c:if test="${not empty portfolioStats}">
        <pre>${portfolioStats}</pre>
    </c:if>
    <c:if test="${empty portfolioStats}">
        <p>통계 데이터가 없습니다.</p>
    </c:if>
    <h2>추천 코인</h2>
    <c:if test="${not empty recommendations}">
        <ul>
            <c:forEach var="coin" items="${recommendations}">
                <li>${coin.name} (${coin.symbol}) - AI 추천: ${coin.aiRecommendation}</li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty recommendations}">
        <p>추천 데이터가 없습니다.</p>
    </c:if>
</body>
</html> 