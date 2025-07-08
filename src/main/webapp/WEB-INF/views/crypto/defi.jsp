<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>DeFi 프로토콜</title>
    <style>body{font-family:sans-serif;padding:2em;}h1{color:#667eea;}table{border-collapse:collapse;width:100%;}th,td{border:1px solid #ccc;padding:0.5em;}th{background:#f0f0ff;}</style>
</head>
<body>
    <h1>DeFi 프로토콜</h1>
    <c:if test="${not empty defiProtocols}">
        <table>
            <thead><tr><th>프로토콜</th><th>TVL</th><th>APY</th><th>24h 거래량</th></tr></thead>
            <tbody>
                <c:forEach var="protocol" items="${defiProtocols}">
                    <tr>
                        <td>${protocol.name}</td>
                        <td><fmt:formatNumber value="${protocol.tvl}" pattern="#0.00"/></td>
                        <td><fmt:formatNumber value="${protocol.apy}" pattern="#0.00"/>%</td>
                        <td><fmt:formatNumber value="${protocol.volume24h}" pattern="#0.00"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty defiProtocols}">
        <p>DeFi 프로토콜 데이터가 없습니다.</p>
    </c:if>
    <h2>DeFi 메트릭</h2>
    <c:if test="${not empty defiMetrics}">
        <pre>${defiMetrics}</pre>
    </c:if>
    <c:if test="${empty defiMetrics}">
        <p>메트릭 데이터가 없습니다.</p>
    </c:if>
    <h2>수익농사 기회</h2>
    <c:if test="${not empty yieldFarming}">
        <ul>
            <c:forEach var="farm" items="${yieldFarming}">
                <li>${farm.name} - APY: <fmt:formatNumber value="${farm.apy}" pattern="#0.00"/>%</li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty yieldFarming}">
        <p>수익농사 데이터가 없습니다.</p>
    </c:if>
</body>
</html> 