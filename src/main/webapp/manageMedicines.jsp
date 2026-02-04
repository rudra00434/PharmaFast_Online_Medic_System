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
    <title>Stock Management</title>

    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #e6f2f5, #f4f6f8);
            padding: 40px;
        }

        h2 {
            color: #003d4d;
            margin-bottom: 25px;
        }

        /* ===== TABLE ===== */
        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            margin-bottom: 50px;
        }

        th {
            background: linear-gradient(135deg, #003d4d, #0a5c6b);
            color: white;
            padding: 14px;
            font-size: 14px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e0e0e0;
            text-align: center;
            font-size: 14px;
        }

        tr:hover {
            background: #f7fbfc;
        }

        .low {
            color: #dc3545;
            font-weight: 700;
        }

        input[type=number] {
            width: 80px;
            padding: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .btn {
            padding: 7px 14px;
            background: linear-gradient(135deg, #0a5c6b, #003d4d);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.25);
        }

        /* ===== ADD MEDICINE CARD ===== */
        .add-card {
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.18);
            max-width: 750px;
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .add-card h3 {
            margin-bottom: 25px;
            color: #003d4d;
            font-weight: 700;
            text-align: center;
        }

        .add-card label {
            font-weight: 600;
            display: block;
            margin-top: 16px;
            color: #333;
        }

        .add-card input,
        .add-card textarea {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: border 0.2s ease, box-shadow 0.2s ease;
        }

        .add-card input:focus,
        .add-card textarea:focus {
            outline: none;
            border-color: #0a5c6b;
            box-shadow: 0 0 0 3px rgba(10,92,107,0.15);
        }

        .add-card textarea {
            resize: none;
        }

        .btn-add {
            margin-top: 30px;
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #198754, #0a5c6b);
            color: white;
            border: none;
            font-size: 16px;
            font-weight: 700;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        }
    </style>
</head>

<body>

<h2>Medicine Stock Management</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Current Stock</th>
    <th>Add Stock</th>
    <th>Action</th>
</tr>

<%
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM medicines");
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        int stock = rs.getInt("stock");
%>
<tr>
    <td><%= rs.getInt("medicine_id") %></td>
    <td><%= rs.getString("medicine_name") %></td>
    <td><%= rs.getDouble("price") %></td>
    <td class="<%= stock < 20 ? "low" : "" %>">
        <%= stock %>
        <%= stock < 20 ? " (Low)" : "" %>
    </td>

    <td>
        <form action="UpdateStockServlet" method="post">
            <input type="number" name="add_stock" min="1" required>
            <input type="hidden" name="medicine_id" value="<%= rs.getInt("medicine_id") %>">
    </td>

    <td>
            <input type="submit" value="Update" class="btn">
        </form>
    </td>
</tr>
<%
    }
    rs.close();
    ps.close();
    con.close();
%>

</table>

<!-- ===== ADD NEW MEDICINE ===== -->

<div class="add-card">
    <h3>Add New Medicine</h3>

    <form action="AddMedicineServlet" method="post">

        <label>Medicine Name</label>
        <input type="text" name="medicine_name" required>

        <label>Description</label>
        <textarea name="description" rows="3"></textarea>

        <label>Price</label>
        <input type="number" step="0.01" name="price" required>

        <label>Initial Stock</label>
        <input type="number" name="stock" min="0" required>

        <input type="submit" value="Add Medicine" class="btn-add">
    </form>
</div>

</body>
</html>
