package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.model.User;

public class UserDao {

    public User checkLogin(String username, String password) {

        User user = null;
        
        try (Connection conn = DBConnection.getConnection()) {
            // SQL query to check username and password
            String sql = "SELECT * FROM login WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); 
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Retrieve user details if login is successful
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String role = rs.getString("role");
                
                // Create and return the User object
                user = new User(username, fname, lname, password, role);
            }
            
            rs.close();
            stmt.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
 // Check if a username is already taken
    public boolean isUsernameTaken(String username) {
        String query = "SELECT COUNT(*) FROM login WHERE username = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }

    // Register a new user
    public boolean registerUser(User user) {
        String query = "INSERT INTO login (username, fname, lname, password, role) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getFname());
            stmt.setString(3, user.getLname());
            stmt.setString(4, user.getPassword());  // You may want to hash the password here
            stmt.setString(5, user.getRole());
            
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
}
