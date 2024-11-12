package Read;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Model.Room;

import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ReadServlet")
public class ReadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // JDBC connection parameters
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/room";
    static final String USER = "root";
    static final String PASS = "Nethmi_th24";
    
    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<Room> rooms = new ArrayList<>();
        
        // Validate and parse input
        try {
        	// throw ClassNotFoundException
            Class.forName(JDBC_DRIVER);
            // throw SQLException
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "SELECT * FROM room.room";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            
            while (rs.next()) {
                int id = rs.getInt("ID");
                String roomType = rs.getString("RoomType");
                double price = rs.getDouble("Price");
                int capacity = rs.getInt("Capacity");
                Room room = new Room(id,roomType, price , capacity);
                rooms.add(room);
            }

            request.setAttribute("rooms", rooms);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Read.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException e) { //Check Exception and Catch them
            throw new ServletException("Database error", e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new ServletException("Database error", e);
            }
        }
    }
}

