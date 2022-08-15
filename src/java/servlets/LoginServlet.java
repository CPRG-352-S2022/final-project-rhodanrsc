
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Role;
import models.Users;
import services.AccountService;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String param = request.getQueryString();
        
        if (param != null && param.contains("logout")) {
            session.invalidate();
        } else if (param != null && param.contains("register")) {
            response.sendRedirect("register");
            return;
        } else if (param != null && param.contains("forgot")) {
            response.sendRedirect("reset");
            return;
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String path = getServletContext().getRealPath("/WEB-INF");
        
        AccountService as = new AccountService();
        Users user = as.login(email, password, path);

        if (user == null || !user.getActive()) {
            request.setAttribute("message", "Login failed. Please try again.");
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        
        session.setAttribute("email", email);
        
        Role role = user.getRole();
        int roleID = role.getRoleId();
        
        if (roleID == 1) {
            response.sendRedirect("admin");
        } else {
            response.sendRedirect("inventory");
        }
    }
}
