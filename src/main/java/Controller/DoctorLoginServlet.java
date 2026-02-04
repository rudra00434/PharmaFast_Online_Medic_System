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
import model.Doctor;

public class DoctorLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Read form data
        String username = request.getParameter("username"); // email or phone
        String password = request.getParameter("password");

        try {
            // 2. DB connection
            Connection con = DBConnection.getConnection();

            // 3. Email OR phone based login
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM doctors WHERE (email = ? OR phone = ?) AND password = ?"
            );

            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // 4. Store doctor info in session using POJO
                Doctor doctor = new Doctor();
                doctor.setDoctorId(rs.getInt("id"));   // DB column = id
                doctor.setName(rs.getString("name"));
                doctor.setEmail(rs.getString("email"));
                doctor.setPhone(rs.getString("phone"));
                doctor.setSpecialization(rs.getString("specialization"));

                HttpSession session = request.getSession();
                session.setAttribute("doctor", doctor);

                // 5. Redirect to dashboard (JSP is in webapp)
                response.sendRedirect(
                        request.getContextPath() + "/doctorDashboard.jsp"
                );

            } else {
                // Invalid credentials
                response.sendRedirect(
                        request.getContextPath() +
                        "/doctorLogin.jsp?error=Invalid+Email/Phone+or+Password"
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath() +
                    "/doctorLogin.jsp?error=Server+Error"
            );
        }
    }
}
