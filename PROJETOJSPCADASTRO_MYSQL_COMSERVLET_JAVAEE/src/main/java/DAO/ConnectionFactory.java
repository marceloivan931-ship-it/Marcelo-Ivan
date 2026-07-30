package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Registra o driver
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/exemplo_db", "root", "klix26");
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
    }
}