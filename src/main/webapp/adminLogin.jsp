<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #003b44, #0a5c6b);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: white;
            padding: 35px;
            width: 360px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            color: #003b44;
            margin-bottom: 25px;
        }

        .field-label {
            font-weight: 600;
            margin-bottom: 6px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 11px;
            background-color: #198754;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #146c43;
        }
    </style>
</head>

<body>

<div class="login-box">
    <h2>Admin Login</h2>

    <form action="AdminServlet" method="post">

        <div class="field-label">Username</div>
        <input type="text" name="username" placeholder="Enter admin username" required>

        <div class="field-label">Password</div>
        <input type="password" name="password" placeholder="Enter admin password" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>