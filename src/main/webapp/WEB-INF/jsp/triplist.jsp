<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>TripPlan - 🐾 保存済みの計画一覧</title>
    <style>
        body { 
            font-family: "Meiryo", sans-serif; 
            background-color: #f4f7f9; 
            color: #5a4a42; 
            margin: 0; 
            padding: 40px 20px; 
            display: flex; 
            flex-direction: column; 
            align-items: center; 
        }
        .container { 
            width: 450px; 
            background: white; 
            border-radius: 25px; 
            padding: 30px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.1); 
            border-top: 8px solid #daa520; 
        }

        /* ロゴエリアの設定 */
        .logo-area {
            display: flex;
            justify-content: center;
            background-color: white;
            margin-bottom: 5px; /* 下の文字との間隔 */
        }

        .main-logo {
            width: 200px; /* 一覧画面に合わせて少し調整 */
            height: auto;
            /* ★ グレー背景を白に飛ばして消す設定セット ★ */
            filter: brightness(1.15) contrast(1.2);
            mix-blend-mode: multiply;
            transition: transform 0.3s ease;
        }

        .main-logo:hover {
            transform: scale(1.05);
        }

        /* 元のタイトル文字を残しつつデザイン調整 */
        .sub-title {
            color: #daa520;
            font-size: 1.25rem;
            font-weight: 900;
            margin-bottom: 25px;
            text-align: center;
            padding-bottom: 10px;
            border-bottom: 2px solid #f8f8f8;
        }
        
        .trip-card {
            background: #fffdf0; 
            border: 2px solid #eee; 
            border-radius: 15px;
            padding: 18px; 
            margin-bottom: 15px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            transition: 0.3s; 
            text-decoration: none; 
            color: inherit;
        }
        .trip-card:hover { 
            transform: translateY(-3px); 
            box-shadow: 0 8px 20px rgba(218, 165, 32, 0.2); 
            border-color: #daa520;
            background: white;
        }
        .trip-info { flex: 1; }
        .trip-dest { font-weight: bold; font-size: 1.1em; color: #5a4a42; }
        .trip-date { font-size: 0.85em; color: #888; margin-top: 5px; }
        .trip-budget { font-weight: bold; color: #daa520; font-size: 0.9em; }
        
        .btn-back { 
            display: block; 
            text-align: center; 
            margin-top: 25px; 
            text-decoration: none; 
            color: #daa520; 
            font-weight: bold; 
            transition: 0.3s;
        }
        .btn-back:hover {
            color: #b8860b;
        }
        .empty-msg {
            text-align: center;
            padding: 30px;
            color: #999;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="logo-area">
        <img src="img/Gemini_Generated_Image_ifam6eifam6eifam.png" alt="TripPlan Logo" class="main-logo">
    </div>

    <div class="sub-title">📖 保存済みの計画</div>
    
    <c:if test="${empty planList}">
        <p class="empty-msg">まだ計画がありません。🐾<br>新しい旅を計画しましょう！</p>
    </c:if>

    <c:forEach var="trip" items="${planList}">
        <a href="${pageContext.request.contextPath}/TripListServlet?id=${trip.id}" class="trip-card">
            <div class="trip-info">
                <div class="trip-dest">📍 ${trip.destination}</div>
                <div class="trip-date">計画 ID: ${trip.id}</div>
            </div>
            <div class="trip-budget">詳細を表示 🐾</div>
        </a>
    </c:forEach>

    <a href="tripplan.jsp" class="btn-back">← メインメニューに戻る</a>
</div>

</body>
</html>