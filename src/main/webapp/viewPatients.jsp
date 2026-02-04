<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>
<%@ page import="model.Doctor" %>

<%
    Doctor doctor = (Doctor) session.getAttribute("doctor");
    if (doctor == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Patients | PharmFast</title>

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
    <h2>Registered Patients</h2>
    <p>View and search patient records</p>
</div>

<div class="container">

    <!-- SEARCH BOX -->
    <div class="search-box">
        <form method="get">
            <label>Search by Name / Email / Phone:</label>
            <input type="text" name="keyword" placeholder="Enter keyword">
            <input type="submit" value="Search">
            <a href="viewPatients.jsp" class="reset-link">Reset</a>
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
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

    </table>

</div>

</body>
</html>
