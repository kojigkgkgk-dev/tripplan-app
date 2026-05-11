<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>TripPlan - 🐾 ログイン</title>
    <link rel="stylesheet" href="css/trip.css">
    <style>
        body {
            background-color: #f4f7f9;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: 'Helvetica Neue', Arial, sans-serif;
        }

        .login-container {
            width: 380px;
            padding: 40px 30px;
            background: white;
            border-radius: 20px;
            border-top: 8px solid #daa520; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            text-align: center;
        }

        .logo-area {
            margin-bottom: 5px;
            display: flex;
            justify-content: center;
            background-color: white;
        }

        .main-logo {
            width: 240px;
            height: auto;
            
            /* ★ グレーの背景を強制的に消去する最強フィルタ ★ */
            /* brightnessで全体を明るくし、contrastで中間色のグレーを白へ押し出します */
            filter: brightness(1.15) contrast(1.2);
            /* 白くなった背景を下のコンテナの白と合体させて透明化 */
            mix-blend-mode: multiply;
            
            transition: transform 0.3s ease;
        }

        .main-logo:hover {
            transform: scale(1.05);
        }

        .welcome-title {
            color: #daa520;
            font-size: 1.6rem;
            margin: 0 0 5px 0;
            font-weight: 900;
        }

        .welcome-text {
            font-size: 0.95rem;
            color: #555;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        .login-input {
            width: 100%;
            margin-bottom: 18px;
            padding: 14px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            box-sizing: border-box;
            font-size: 1rem;
            background-color: #f8fafc;
            transition: 0.3s;
        }

        .login-input:focus {
            outline: none;
            border-color: #daa520;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(218, 165, 32, 0.1);
        }

        .login-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #daa520, #b8860b);
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            font-size: 1.1rem;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 4px 15px rgba(218, 165, 32, 0.3);
        }

        .login-btn:hover {
            background: linear-gradient(135deg, #b8860b, #966f08);
            transform: translateY(-2px);
        }

        .error-msg {
            color: #e0245e;
            font-size: 0.9em;
            margin-bottom: 15px;
            padding: 10px;
            background: #fff5f5;
            border-radius: 8px;
        }

        .signup-link {
            margin-top: 25px;
            font-size: 0.9rem;
            border-top: 1px solid #eee;
            padding-top: 20px;
            color: #666;
        }

        .signup-link a {
            color: #daa520;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="welcome-header">
        <div class="logo-area">
            <img src="img/Gemini_Generated_Image_ifam6eifam6eifam.png" alt="TripPlan Logo" class="main-logo">
        </div>
        
        <p class="welcome-text">
            地図を広げ、まだ見ぬ場所へ。🐾<br>
            あなたの理想のルートを、ここから猫こう。
        </p>
    </div>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <div class="error-msg"><%= error %></div>
    <% } %>

    <form action="LoginServlet" method="post">
        <input type="text" name="user" class="login-input" placeholder="ユーザーID" required autofocus>
        <input type="password" name="pass" class="login-input" placeholder="パスワード" required>
        <button type="submit" class="login-btn">冒険をスタートする</button>
    </form>

    <div class="signup-link">
        新しい旅人ですか？<br>
        <a href="signup.jsp">🐾 アカウントを作成して旅に出る</a>
    </div>
</div>

</body>
</html>