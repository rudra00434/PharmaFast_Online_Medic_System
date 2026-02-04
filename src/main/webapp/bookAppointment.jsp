<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>
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
    <title>Book Appointment</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #003b44, #0a5c6b);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 500px;
            background: #ffffff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #003b44;
        }

        label {
            font-weight: 600;
            margin-top: 14px;
            display: block;
            color: #333;
        }

        select, input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        textarea {
            resize: none;
        }

        .btn-submit {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background: #0a5c6b;
            color: white;
            border: none;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background: #084d59;
        }

        .back {
            margin-top: 18px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #0a5c6b;
            font-weight: 600;
        }

        .msg-success {
            background: #d1e7dd;
            color: #0f5132;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .msg-error {
            background: #f8d7da;
            color: #842029;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Book Appointment</h2>

    <% if (request.getParameter("msg") != null) { %>
        <div class="msg-success">
            Your appointment has been booked successfully
        </div>
    <% } %>

    <% if (request.getParameter("error") != null) { %>
        <div class="msg-error">
            <%= request.getParameter("error") %>
        </div>
    <% } %>

    <form action="AppointmentServlet" method="post">

        <label>Select Doctor</label>
        <select name="doctor_id" required>
            <option value="">-- Select Doctor --</option>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    con = DBConnection.getConnection();
                    ps = con.prepareStatement(
                        "SELECT id, name, specialization FROM doctors"
                    );
                    rs = ps.executeQuery();

                    while (rs.next()) {
            %>
                <option value="<%= rs.getInt("id") %>">
                    Dr. <%= rs.getString("name") %> 
                    (<%= rs.getString("specialization") %>)
                </option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </select>

        <label>Appointment Date</label>
        <input type="date" name="appointment_date" required>

        <label>Appointment Time</label>
        <input type="time" name="appointment_time" required>

        <label>Problem Description</label>
        <textarea name="problem_description" rows="4"
                  placeholder="Describe your problem briefly"></textarea>

        <input type="submit" value="Book Appointment" class="btn-submit">
    </form>

    <div class="back">
        <a href="patientDashboard.jsp">Back to Dashboard</a>
    </div>
</div>

</body>
</html> 