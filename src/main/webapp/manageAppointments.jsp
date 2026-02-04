<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>
<%@ page import="model.Doctor" %>

<%
    Doctor doctor = (Doctor) session.getAttribute("doctor");
    if (doctor == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    int doctorId = doctor.getDoctorId();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Appointments | PharmFast</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            padding: 40px 20px;
            min-height: 100vh;
        }

        .page-header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: linear-gradient(135deg, #0a5c6b, #198754);
            color: white;
            padding: 14px;
            font-size: 14px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            font-size: 14px;
        }

        tr:hover {
            background-color: #f3f9fa;
        }

        .approve {
            background: linear-gradient(135deg, #198754, #0a5c6b);
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            margin-right: 6px;
        }

        .reject {
            background: linear-gradient(135deg, #dc3545, #b02a37);
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        .approve:hover,
        .reject:hover {
            opacity: 0.9;
        }

        .no-data {
            padding: 20px;
            font-weight: 600;
            color: #777;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="page-header">
    <h2>Manage Pending Appointments</h2>
    <p>Approve or reject patient appointment requests</p>
</div>

<div class="container">

<table>
<tr>
    <th>ID</th>
    <th>Patient</th>
    <th>Date</th>
    <th>Time</th>
    <th>Problem</th>
    <th>Action</th>
</tr>

<%
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT a.*, p.name FROM appointments a " +
        "JOIN patients p ON a.patient_id = p.patient_id " +
        "WHERE a.doctor_id = ? AND a.status = 'PENDING'"
    );
    ps.setInt(1, doctorId);
    ResultSet rs = ps.executeQuery();

    boolean found = false;
    while (rs.next()) {
        found = true;
%>
<tr>
    <td><%= rs.getInt("appointment_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getDate("appointment_date") %></td>
    <td><%= rs.getTime("appointment_time") %></td>
    <td><%= rs.getString("problem_description") %></td>
    <td>
        <form action="AppointmentActionServlet" method="post" style="display:inline;">
            <input type="hidden" name="appointment_id" value="<%= rs.getInt("appointment_id") %>">
            <input type="hidden" name="action" value="APPROVE">
            <input type="submit" value="Approve" class="approve">
        </form>

        <form action="AppointmentActionServlet" method="post" style="display:inline;">
            <input type="hidden" name="appointment_id" value="<%= rs.getInt("appointment_id") %>">
            <input type="hidden" name="action" value="REJECT">
            <input type="submit" value="Reject" class="reject">
        </form>
    </td>
</tr>
<%
    }

    if (!found) {
%>
<tr>
    <td colspan="6" class="no-data">No pending appointments</td>
</tr>
<%
    }

    rs.close();
    ps.close();
    con.close();
%>
</table>

</div>

</body>
</html>
