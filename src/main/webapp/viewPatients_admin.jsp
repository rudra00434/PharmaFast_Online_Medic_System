<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Patients (Admin) | PharmFast</title>

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
            margin-bottom: 25px;
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
            background: #f8f9fa;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }

        .search-box input[type="text"] {
            width: 300px;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .search-box input[type="submit"] {
            padding: 8px 16px;
            background: #0a5c6b;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: linear-gradient(135deg, #0a5c6b, #198754);
            color: white;
            padding: 14px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f3f9fa;
        }

        .no-data {
            padding: 20px;
            font-weight: 600;
            color: #777;
        }

        .back {
            margin-top: 30px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            font-weight: 600;
            color: white;
            background: linear-gradient(135deg, #0a5c6b, #198754);
            padding: 10px 20px;
            border-radius: 8px;
        }
    </style>
</head>

<body>

<div class="page-header">
    <h2>Registered Patients</h2>
    <p>Administrative patient records</p>
</div>

<div class="container">

    <!-- SEARCH -->
    <div class="search-box">
        <form method="get">
            <label><b>Search Patient:</b></label>
            <input type="text" name="keyword" placeholder="Name / Email / Phone">
            <input type="submit" value="Search">
            <a href="viewPatients_admin.jsp" style="margin-left:15px;">Reset</a>
        </form>
    </div>

    <table>
        <tr>
            <th>Patient ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
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
                "SELECT patient_id, name, email, phone FROM patients " +
                "WHERE name LIKE ? OR email LIKE ? OR phone LIKE ?"
            );
            String value = "%" + keyword + "%";
            ps.setString(1, value);
            ps.setString(2, value);
            ps.setString(3, value);
        } else {
            ps = con.prepareStatement(
                "SELECT patient_id, name, email, phone FROM patients"
            );
        }

        rs = ps.executeQuery();
        boolean found = false;

        while (rs.next()) {
            found = true;
%>
        <tr>
            <td><%= rs.getInt("patient_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phone") %></td>
        </tr>
<%
        }

        if (!found) {
%>
        <tr>
            <td colspan="4" class="no-data">No patients found</td>
        </tr>
<%
        }

    } catch (Exception e) {
%>
        <tr>
            <td colspan="4" class="no-data">Error loading patients</td>
        </tr>
<%
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

    </table>

    <div class="back">
        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </div>

</div>

</body>
</html>
