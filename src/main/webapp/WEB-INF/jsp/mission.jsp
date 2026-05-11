<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>TripPlan - 🐾 MISSION</title>
    <style>
        body { 
            background-color: #f4f7f9; 
            font-family: "Meiryo", sans-serif; 
            display: flex; 
            justify-content: center; 
            margin: 0;
            padding: 40px 20px;
        }
        
        .container { 
            width: 420px; 
            background: white; 
            padding: 30px; 
            border-radius: 25px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.1); 
            border-top: 8px solid #4a90e2; /* MISSIONは青系のアクセント */
        }

        /* ロゴエリアの設定 */
        .logo-area {
            display: flex;
            justify-content: center;
            background-color: white;
            margin-bottom: 5px;
        }

        .main-logo {
            width: 180px;
            height: auto;
            /* ★ グレー背景を白に飛ばして消す設定セット ★ */
            filter: brightness(1.15) contrast(1.2);
            mix-blend-mode: multiply;
            transition: transform 0.3s ease;
        }

        .main-logo:hover {
            transform: scale(1.05);
        }

        h2 { 
            color: #4a90e2; 
            text-align: center; 
            font-size: 1.4rem;
            margin-bottom: 25px;
            margin-top: 0;
        }
        
        /* 貯金箱エリアの強化 */
        .savings-box { 
            background: #f0f7ff; 
            border: 2px solid #4a90e2; 
            padding: 20px; 
            border-radius: 15px; 
            margin-bottom: 25px; 
            text-align: center; 
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.05);
        }
        
        .daily-goal { 
            font-size: 1.8em; 
            font-weight: bold; 
            color: #4a90e2; 
            margin: 10px 0; 
            text-shadow: 1px 1px 0px white;
        }

        .mission-item { 
            padding: 15px; 
            margin: 12px 0; 
            border-radius: 12px; 
            border-left: 8px solid; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        
        .status-red { background-color: #fff5f5; border-left-color: #ff4d4d; color: #cc0000; }
        .status-teal { background-color: #f0fff4; border-left-color: #20b2aa; color: #008080; }

        .category-tag { 
            font-size: 0.75em; 
            background: rgba(0,0,0,0.05); 
            padding: 3px 8px; 
            border-radius: 6px; 
            color: #666; 
            margin-right: 8px; 
        }

        .btn-back { 
            display: block;
            text-align: center; 
            margin-top: 25px; 
            text-decoration: none; 
            color: #4a90e2; 
            font-weight: bold; 
            font-size: 0.9em;
        }
        .btn-back:hover { text-decoration: underline; }
        
        .no-mission { text-align: center; color: #999; margin: 30px 0; }
    </style>
</head>
<body>

<div class="container">
    <div class="logo-area">
        <img src="img/Gemini_Generated_Image_ifam6eifam6eifam.png" alt="TripPlan Logo" class="main-logo">
    </div>

    <h2>現在のMISSION</h2>

    <div class="savings-box">
        <p style="margin: 0; color: #666;">出発（<c:out value="${trip.departureDate}" />）まで</p>
        <p style="font-size: 1.2em; font-weight: bold; margin: 5px 0;">あと <span style="color: #ff4d4d;">${daysRemaining}</span> 日</p>
        <hr style="border: 0; border-top: 1px dashed #4a90e2; margin: 15px 0;">
        <p style="margin: 0; font-size: 0.9em; color: #666;">1日の目標貯金額</p>
        <div class="daily-goal">
            ¥ <fmt:formatNumber value="${dailyGoal}" pattern="#,###" />
        </div>
        <p style="margin: 0;"><small style="color: #888;">
            (目標 ¥<fmt:formatNumber value="${trip.totalBudget}" pattern="#,###" /> / 
            現在 ¥<fmt:formatNumber value="${currentSavings}" pattern="#,###" />)
        </small></p>
    </div>

    <h3 style="font-size: 1em; color: #4a90e2; border-bottom: 2px solid #f0f7ff; padding-bottom: 8px;">🚩 ToDoリスト</h3>

    <c:choose>
        <c:when test="${not empty missionList}">
            <c:forEach var="m" items="${missionList}">
                <div class="mission-item ${m.completed ? 'status-teal' : 'status-red'}">
                    <span class="category-tag">${m.category}</span>
                    <strong>${m.title}</strong>
                    <div style="text-align: right; font-size: 0.8em; margin-top: 8px; font-weight: bold;">
                        ${m.completed ? '● MISSION COMPLETE' : '○ IN PROGRESS'}
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p class="no-mission">登録されているミッションはありません。🐾</p>
        </c:otherwise>
    </c:choose>

    <div style="text-align: center;">
        <a href="tripplan.jsp" class="btn-back">← メインメニューへ戻る</a>
    </div>
</div>

</body>
</html>