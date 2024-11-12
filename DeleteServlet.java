package Delete;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // JDBC connection parameters
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/room";
    static final String USER = "root";
    static final String PASS = "Nethmi_th24";

    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;
        PreparedStatement stmt = null;

        // Validate and parse input
        try {
        	//throw ClassNotFoundException
            Class.forName(JDBC_DRIVER);
            //throw SQLException
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "DELETE FROM room WHERE ID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            
            // Execute query
            int rowsAffected = stmt.executeUpdate();
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\"CSS/styles.css\">"); 
            out.println("</head>");
            out.println("<body>");
                            
            out.println("<div class='message-box'>");
            if (rowsAffected > 0) {
                out.println("<h3>Room Deleted Successfully!</h3>");
                out.println("<form action='ReadServlet' method='POST'>");
                out.println("<button type='submit'>View Room List</button>");
                out.println("</form>");
            } else {
                out.println("<h3>Failed to add the room.</h3>");
            }
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");
            
        } catch (SQLException | ClassNotFoundException e) { //Check Exception and Catch them
            throw new ServletException("Database error", e);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new ServletException("Database error", e);
            }
        }
    }
}