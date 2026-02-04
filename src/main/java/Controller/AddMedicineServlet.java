package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.DBConnection;

public class AddMedicineServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Admin session check (same pattern as your other admin servlets)
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        // ✅ Read form parameters (matches JSP names EXACTLY)
        String medicineName = request.getParameter("medicine_name");
        String description  = request.getParameter("description");
        String priceStr     = request.getParameter("price");
        String stockStr     = request.getParameter("stock");

        // Basic safety validation
        if (medicineName == null || priceStr == null || stockStr == null ||
            medicineName.trim().isEmpty()) {
            response.sendRedirect("manageMedicines.jsp");
            return;
        }

        double price = Double.parseDouble(priceStr);
        int stock = Integer.parseInt(stockStr);

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();

            String sql =
                "INSERT INTO medicines (medicine_name, description, price, stock) " +
                "VALUES (?, ?, ?, ?)";

            ps = con.prepareStatement(sql);
            ps.setString(1, medicineName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, stock);

            ps.executeUpdate();

            // ✅ Redirect back to stock page (no UI break)
            response.sendRedirect("manageMedicines.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageMedicines.jsp");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
