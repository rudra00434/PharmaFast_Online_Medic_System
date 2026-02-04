<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>

<%
    // Admin session check
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String search = request.getParameter("search");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Doctors</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f4f6f8;
        }

        .header {
            background: linear-gradient(135deg, #003b44, #0a5c6b);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        h2 {
            margin-bottom: 20px;
            color: #003b44;
            text-align: center;
        }

        .search-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-box input {
            width: 300px;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-box button {
            padding: 8px 15px;
            background-color: #198754;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #0a5c6b;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .back {
            margin-top: 20px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #198754;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>Admin Panel</h1>
    <p>Doctor List</p>
</div>

<div class="container">
    <h2>Registered Doctors</h2>

    
    <div class="search-box">
        <form method="get">
            <input type="text" name="search" placeholder="Search by name, email, phone or specialization"
                   value="<%= (search != null) ? search : "" %>">
            <button type="submit">Search</button>
        </form>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Specialization</th>
        </tr>

        <%
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps;

                if (search != null && !search.trim().isEmpty()) {
                    ps = con.prepareStatement(
                        "SELECT * FROM doctors WHERE name LIKE ? OR email LIKE ? OR phone LIKE ? OR specialization LIKE ?"
                    );
                    String q = "%" + search + "%";
                    ps.setString(1, q);
                    ps.setString(2, q);
                    ps.setString(3, q);
                    ps.setString(4, q);
                } else {
                    ps = con.prepareStatement("SELECT * FROM doctors");
                }

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("specialization") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error loading doctors</td></tr>");
            }
        %>
    </table>

    <div class="back">
        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</div>

</body>
</html>