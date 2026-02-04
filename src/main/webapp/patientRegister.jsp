<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration</title>
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

        .register-card {
            background-color: #ffffff;
            width: 420px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        .header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
        }

        .header h2 {
            color: #003b44;
            margin: 0;
        }

        .field-label {
            text-align: left;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }

        input[name="name"],
        input[name="email"],
        input[name="phone"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="submit"] {
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

        input[type="submit"]:hover {
            background-color: #146c43;
        }

        .login-link {
            margin-top: 15px;
            text-align: center;
        }

        .login-link a {
            text-decoration: none;
            color: #0a5c6b;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="register-card">

    <div class="header">
        <h2>Patient Registration</h2>
    </div>

    <form action="PatientRegisterServlet" method="post">

        <div class="field-label">Name:</div>
        <input name="name" type="text"><br>

        <div class="field-label">Email:</div>
        <input name="email" type="email"><br>

        <div class="field-label">Phone:</div>
        <input name="phone" type="tel"><br>

        <div class="field-label">Password:</div>
        <input type="password" name="password"><br>

        <input type="submit" value="Register">
    </form>

   

</div>

</body>
</html>