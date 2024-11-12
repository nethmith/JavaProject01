package user.webpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserDao;
import user.model.User;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the form input values
        String username = request.getParameter("username");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String password = request.getParameter("password");
        String role = "client";

        // Create a UserDao object to handle DB operations
        UserDao userDao = new UserDao();
        
        // Check if the username already exists
        if (userDao.isUsernameTaken(username)) {
        	String message = "Username already taken";
            request.setAttribute("message", message);
            
            request.setAttribute("error", "Username already taken!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Create a new User object
        User user = new User(username, fname, lname, password, role);
        
        // Insert the user into the database
        boolean success = userDao.registerUser(user);
        
        if (success) {
            response.sendRedirect("login.jsp");  // Redirect to login page upon successful signup
        } else {
            request.setAttribute("error", "Signup failed. Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
