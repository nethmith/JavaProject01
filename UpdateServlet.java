package Update;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET requests to the login page
        response.sendRedirect("Update.jsp");
    }

    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String roomType = request.getParameter("roomType");
        String priceStr = request.getParameter("price");
        String capacityStr = request.getParameter("capacity");

        // Validate input
        if (idStr == null || idStr.trim().isEmpty() ||
            roomType == null || roomType.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty() ||
            capacityStr == null || capacityStr.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("Update.jsp").forward(request, response);
            return;
        }

        int id, capacity;
        double price;

        try {
        	// throw NumberFormatException
            id = Integer.parseInt(idStr);
            price = Double.parseDouble(priceStr);
            capacity = Integer.parseInt(capacityStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format. Please enter valid numbers.");
            request.getRequestDispatcher("Update.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            //throw ClassNotFoundException
        	Class.forName("com.mysql.cj.jdbc.Driver");
            //throw SQLException
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/room", "root", "Nethmi_th24");
         
            
            String sql = "UPDATE room SET RoomType = ?, Price = ?, Capacity = ? WHERE ID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, roomType);
            stmt.setDouble(2, price);
            stmt.setInt(3, capacity);
            stmt.setInt(4, id);

            // Execute query
            int rowsAffected = stmt.executeUpdate();
            
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\"CSS/styles.css\">"); 
            out.println("</head>");
            out.println("<body>");
                            
            out.println("<div class='message-box'>");
            if (rowsAffected > 0) {
                out.println("<h3>Room Updated Successfully!</h3>");
                out.println("<form action='ReadServlet' method='POST'>");
                out.println("<button type='submit'>View Room List</button>");
                out.println("</form>");
            } else {
                out.println("<h3>Failed to add the room.</h3>");
            }
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h3>An error occurred.</h3>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}