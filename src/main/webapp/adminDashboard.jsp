<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .box {
            background: white;
            padding: 40px;
            width: 420px;
            border-radius: 14px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
            text-align: center;
        }

        .box h2 {
            margin-bottom: 30px;
            color: #003d4d;
            font-weight: 700;
        }

        .dashboard-link {
            display: block;
            margin: 15px 0;
            padding: 14px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            color: white;
            background: linear-gradient(135deg, #0a5c6b, #198754);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .dashboard-link:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        .logout {
            background: linear-gradient(135deg, #dc3545, #b02a37);
        }

        .subtitle {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>Admin Dashboard</h2>
    <div class="subtitle">System Control Panel</div>

    <a href="viewPatients_admin.jsp" class="dashboard-link">View Patients</a>
    <a href="viewDoctors.jsp" class="dashboard-link">View Doctors</a>
    <a href="viewMedicines.jsp" class="dashboard-link">View Medicines</a>

  
    <a href="manageMedicines.jsp" class="dashboard-link">Manage Stock</a>

    <a href="logout.jsp" class="dashboard-link logout">Logout</a>
</div>

</body>
</html>
