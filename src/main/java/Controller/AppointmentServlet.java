package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.DBConnection;
import model.Patient;

public class AppointmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Patient patient = (Patient) session.getAttribute("patient");

        if (patient == null) {
            response.sendRedirect("patientLogin.jsp");
            return;
        }

        int patientId = patient.getPatientId();

        int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
        String dateStr = request.getParameter("appointment_date");
        String timeStr = request.getParameter("appointment_time");
        String problem = request.getParameter("problem_description");

        LocalDate appointmentDate = LocalDate.parse(dateStr);
        LocalTime appointmentTime = LocalTime.parse(timeStr);

        if (appointmentDate.isBefore(LocalDate.now())) {
            response.sendRedirect("bookAppointment.jsp?error=Invalid+date");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement checkPs = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();

            /* ================== ✅ SLOT AVAILABILITY CHECK (ADDED) ================== */
            String checkSql =
                "SELECT COUNT(*) FROM appointments " +
                "WHERE doctor_id = ? AND appointment_date = ? AND appointment_time = ? " +
                "AND status != 'REJECTED'";

            checkPs = con.prepareStatement(checkSql);
            checkPs.setInt(1, doctorId);
            checkPs.setDate(2, java.sql.Date.valueOf(appointmentDate));
            checkPs.setTime(3, java.sql.Time.valueOf(appointmentTime));

            rs = checkPs.executeQuery();
            rs.next();

            if (rs.getInt(1) > 0) {
                response.sendRedirect(
                    "bookAppointment.jsp?error=Selected+time+slot+is+already+booked"
                );
                return;
            }
            /* ================== ✅ SLOT CHECK ENDS ================== */

            String sql =
                "INSERT INTO appointments " +
                "(patient_id, doctor_id, appointment_date, appointment_time, problem_description) " +
                "VALUES (?, ?, ?, ?, ?)";

            ps = con.prepareStatement(sql);
            ps.setInt(1, patientId);
            ps.setInt(2, doctorId);
            ps.setDate(3, java.sql.Date.valueOf(appointmentDate));
            ps.setTime(4, java.sql.Time.valueOf(appointmentTime));
            ps.setString(5, problem);

            ps.executeUpdate();

            response.sendRedirect("appointmentSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookAppointment.jsp?error=Server+Error");
        } finally {
            try {
                if (rs != null) rs.close();
                if (checkPs != null) checkPs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
