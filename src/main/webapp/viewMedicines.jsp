<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>
<%@ page import="model.Patient" %>
<%@ page import="model.Doctor" %>

<%
    Patient patient = (Patient) session.getAttribute("patient");
    Doctor doctor   = (Doctor) session.getAttribute("doctor");
    Object admin    = session.getAttribute("admin");

    if (patient == null && doctor == null && admin == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    boolean isPatient = (patient != null);
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Medicines | PharmFast</title>

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

        .page-header h2 {
            margin: 0;
            font-weight: 700;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.25);
        }

        .search-box {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .search-box label {
            font-weight: 600;
        }

        input[type="text"] {
            width: 260px;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 8px 16px;
            background: linear-gradient(135deg, #0a5c6b, #198754);
            color: white;
            border: none;
            cursor: pointer;
            font-weight: 600;
            border-radius: 6px;
        }

        .reset-link {
            margin-left: 10px;
            text-decoration: none;
            font-weight: 600;
            color: #0a5c6b;
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
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        tr:hover {
            background-color: #f3f9fa;
        }

        .order-btn {
            padding: 6px 14px;
            background: linear-gradient(135deg, #0d6efd, #084298);
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            font-weight: 600;
        }

        .qty {
            width: 60px;
            padding: 6px;
            margin-right: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .out {
            color: red;
            font-weight: 700;
        }

        .disabled {
            color: #999;
            font-weight: 700;
        }

        .no-data {
            padding: 20px;
            font-weight: 600;
            color: #777;
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
    <h2>Available Medicines</h2>
    <p>Browse medicines and place orders securely</p>
</div>

<div class="container">

    <div class="search-box">
        <form method="get">
            <label>Search Medicine:</label>
            <input type="text" name="keyword" placeholder="Enter name or description">
            <input type="submit" value="Search">
            <a href="viewMedicines.jsp" class="reset-link">Reset</a>
        </form>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Action</th>
        </tr>

<%
    String keyword = request.getParameter("keyword");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnection();

        if (keyword != null && !keyword.trim().isEmpty()) {
            ps = con.prepareStatement(
                "SELECT * FROM medicines WHERE medicine_name LIKE ? OR description LIKE ?"
            );
            String value = "%" + keyword + "%";
            ps.setString(1, value);
            ps.setString(2, value);
        } else {
            ps = con.prepareStatement("SELECT * FROM medicines");
        }

        rs = ps.executeQuery();
        boolean found = false;

        while (rs.next()) {
            found = true;
            int stock = rs.getInt("stock");
%>
        <tr>
            <td><%= rs.getInt("medicine_id") %></td>
            <td><%= rs.getString("medicine_name") %></td>
            <td><%= rs.getString("description") %></td>
            <td>&#8377; <%= rs.getDouble("price") %></td>
            <td><%= stock %></td>

            <td>
                <% if (isPatient) { %>
                    <% if (stock > 0) { %>
                        <form action="orderMedicine.jsp" method="post">
                            <input type="number" name="quantity" class="qty"
                                   min="1" max="<%= stock %>" required>
                            <input type="hidden" name="medicine_id" value="<%= rs.getInt("medicine_id") %>">
                            <input type="hidden" name="medicine_name" value="<%= rs.getString("medicine_name") %>">
                            <input type="submit" value="Order" class="order-btn">
                        </form>
                    <% } else { %>
                        <span class="out">Out of Stock</span>
                    <% } %>
                <% } else { %>
                    <span class="disabled">View Only</span>
                <% } %>
            </td>
        </tr>
<%
        }

        if (!found) {
%>
        <tr>
            <td colspan="6" class="no-data">No medicines found</td>
        </tr>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <tr>
            <td colspan="6" class="no-data">Error loading medicines</td>
        </tr>
<%
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

    </table>

</div>

</body>
</html>
