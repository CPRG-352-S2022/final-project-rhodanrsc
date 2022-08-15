
package servlets;

import dataaccess.UserDB;
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

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountService as = new AccountService();

        String uuid = request.getParameter("uuid");
        String email = (String) session.getAttribute("email");
        
        if (uuid != null) {
            as.changeActive(uuid, email);
            getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request, response);
            return;
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/registration.jsp").forward(request, response);
            return;
        }
    }   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        AccountService as = new AccountService();
        String url = request.getRequestURL().toString();
        session.setAttribute("email", request.getParameter("registerEmail"));
        String path = getServletContext().getRealPath("/WEB-INF");
        
        try {
            switch (action) {
                case "Submit":  
                    String email = (String) session.getAttribute("email");
                    String password = request.getParameter("registerPassword");
                    String first = request.getParameter("registerFirstName");
                    String last = request.getParameter("registerLastName");

                    as.insert(password, email, first, last, false, 2);
                    as.register(email, path, url);
                    break;
                default:
                    break;
            }
            if (action.equals("Submit")) {
                
            }
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        } catch (Exception e) {
        }
        
        String email = (String) session.getAttribute("email");
        
        as.register(email, path, url);
        
        getServletContext().getRequestDispatcher("/WEB-INF/registration.jsp").forward(request, response);
        return;
    }
}
