<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>旅行計画 - MISSION</title>
<style>
    body { background-color: #fdf5e6; font-family: sans-serif; display: flex; justify-content: center; }
    .container { width: 400px; background: white; padding: 20px; border-radius: 15px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); margin-top: 50px; }
    
    .savings-box { background: #fffde7; border: 2px solid #ffd700; padding: 15px; border-radius: 10px; margin-bottom: 20px; text-align: center; }
    .daily-goal { font-size: 1.5em; font-weight: bold; color: #ff8c00; margin: 10px 0; }

    .mission-item { padding: 12px; margin: 10px 0; border-radius: 8px; border-left: 8px solid; }
    .status-red { background-color: #ffebee; border-left-color: #ff4d4d; color: #cc0000; }
    .status-teal { background-color: #e0f2f1; border-left-color: #20b2aa; color: #008080; }

    .category-tag { font-size: 0.75em; background: #eee; padding: 2px 6px; border-radius: 4px; color: #555; vertical-align: middle; margin-right: 5px; }
    .no-mission { text-align: center; color: #999; margin: 20px 0; }
</style>
</head>
<body>

<div class="container">
    <h2>現在のMISSION</h2>

    <div class="savings-box">
        <p>出発（<c:out value="${trip.departureDate}" />）まで</p>
        <p>あと <strong>${daysRemaining}</strong> 日</p>
        <hr style="border: 0; border-top: 1px dashed #ffd700;">
        <p>1日の目標貯金額</p>
        <div class="daily-goal">
            ¥ <fmt:formatNumber value="${dailyGoal}" pattern="#,###" />
        </div>
        <p><small>
            (総額 ¥<fmt:formatNumber value="${trip.totalBudget}" pattern="#,###" /> / 
            現在 ¥<fmt:formatNumber value="${currentSavings}" pattern="#,###" />)
        </small></p>
    </div>

    <h3 style="font-size: 1em; color: #555; border-bottom: 2px solid #fdf5e6;">ToDoリスト</h3>

    <c:choose>
        <c:when test="${not empty missionList}">
            <c:forEach var="m" items="${missionList}">
                <div class="mission-item ${m.completed ? 'status-teal' : 'status-red'}">
                    <span class="category-tag">${m.category}</span>
                    <strong>${m.title}</strong>
                    <div style="text-align: right; font-size: 0.8em; margin-top: 5px;">
                        ${m.completed ? '● MISSION COMPLETE' : '○ IN PROGRESS'}
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p class="no-mission">登録されているミッションはありません。</p>
        </c:otherwise>
    </c:choose>

    <div style="text-align: center; margin-top: 20px;">
        <a href="tripplan.jsp" style="text-decoration: none; color: #888; font-size: 0.9em;">← メインメニューへ戻る</a>
    </div>
</div>

</body>
</html>