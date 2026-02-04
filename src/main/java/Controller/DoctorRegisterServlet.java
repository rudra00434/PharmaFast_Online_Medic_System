package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.DBConnection;

public class DoctorRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String specialization = request.getParameter("specialization");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO doctors (name,email,phone,specialization,password) VALUES (?,?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, specialization);
            ps.setString(5, password);

            ps.executeUpdate();

            // SUCCESS
            response.sendRedirect(
                request.getContextPath() +
                "/doctorRegister.jsp?success=Registered+Successfully"
            );

        } catch (SQLException e) {

            // ✅ DUPLICATE EMAIL OR PHONE
            if (e.getMessage().contains("Duplicate entry")) {
                response.sendRedirect(
                    request.getContextPath() +
                    "/doctorRegister.jsp?error=Email+or+Phone+already+exists"
                );
            } else {
                // OTHER DB ERROR
                e.printStackTrace();
                response.sendRedirect(
                    request.getContextPath() +
                    "/doctorRegister.jsp?error=Database+Error"
                );
            }
        }
    }
}
