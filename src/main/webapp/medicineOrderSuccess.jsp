<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Patient" %>

<%
    Patient patient = (Patient) session.getAttribute("patient");
    if (patient == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Order Successful</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #003b44, #0a5c6b);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 14px;
            width: 450px;
            text-align: center;
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
        }

        h1 {
            color: #0d6efd;
            margin-bottom: 15px;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background: #0a5c6b;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            margin: 8px;
        }

        .btn:hover {
            background: #084d59;
        }
    </style>
</head>

<body>

<div class="card">
    <h1>✅ Order Placed Successfully</h1>
    <p>Your medicine order has been placed successfully.</p>

    <a href="orderHistory.jsp" class="btn">View Order History</a>
    <a href="patientDashboard.jsp" class="btn">Go to Dashboard</a>
</div>

</body>
</html>
