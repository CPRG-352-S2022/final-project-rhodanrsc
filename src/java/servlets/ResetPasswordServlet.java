
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.AccountService;

public class ResetPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String uuid = request.getParameter("uuid");
        
        if (uuid != null) {
            session.setAttribute("reset_password_uuid", uuid);
            getServletContext().getRequestDispatcher("/WEB-INF/resetNewPassword.jsp").forward(request, response);
            return;
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/forgotPassword.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountService as = new AccountService();
        String email = request.getParameter("resetEmail");
        String path = getServletContext().getRealPath("/WEB-INF");
        String url = request.getRequestURL().toString();
        String action = request.getParameter("action");
        String uuid = request.getParameter("uuid");
        
        if (email != null) {
            session.setAttribute("email", email);
        }
        
        if (email != null) {
            as.resetPassword(email, path, url);
        }
        if (action != null && action.equals("resetPass") && uuid != null) {
            email = (String) session.getAttribute("email");
            String password = request.getParameter("newPass");
            as.changePassword(uuid, password, email);

            request.setAttribute("message", "Password reset successfully.");
            response.sendRedirect("login");
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
    }
}
