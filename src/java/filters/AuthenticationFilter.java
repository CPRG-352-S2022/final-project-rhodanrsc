package filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Users;
import services.AccountService;

public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // before we can use HttpServletRequest or HttpServletResponse methods
        // we must cast the ServletRequest and ServletResponse objects as the correct type
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();
        AccountService as = new AccountService();
        String email = (String)session.getAttribute("email");
        boolean active = false;
        
        try {
            Users user = as.get(email);
            active = user.getActive();
        } catch (Exception ex) {
            Logger.getLogger(AuthenticationFilter.class.getName()).log(Level.SEVERE, null, ex);
        }

        if( email == null || !active){
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("login");
            return;
        }
        
        // any code before chain.doFilter
        // will be executed before the servlet
        chain.doFilter(request, response);
        // any code after chain.doFilter
        // will be executed after the servlet
        
    }

    // the init and destroy methods are not needed in this case
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

}
