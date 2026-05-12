/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Lab6.com;

/**
 *
 * @author Nazmi
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Lab6.com.Marathon;

public class Database {
    private static Connection myConnection = null;
    private static String myURL = "jdbc:mysql://localhost:3306/CSA3023";
    private int result = 0;

    public static Connection getConnection() throws ClassNotFoundException {
        if (myConnection != null) {
            return myConnection;
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "admin");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return myConnection;
    }

    public void closeConnection() throws ClassNotFoundException {
        try {
            myConnection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}