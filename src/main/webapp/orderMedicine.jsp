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
    int medicineId = Integer.parseInt(request.getParameter("medicine_id"));
    String medicineName = request.getParameter("medicine_name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    Connection con = null;
    PreparedStatement psSelect = null;
    PreparedStatement psInsert = null;
    PreparedStatement psUpdate = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnection();
        con.setAutoCommit(false); // 

        // 1. Get price and stock
        psSelect = con.prepareStatement(
            "SELECT price, stock FROM medicines WHERE medicine_id = ?"
        );
        psSelect.setInt(1, medicineId);
        rs = psSelect.executeQuery();

        if (!rs.next()) {
            out.println("Medicine not found");
            return;
        }

        double price = rs.getDouble("price");
        int stock = rs.getInt("stock");

        // 2. Validate stock
        if (stock < quantity) {
            out.println("Not enough stock available");
            return;
        }

        // 3. Calculate total price
        double totalPrice = price * quantity;

        // 4. Insert order
        psInsert = con.prepareStatement(
            "INSERT INTO orders (patient_id, medicine_id, medicine_name, quantity, price) VALUES (?,?,?,?,?)"
        );
        psInsert.setInt(1, patientId);
        psInsert.setInt(2, medicineId);
        psInsert.setString(3, medicineName);
        psInsert.setInt(4, quantity);
        psInsert.setDouble(5, totalPrice);

        psInsert.executeUpdate();

        // 5. Reduce stock
        psUpdate = con.prepareStatement(
            "UPDATE medicines SET stock = stock - ? WHERE medicine_id = ?"
        );
        psUpdate.setInt(1, quantity);
        psUpdate.setInt(2, medicineId);
        psUpdate.executeUpdate();

        con.commit(); //  COMMIT TRANSACTION

        response.sendRedirect("medicineOrderSuccess.jsp");

    } catch (Exception e) {
        if (con != null) {
            try { con.rollback(); } catch (Exception ex) {}
        }
        e.printStackTrace();
        out.println("Order failed");
    } finally {
        try {
            if (rs != null) rs.close();
            if (psSelect != null) psSelect.close();
            if (psInsert != null) psInsert.close();
            if (psUpdate != null) psUpdate.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
