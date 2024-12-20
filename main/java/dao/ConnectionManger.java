package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManger {
    private static final String URL = "jdbc:mysql://localhost:3306/gesusers";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    private static ConnectionManger instance;
    private Connection connection;
    
    private ConnectionManger() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("Driver MySQL introuvable: " + e.getMessage());
        }
    }
    
    public static ConnectionManger getInstance() {
        if (instance == null) {
            instance = new ConnectionManger();
        }
        return instance;
    }
    
    public Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return connection;
    }
    
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                System.err.println("Erreur lors de la fermeture de la connexion: " + e.getMessage());
            }
        }
    }
}
