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

    int patientId = patient.getPatientId();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Order History | PharmFast</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .page-header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }

        .page-header h2 {
            margin: 0;
            font-weight: 700;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            color: white;
            padding: 14px;
            font-size: 14px;
            text-transform: uppercase;
        }

        td {
            padding: 12px;
            text-align: center;
            font-size: 14px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f3f9fa;
        }

        .no-data {
            font-weight: 600;
            color: #888;
            padding: 20px;
        }

        .back {
            margin-top: 30px;
            text-align: right;
        }

        .back a {
            text-decoration: none;
            font-weight: 600;
            color: white;
            background: linear-gradient(135deg, #0a5c6b, #198754);
            padding: 10px 18px;
            border-radius: 8px;
            transition: box-shadow 0.2s ease;
        }

        .back a:hover {
            box-shadow: 0 6px 18px rgba(0,0,0,0.25);
        }

        @media (max-width: 768px) {
            table {
                font-size: 13px;
            }
            th, td {
                padding: 10px;
            }
        }
    </style>
</head>

<body>

<div class="page-header">
    <h2>Your Order History</h2>
    <p>Track all your medicine orders in one place</p>
</div>

<div class="container">

    <table>
        <tr>
            <th>Order ID</th>
            <th>Medicine Name</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Order Date</th>
        </tr>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnection();
        ps = con.prepareStatement(
            "SELECT order_id, medicine_name, quantity, price, order_date " +
            "FROM orders WHERE patient_id = ? ORDER BY order_date DESC"
        );
        ps.setInt(1, patientId);

        rs = ps.executeQuery();
        boolean found = false;

        while (rs.next()) {
            found = true;
%>
        <tr>
            <td><%= rs.getInt("order_id") %></td>
            <td><%= rs.getString("medicine_name") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>&#8377; <%= rs.getDouble("price") %></td>
            <td><%= rs.getTimestamp("order_date") %></td>
        </tr>
<%
        }

        if (!found) {
%>
        <tr>
            <td colspan="5" class="no-data">No orders found</td>
        </tr>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <tr>
            <td colspan="5" class="no-data">Error loading order history</td>
        </tr>
<%
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

    </table>

    <div class="back">
        <a href="patientDashboard.jsp">⬅ Back to Dashboard</a>
    </div>

</div>

</body>
</html>
