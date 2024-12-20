package dao;

import beans.Utilisateur;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDao {
    // Constantes pour les requêtes SQL 
    private static final String TABLE = "utilisateurs";
    private static final String COLONNE_ID = "id";
    private static final String COLONNE_NOM = "nom";  
    private static final String COLONNE_PRENOM = "prenom";
    private static final String COLONNE_LOGIN = "login";
    private static final String COLONNE_PASSWORD = "password";

    // Requêtes SQL préparées
    private static final String SELECT_ALL = 
        "SELECT " + COLONNE_ID + ", " + COLONNE_NOM + ", " + 
        COLONNE_PRENOM + ", " + COLONNE_LOGIN + ", " + 
        COLONNE_PASSWORD + " FROM " + TABLE;

    private static final String SELECT_BY_ID = 
        SELECT_ALL + " WHERE " + COLONNE_ID + " = ?";

    private static final String INSERT = 
        "INSERT INTO " + TABLE + " (" + 
        COLONNE_NOM + ", " + COLONNE_PRENOM + ", " + 
        COLONNE_LOGIN + ", " + COLONNE_PASSWORD + 
        ") VALUES (?, ?, ?, ?)";

    private static final String UPDATE = 
        "UPDATE " + TABLE + " SET " + 
        COLONNE_NOM + " = ?, " +
        COLONNE_PRENOM + " = ?, " +
        COLONNE_LOGIN + " = ?, " +
        COLONNE_PASSWORD + " = ? WHERE " + COLONNE_ID + " = ?";

    private static final String DELETE = 
        "DELETE FROM " + TABLE + " WHERE " + COLONNE_ID + " = ?";

    // Méthode utilitaire pour mapper un ResultSet vers un objet Utilisateur
    private static Utilisateur mapResultSetToUser(ResultSet rs) throws SQLException {
        Utilisateur user = new Utilisateur();
        user.setId(rs.getInt(COLONNE_ID));
        user.setNom(rs.getString(COLONNE_NOM));
        user.setPrenom(rs.getString(COLONNE_PRENOM));
        user.setLogin(rs.getString(COLONNE_LOGIN));
        user.setPassword(rs.getString(COLONNE_PASSWORD));
        return user;
    }

    // Les méthodes CRUD
    public static ArrayList<Utilisateur> getUsers() {
    	ArrayList<Utilisateur> utilisateurs = new ArrayList<>();
        
        try (Connection conn = ConnectionManger.getInstance().getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SELECT_ALL)) {
            
            while (rs.next()) {
                utilisateurs.add(mapResultSetToUser(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return utilisateurs;
    }

    public static boolean addUser(Utilisateur user) {
        try (Connection conn = ConnectionManger.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT)) {
            
            pstmt.setString(1, user.getNom());
            pstmt.setString(2, user.getPrenom());
            pstmt.setString(3, user.getLogin());
            pstmt.setString(4, user.getPassword());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Utilisateur getUserById(int id) {
        try (Connection conn = ConnectionManger.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_BY_ID)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean updateUser(int id, Utilisateur user) {
        try (Connection conn = ConnectionManger.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE)) {
            
            pstmt.setString(1, user.getNom());
            pstmt.setString(2, user.getPrenom());
            pstmt.setString(3, user.getLogin());
            pstmt.setString(4, user.getPassword());
            pstmt.setInt(5, id);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deleteUser(int id) {
        try (Connection conn = ConnectionManger.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(DELETE)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}