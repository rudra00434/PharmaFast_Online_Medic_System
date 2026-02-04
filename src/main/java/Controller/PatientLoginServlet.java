package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.DBConnection;
import model.Patient;

public class PatientLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();

            ps = con.prepareStatement(
                "SELECT * FROM patients WHERE (email = ? OR phone = ?) AND password = ?"
            );

            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);

            rs = ps.executeQuery();

            if (rs.next()) {

                Patient patient = new Patient();
                patient.setPatientId(rs.getInt("patient_id")); // ✅ FIXED
                patient.setName(rs.getString("name"));
                patient.setEmail(rs.getString("email"));
                patient.setPhone(rs.getString("phone"));

                HttpSession session = request.getSession();
                session.setAttribute("patient", patient);

                // ✅ SUCCESS REDIRECT
                response.sendRedirect(
                    request.getContextPath() + "/patientDashboard.jsp"
                );

            } else {
                response.sendRedirect(
                    request.getContextPath() +
                    "/patientLogin.jsp?error=Invalid+Email+or+Password"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(
                request.getContextPath() +
                "/patientLogin.jsp?error=Server+Error"
            );
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
