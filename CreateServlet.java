package Create;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String roomType = request.getParameter("roomType");
        String priceParam = request.getParameter("price");
        String capacityParam = request.getParameter("capacity");
        
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Validate and parse input
        try {
        	//throw NumberFormatException
            double price = Double.parseDouble(priceParam);
            int capacity = Integer.parseInt(capacityParam);
            
            // Database connection
            try {
            	// throw ClassNotFoundException
                Class.forName("com.mysql.cj.jdbc.Driver");
                // throw SQLException
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/room", "root", "Nethmi_th24"); 
                
                // SQL query
                String sql = "INSERT INTO room (RoomType, Price, Capacity) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, roomType);
                stmt.setDouble(2, price);
                stmt.setInt(3, capacity);
                
                // Execute query
                int rowsAffected = stmt.executeUpdate();
                
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\"CSS/styles.css\">"); 
                out.println("</head>");
                out.println("<body>");
                                
                out.println("<div class='message-box'>");
                if (rowsAffected > 0) {
                    out.println("<h3>Room Added Successfully!</h3>");
                    out.println("<form action='ReadServlet' method='POST'>");
                    out.println("<button type='submit'>View Room List</button>");
                    out.println("</form>");
                } else {
                    out.println("<h3>Failed to add the room.</h3>");
                }
                out.println("</div>");

                out.println("</body>");
                out.println("</html>");
                
                // Close resources
                stmt.close();
                conn.close();
            } catch (ClassNotFoundException | SQLException e) { //Check Exception and Catch them
                e.printStackTrace();
                out.println("<h3>Database connection failed: " + e.getMessage() + "</h3>");
            }
        } catch (NumberFormatException e) {
            out.println("<h3>Invalid input: Price and Capacity must be numbers.</h3>");
        } finally {
            out.close();
        }
    }
}
