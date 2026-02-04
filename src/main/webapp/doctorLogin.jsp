<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PharmaFast - Doctor Login</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003d4d, #004f5f);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-wrapper {
            width: 1000px;
            height: 520px;
            background: #ffffff;
            border-radius: 16px;
            display: flex;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(0,0,0,0.35);
        }

        .login-left {
            width: 40%;
            padding: 45px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
          }
        
        .login-left h2 {
            color: #003d4d;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .login-left p {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 600;
            margin-bottom: 6px;
            color: #333;
            font-size: 14px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 11px;
            margin-bottom: 18px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #0a5c6b;
            box-shadow: 0 0 0 2px rgba(10,92,107,0.15);
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #0d6efd;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        input[type="submit"]:hover {
            background: #084298;
        }

        .error-msg {
            color: #dc3545;
            margin-bottom: 15px;
            text-align: center;
            font-weight: 600;
            font-size: 14px;
        }

        .register-link {
            margin-top: 18px;
            text-align: center;
            font-size: 14px;
        }

        .register-link a {
            text-decoration: none;
            color: #0a5c6b;
            font-weight: 600;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        /* RIGHT ILLUSTRATION */
        .login-right {
            width: 60%;
            background: #f1f5f9;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-right img {
            max-width: 90%;
            height: auto;
        }
    </style>
</head>

<body>

<div class="login-wrapper">

    <!-- LEFT SIDE -->
    <div class="login-left">
        <h2>Doctor Login</h2>
        <p>Sign in to Manage appointments and patients</p>

        <% if (request.getParameter("error") != null) { %>
            <div class="error-msg"><%= request.getParameter("error") %></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/DoctorLoginServlet" method="post">

            <label class="form-label">Email or Phone</label>
            <input type="text" name="username" required>

            <label class="form-label">Password</label>
            <input type="password" name="password" required>

            <input type="submit" value="Login">
        </form>

        <div class="register-link">
            Don’t have an account?
            <a href="<%= request.getContextPath() %>/doctorRegister.jsp">Register Here</a>
        </div>
    </div>

    <!-- RIGHT SIDE -->
    <div class="login-right">
        <img src="https://cdn-icons-png.flaticon.com/512/3774/3774299.png" alt="Doctor Illustration">
    </div>

</div>

</body>
</html>
