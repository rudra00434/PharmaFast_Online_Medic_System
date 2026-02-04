package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.DBConnection;

public class UpdateStockServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        int medicineId = Integer.parseInt(request.getParameter("medicine_id"));
        int addStock = Integer.parseInt(request.getParameter("add_stock"));

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE medicines SET stock = stock + ? WHERE medicine_id = ?"
            );

            ps.setInt(1, addStock);
            ps.setInt(2, medicineId);
            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("manageMedicines.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageMedicines.jsp");
        }
    }
}
