package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            // 1. Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 2. Create Connection
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/online_medic_system", // DB name
                "root",   
                "rudranil123" 
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}