package servlets;

import dataaccess.CategoriesDB;
import dataaccess.RoleDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Categories;
import models.Items;
import models.Role;
import models.Users;
import services.AccountService;
import services.InventoryService;

public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountService as = new AccountService();
        InventoryService is = new InventoryService();
        String param = request.getQueryString();
        RoleDB rdb = new RoleDB();
        CategoriesDB cdb = new CategoriesDB();
       
        try {
            if (param != null && param.contains("category")) {
                List<Categories> categories = is.getAllCats();
                session.setAttribute("categories", categories);
                getServletContext().getRequestDispatcher("/WEB-INF/categories.jsp").forward(request,response);
                return;
            } else if (param != null && param.contains("save")) {
                
            } else if (param != null && param.contains("edit")) {
                int categoryID = Integer.parseInt(request.getParameter("catID"));
                session.setAttribute("catID", categoryID);
                
                Categories category = cdb.get(categoryID);
                
                request.setAttribute("editCat", category);
                
                List<Categories> categories = is.getAllCats();
                session.setAttribute("categories", categories);
                
                getServletContext().getRequestDispatcher("/WEB-INF/categories.jsp").forward(request,response);
                return;
            } else if (param != null && param.contains("add")) {
                String categoryName = request.getParameter("addCatName");
                
                is.insertCat(categoryName);
                
                List<Categories> categories = is.getAllCats();
                session.setAttribute("categories", categories);
                
                getServletContext().getRequestDispatcher("/WEB-INF/categories.jsp").forward(request,response);
                return;
            }
            List<Users> usersList = as.getAll();
            session.setAttribute("users", usersList);
            List<Role> roles = rdb.getAll();
            session.setAttribute("roles", roles);
        } catch (Exception ex) {
            Logger.getLogger(InventoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request,response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountService as = new AccountService();
        InventoryService is = new InventoryService();
        RoleDB rdb = new RoleDB();
        
        String action;
        
        try {
            if (request.getParameter("action") != null) {
                action = request.getParameter("action");
                String username;
                switch (action) {
                    case "delete":
                        username = request.getParameter("usernameDel");
                        String loggedin = (String) session.getAttribute("username");
                        if (!username.equals(loggedin)) {
                            as.delete(username);
                            request.setAttribute("message", "User " + username + " has been deleted.");
                        } else {
                            request.setAttribute("message", "Cannot delete yourself.");
                        }
                       
                        break;
                    case "add":
                        username = request.getParameter("usernameAdd");
                        String password = request.getParameter("passwordAdd");
                        String email = request.getParameter("emailAdd");
                        String firstname = request.getParameter("firstnameAdd");
                        String lastname = request.getParameter("lastnameAdd");
                        String radio = request.getParameter("activeStatus");
                        boolean active = false;
                        if (radio.equals("active")) {
                            active = true;
                        }
                        int roleid = Integer.parseInt(request.getParameter("rolesSelect"));
                        as.insert(password, email, firstname, lastname, active, roleid);
                        request.setAttribute("message", "User " + firstname + " has been added.");
                        break;
                    case "edit":
                        username = request.getParameter("usernameEdit");
                        Users editUser = as.get(username);
                        request.setAttribute("editUser", editUser);
                        break;
                    case "save":
                        email = request.getParameter("emailEdit");
                        password = request.getParameter("passwordEdit");
                        firstname = request.getParameter("firstnameEdit");
                        lastname = request.getParameter("lastnameEdit");
                        radio = request.getParameter("activeStatus");
                        active = false;
                        if (radio.equals("active")) {
                            active = true;
                        }
                        roleid = Integer.parseInt(request.getParameter("rolesSelect"));

                        as.update(password, email, firstname, lastname, active, roleid);
                        request.setAttribute("message", "User with the email " + email + " has been edited successfully.");
                        break;
                    case "saveCat":
                        int categoryID = (Integer) session.getAttribute("catID");
                        String categoryName = request.getParameter("editCatName");

                        is.updateCat(categoryName, categoryID);

                        List<Categories> categories = is.getAllCats();
                        session.setAttribute("categories", categories);

                        getServletContext().getRequestDispatcher("/WEB-INF/categories.jsp").forward(request,response);
                        return;
                    default:
                        break;
                } 
            }
            List<Users> usersList = as.getAll();
            session.setAttribute("users", usersList);
            List<Role> roles = rdb.getAll();
            session.setAttribute("roles", roles);
            List<Categories> categories = is.getAllCats();
            session.setAttribute("categories", categories);
            
        } catch (Exception ex) {
            Logger.getLogger(InventoryServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "An error has occurred.");
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request,response);
        return;
    }
}
