<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>
<%@ page import="model.Patient" %>

<%
    Patient patient = (Patient) session.getAttribute("patient");
    if (patient == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }

    int patientId = patient.getPatientId();
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Appointments</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            padding: 40px;
            min-height: 100vh;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        h2 {
            margin-bottom: 25px;
            color: #003d4d;
            font-weight: 700;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 12px;
            border-bottom: 1px solid #e0e0e0;
            text-align: center;
            font-size: 14px;
        }

        th {
            background: linear-gradient(135deg, #0a5c6b, #198754);
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background: #f8f9fa;
        }

        .pending { color: #fd7e14; font-weight: 700; }
        .approved { color: #198754; font-weight: 700; }
        .rejected { color: #dc3545; font-weight: 700; }

        .call-btn {
            background: linear-gradient(135deg, #198754, #0a5c6b);
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            font-size: 13px;
        }

        .disabled {
            color: #999;
            font-weight: 600;
        }

        .back {
            margin-top: 30px;
            text-align: right;
        }

        .back a {
            text-decoration: none;
            font-weight: 600;
            color: white;
            background: linear-gradient(135deg, #0a5c6b, #003d4d);
            padding: 10px 20px;
            border-radius: 8px;
        }

        .empty-row {
            font-weight: 600;
            color: #666;
        }
    </style>
</head>

<body>

<div class="container">

<h2>My Appointment Status</h2>

<table>
<tr>
    <th>Appointment ID</th>
    <th>Doctor</th>
    <th>Date</th>
    <th>Time</th>
    <th>Problem</th>
    <th>Status</th>
    <th>Join Call</th>
</tr>

<%
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT a.*, d.name AS doctor_name " +
        "FROM appointments a " +
        "JOIN doctors d ON a.doctor_id = d.id " +
        "WHERE a.patient_id = ? " +
        "ORDER BY a.appointment_date DESC"
    );
    ps.setInt(1, patientId);

    ResultSet rs = ps.executeQuery();
    boolean found = false;

    while (rs.next()) {
        found = true;
        String status = rs.getString("status");
        int appointmentId = rs.getInt("appointment_id");
%>
<tr>
    <td><%= appointmentId %></td>
    <td><%= rs.getString("doctor_name") %></td>
    <td><%= rs.getDate("appointment_date") %></td>
    <td><%= rs.getTime("appointment_time") %></td>
    <td><%= rs.getString("problem_description") %></td>
    <td class="<%= status.toLowerCase() %>"><%= status %></td>

    <td>
        <% if ("APPROVE".equalsIgnoreCase(status)) { %>
            <a href="<%= request.getContextPath() %>/videoConsultation.jsp?room=APPT_<%= appointmentId %>"
              class="call-btn">
               Join Call
             </a>
            
        <% } else { %>
            <span class="disabled">Not Available</span>
        <% } %>
    </td>
</tr>
<%
    }

    if (!found) {
%>
<tr>
    <td colspan="7" class="empty-row">No appointments found</td>
</tr>
<%
    }

    rs.close();
    ps.close();
    con.close();
%>

</table>

<div class="back">
    <a href="patientDashboard.jsp">Back to Dashboard</a>
</div>

</div>

</body>
</html>
