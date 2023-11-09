package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect {
    private static Connection con;
    
    public static Connection getConnection() {
        try {
           
                Class.forName("com.mysql.cj.jdbc.Driver");
                try {
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebookapp", "root", "1234");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            
        } catch (ClassNotFoundException e) {
            // Handle class loading exception
            e.printStackTrace();
        }
        return con;
    }
    
}
