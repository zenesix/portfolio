<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>고급분석</title>
    <style>body{font-family:sans-serif;padding:2em;}h1{color:#667eea;}ul{padding-left:1.5em;}li{margin-bottom:0.5em;}</style>
</head>
<body>
    <h1>고급분석 페이지</h1>
    <h2>시장 분석</h2>
    <c:if test="${not empty marketAnalysis}">
        <ul>
            <c:forEach var="item" items="${marketAnalysis}">
                <li>${item.name} - <fmt:formatNumber value="${item.changePercent24h}" pattern="#0.00"/>%</li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty marketAnalysis}">
        <p>시장 분석 데이터가 없습니다.</p>
    </c:if>
    <h2>AI 예측</h2>
    <c:if test="${not empty aiPredictions}">
        <ul>
            <c:forEach var="coin" items="${aiPredictions}">
                <li>${coin.name} (${coin.symbol}) - AI 목표가: <fmt:formatNumber value="${coin.aiTargetPrice}" pattern="#0.00"/></li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty aiPredictions}">
        <p>AI 예측 데이터가 없습니다.</p>
    </c:if>
    <h2>시장 심리</h2>
    <c:if test="${not empty sentimentAnalysis}">
        <pre>${sentimentAnalysis}</pre>
    </c:if>
    <c:if test="${empty sentimentAnalysis}">
        <p>시장 심리 데이터가 없습니다.</p>
    </c:if>
</body>
</html> 