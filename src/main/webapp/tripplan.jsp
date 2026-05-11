<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>TripPlan - 🐾 メインメニュー</title>
    <style>
        body { 
            font-family: "Meiryo", sans-serif; 
            background-color: #f4f7f9; 
            color: #5a4a42; 
            margin: 0; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
        }
        
        .container { 
            width: 420px; 
            padding: 40px 30px; 
            background: white; 
            border-radius: 25px; 
            border-top: 8px solid #daa520; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.1); 
            text-align: center; 
        }

        /* ロゴエリアの設定 */
        .logo-area {
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
            background-color: white;
        }

        .main-logo {
            width: 220px;
            height: auto;
            /* グレーの背景を白く飛ばして透明化する設定 */
            filter: brightness(1.15) contrast(1.2);
            mix-blend-mode: multiply;
            transition: transform 0.3s ease;
        }

        .main-logo:hover {
            transform: scale(1.05);
        }

        .menu-grid { 
            display: flex; 
            flex-direction: column; 
            gap: 18px; 
            margin-top: 25px; 
        }
        
        /* ボタンの共通スタイル */
        .btn-menu { 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            gap: 12px;
            padding: 18px; 
            background: #fffdf0; 
            border: 2px solid #daa520; 
            border-radius: 15px; 
            text-decoration: none; 
            color: #5a4a42; 
            font-weight: bold; 
            font-size: 1.1rem;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .btn-menu:hover { 
            background: #daa520; 
            color: white;
            transform: translateY(-3px); 
            box-shadow: 0 8px 20px rgba(218, 165, 32, 0.3); 
        }
        
        /* MISSIONボタン（青色系）の調整 */
        .btn-mission { 
            border-color: #4a90e2; 
            color: #4a90e2; 
        }
        .btn-mission:hover { 
            background: #4a90e2; 
            color: white; 
            box-shadow: 0 8px 20px rgba(74, 144, 226, 0.3);
        }

        /* アイコンの調整 */
        .btn-menu span {
            font-size: 1.3rem;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="logo-area">
        <img src="img/Gemini_Generated_Image_ifam6eifam6eifam.png" alt="TripPlan Logo" class="main-logo">
    </div>

    <div class="menu-grid">
        <a href="${pageContext.request.contextPath}/TripServlet" class="btn-menu">
            <span>📝</span> 旅の計画を新規作成
        </a>

        <a href="${pageContext.request.contextPath}/TripListServlet" class="btn-menu">
            <span>📖</span> 作成済みの計画を参照
        </a>

        <a href="${pageContext.request.contextPath}/MissionServlet" class="btn-menu btn-mission">
            <span>🚩</span> 現在のMISSION（貯蓄中）
        </a>
    </div>
</div>

</body>
</html>