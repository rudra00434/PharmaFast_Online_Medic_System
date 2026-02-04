<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Doctor" %>

<%
    Doctor doctor = (Doctor) session.getAttribute("doctor");
    if (doctor == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
    String doctorName = doctor.getName();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            min-height: 100vh;
        }

        .dashboard-header {
            padding: 35px 20px;
            color: white;
            text-align: center;
        }

        .dashboard-header h1 {
            margin: 0;
            font-weight: 700;
        }

        .dashboard-container {
            max-width: 600px;
            margin: -40px auto 40px auto;
            padding: 35px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        /* 🔹 Vertical Layout */
        .cards {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .dashboard-card {
            padding: 30px 20px;
            border-radius: 14px;
            background: linear-gradient(135deg, #f8f9fa, #ffffff);
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .dashboard-card a {
            text-decoration: none;
            font-size: 18px;
            font-weight: 600;
            color: #003d4d;
            display: block;
        }

        .dashboard-card i {
            font-size: 22px;
            margin-right: 10px;
            color: #0a5c6b;
        }

        .logout {
            margin-top: 35px;
            text-align: right;
        }

        .logout a {
            text-decoration: none;
            font-weight: 600;
            color: white;
            background: linear-gradient(135deg, #dc3545, #b02a37);
            padding: 10px 20px;
            border-radius: 8px;
            transition: box-shadow 0.2s ease;
        }

        .logout a:hover {
            box-shadow: 0 6px 15px rgba(0,0,0,0.25);
        }
    </style>
</head>

<body>

<div class="dashboard-header">
    <h1>Welcome Dr. <%= doctorName %></h1>
</div>

<div class="dashboard-container">

    <div class="cards">

        <div class="dashboard-card">
            <a href="viewAppointments.jsp">
                <i class="fa-solid fa-calendar-days"></i>
                View Appointments
            </a>
        </div>

        <div class="dashboard-card">
            <a href="manageAppointments.jsp">
                <i class="fa-solid fa-clipboard-check"></i>
                Manage Appointments
            </a>
        </div>

        <div class="dashboard-card">
            <a href="viewPatients.jsp">
                <i class="fa-solid fa-users"></i>
                View Patients
            </a>
        </div>

        <div class="dashboard-card">
            <a href="viewMedicines.jsp">
                <i class="fa-solid fa-pills"></i>
                View Medicines
            </a>
        </div>

    </div>

    <div class="logout">
        <a href="logout.jsp">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

</div>

</body>
</html>
