<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PharmaFast - Doctor Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003d4d, #004f5f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .register-card {
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            width: 450px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .register-card h2 {
            text-align: center;
            color: #003d4d;
            margin-bottom: 25px;
        }
        .form-label { font-weight: 600; }
        .register-card input,
        .register-card select {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        .register-card input[type="submit"] {
            background-color: #0d6efd;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }
        .register-card input[type="submit"]:hover {
            background-color: #084298;
        }
        .login-link {
            text-align: center;
            margin-top: 10px;
        }
        .login-link a {
            text-decoration: none;
            font-weight: 600;
            color: #0a5c6b;
        }
        .error-msg {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }
        .success-msg {
            color: green;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="register-card">
    <h2>Doctor Registration</h2>

    <%-- Messages come via sendRedirect (query params) --%>
    <% if (request.getParameter("error") != null) { %>
        <div class="error-msg"><%= request.getParameter("error") %></div>
    <% } %>

    <% if (request.getParameter("success") != null) { %>
        <div class="success-msg"><%= request.getParameter("success") %></div>
    <% } %>

    <form action="<%= request.getContextPath() %>/DoctorRegisterServlet" method="post">

        <label class="form-label">Doctor Name</label>
        <input type="text" name="name" required>

        <label class="form-label">Email</label>
        <input type="email" name="email" required>

        <label class="form-label">Phone</label>
        <input type="text" name="phone" required>

        <label class="form-label">Doctor Type</label>
        <select name="specialization" required>
            <option value="">-- Select Specialization --</option>
            <option value="Cardiologist">Cardiologist</option>
            <option value="Neurologist">Neurologist</option>
            <option value="Dermatologist">Dermatologist</option>
            <option value="Orthopedic">Orthopedic</option>
            <option value="Pediatrician">Pediatrician</option>
            <option value="General Physician">General Physician</option>
        </select>

        <label class="form-label">Password</label>
        <input type="password" name="password" required>

        <input type="submit" value="Register">
    </form>

    <div class="login-link">
        Already registered?
        <a href="<%= request.getContextPath() %>/doctorLogin.jsp">Login Here</a>
    </div>
</div>

</body>
</html>
