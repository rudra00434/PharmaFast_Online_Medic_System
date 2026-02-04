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
import model.Doctor;

public class AppointmentActionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Doctor session validation
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("doctor") == null) {
            response.sendRedirect("doctorLogin.jsp");
            return;
        }

        // 2. Read data
        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
        String action = request.getParameter("action"); // APPROVE / REJECT

        // 3. Validate action
        if (!"APPROVE".equals(action) && !"REJECT".equals(action)) {
            response.sendRedirect("doctorViewAppointments.jsp?error=InvalidAction");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();

            ps = con.prepareStatement(
                "UPDATE appointments SET status = ? WHERE appointment_id = ?"
            );

            ps.setString(1, action);
            ps.setInt(2, appointmentId);

            ps.executeUpdate();

            // 4. Redirect back to appointment list
            response.sendRedirect("viewAppointments.jsp?msg=Updated");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewAppointments.jsp?error=ServerError");

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
