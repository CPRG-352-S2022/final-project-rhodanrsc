package servlets;

import dataaccess.CategoriesDB;
import dataaccess.ItemsDB;
import dataaccess.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

public class InventoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountService as = new AccountService();
        session.setAttribute("message", null);
        String email = (String) session.getAttribute("email");
        InventoryService is = new InventoryService();
        String param = request.getQueryString();
        Users currentUser = (Users) session.getAttribute("loggedIn");
        System.out.println(currentUser);
        
        
        try {
            Users user = as.get(email);
            if (user.getRole().getRoleId() == 1) {
                List<Items> itemsList = is.getAll();
                session.setAttribute("items", itemsList);
                request.setAttribute("user", user);
                
                if (param != null && param.equals("editProfile")) {
                    request.setAttribute("editProfile", user);
                    getServletContext().getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request,response);
                    return;
                }
                
                getServletContext().getRequestDispatcher("/WEB-INF/inventory.jsp").forward(request,response);
                return;
            }
            
            session.setAttribute("loggedIn", user);
            request.setAttribute("user", user);
            List<Items> itemsList = is.getAll(email);
            session.setAttribute("items", itemsList);
        } catch (Exception ex) {
            Logger.getLogger(InventoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (param != null && param.equals("editProfile")) {
            currentUser = (Users) session.getAttribute("loggedIn");
            request.setAttribute("editProfile", currentUser);
            getServletContext().getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request,response);
            return;
        }
        
        try {
            
            List<Items> itemsList = is.getAll(email);
            session.setAttribute("items", itemsList);
            
            CategoriesDB cdb = new CategoriesDB();
            List<Categories> categoryList = cdb.getAll();
            session.setAttribute("categories", categoryList);
            
        } catch (Exception ex) {
            Logger.getLogger(InventoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/inventory.jsp").forward(request,response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        InventoryService is = new InventoryService();
        AccountService as = new AccountService();
        
        String email = (String) session.getAttribute("email");
        String action = request.getParameter("action");
        Users user = null;
        
        try {
            user = as.get(email);
            if (user.getRole().getRoleId() == 1) {
                List<Items> itemsList = is.getAll();
                session.setAttribute("items", itemsList);
                
                CategoriesDB cdb = new CategoriesDB();
                List<Categories> categoryList = cdb.getAll();
                session.setAttribute("categories", categoryList); 
            }
        } catch (Exception ex) {
            Logger.getLogger(InventoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        try {
            int itemid = 0;
            switch (action) {
                case "search":
                    String search = request.getParameter("searchItem");
                    
                    request.setAttribute("searchItem", search);
                    break;
                case "saveProfile":
                    String password = user.getPassword();
                    if (request.getParameter("passwordEdit") != null) {
                        password = request.getParameter("passwordEdit");
                    }
                    email = request.getParameter("emailEdit");
                    String first = request.getParameter("firstnameEdit");
                    String last = request.getParameter("lastnameEdit");
                    String radio = request.getParameter("activeStatus");
                    boolean active = false;
                    if (radio.equals("active")) {
                        active = true;
                    }
                    Role role = user.getRole();
                    int roleid = role.getRoleId();
                    
                    as.update(password, email, first, last, active, roleid);
                    break;
                case "edit":
                    itemid = Integer.parseInt(request.getParameter("itemID"));
                    session.setAttribute("itemid", itemid);
                    Items editItem = is.get(itemid);
                    request.setAttribute("editItem", editItem);
                    break;
                case "save":
                    int cat = Integer.parseInt(request.getParameter("categoryEdit"));
                    String name = request.getParameter("itemEdit");
                    double price = Double.parseDouble(request.getParameter("priceEdit"));
                    itemid = (Integer)session.getAttribute("itemid");
                    Items item = is.get(itemid);
                    Users itemUser = item.getOwner();
                    String owner = itemUser.getEmail();
                    
                    is.update(itemid, cat, name, price, owner);
                    request.setAttribute("message", "Item saved successfully.");
                    break;
                case "add":
                    email = (String)session.getAttribute("email");
                    name = request.getParameter("itemAdd");
                    price = Double.parseDouble(request.getParameter("priceAdd"));
                    int category = Integer.parseInt(request.getParameter("categoryAdd"));
                    
                    is.insert(category, name, price, email);
                    request.setAttribute("message", "Item added successfully.");
                    break;
                case "Delete":
                    itemid = Integer.parseInt(request.getParameter("itemID"));
                    item = is.get(itemid);
                    itemUser = item.getOwner();
                    owner = itemUser.getEmail();
                    email = (String) session.getAttribute("email");
                    if ( (request.getParameter("itemID") != null && owner.equals(email)) || 
                            user.getRole().getRoleId() == 1 ) {
                        is.delete(itemid);
                    }
                    request.setAttribute("message", "Item deleted successfully.");
                    break;
                default:
                    break;
            }
            request.setAttribute("user", user);

        } catch (Exception ex) {
            Logger.getLogger(InventoryServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "An error has occurred, please try again.");
        } 
        
        try {
            if (user.getRole().getRoleId() == 1) {
                List<Items> itemsList = is.getAll();
                session.setAttribute("items", itemsList);
                
                CategoriesDB cdb = new CategoriesDB();
                List<Categories> categoryList = cdb.getAll();
                session.setAttribute("categories", categoryList);                
            }
        } catch (Exception exception) {
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/inventory.jsp").forward(request,response);
        return;
    }
}
