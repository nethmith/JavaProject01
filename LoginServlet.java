package user.webpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.UserDao;
import user.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        User user = userDao.checkLogin(username, password);
        
        String destPage = "login.jsp";
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            String role = user.getRole();
            if ("client".equals(role)) {
                destPage = "clientDashboard.jsp";
            } else if ("roomadmin".equals(role)) {
                destPage = "viewAll.jsp";
            } else if ("announceadmin".equals(role)) {
                destPage = "viewAll.jsp";
            }
        } else {
            String message = "Invalid username/password";
            request.setAttribute("message", message);
        }
        
        request.getRequestDispatcher(destPage).forward(request, response);
    }
}
