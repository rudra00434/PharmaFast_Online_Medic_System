<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Login</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003b44, #0a5c6b);
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

        /* LEFT LOGIN FORM */
        .login-left {
            width: 40%;
            padding: 45px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-left h2 {
            color: #003b44;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .login-left p {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
        }

        .field-label {
            font-weight: 600;
            margin-bottom: 6px;
            color: #333;
            font-size: 14px;
        }

        input[name="username"],
        input[type="password"] {
            width: 100%;
            padding: 11px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
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
            background: #22c55e;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        input[type="submit"]:hover {
            background: #16a34a;
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

    <!-- LEFT SIDE (FORM) -->
    <div class="login-left">
        <h2>Welcome to PharmaFast</h2>
        <p>Sign in by entering your information below</p>

        <%-- ERROR FROM SERVLET (UNCHANGED) --%>
        <% if (request.getParameter("error") != null) { %>
            <div class="error-msg"><%= request.getParameter("error") %></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/PatientLoginServlet" method="post">

            <div class="field-label">Email or Phone</div>
            <input type="text" name="username" required>

            <div class="field-label">Password</div>
            <input type="password" name="password" required>

            <input type="submit" value="Login">
        </form>

        <div class="register-link">
            Don't have an account?
            <a href="<%= request.getContextPath() %>/patientRegister.jsp">Sign Up</a>
        </div>
    </div>

    <!-- RIGHT SIDE (ILLUSTRATION) -->
    <div class="login-right">
        <!-- You can replace this image anytime -->
        <img src="https://cdn-icons-png.flaticon.com/512/3774/3774299.png" alt="Doctor Illustration">
    </div>

</div>

</body>
</html>
