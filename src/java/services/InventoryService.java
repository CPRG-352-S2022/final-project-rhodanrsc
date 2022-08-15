
package services;

import dataaccess.CategoriesDB;
import dataaccess.ItemsDB;
import dataaccess.UserDB;
import java.util.List;
import models.Categories;
import models.Items;
import models.Users;

public class InventoryService {
    public Items get(int itemID) throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        Items items = itemsdb.get(itemID);
        return items;
    }
    
    public List<Items> getAll(String email) throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        List<Items> items = itemsdb.getAll(email);
        return items;
    }
    
    public List<Items> getAll() throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        List<Items> items = itemsdb.getAllItems();
        return items;
    }
    
    public List<Categories> getAllCats() throws Exception {
        CategoriesDB cdb = new CategoriesDB();
        List<Categories> categories = cdb.getAll();
        return categories;
    }
    
    public void insertCat(String categoryName) {
        CategoriesDB cdb = new CategoriesDB();
        Categories category = new Categories(0, categoryName);
        cdb.insert(category);
    }
    
    public void insert(int category, String itemName, double price, String owner) throws Exception {
        Items items = new Items(0, itemName, price);
        Categories categories = new Categories(category);
        UserDB udb = new UserDB();
        Users user = udb.get(owner);
        items.setOwner(user);
        items.setCategory(categories);
        ItemsDB itemsdb = new ItemsDB();
        itemsdb.insert(items);
    }
    
    public void updateCat(String categoryName, int categoryID) throws Exception {
        CategoriesDB cdb = new CategoriesDB();
        Categories category = cdb.get(categoryID);
        category.setCategoryName(categoryName);
        cdb.update(category);
    }
    
    public void update(int itemid, int category, String itemname, double price, String owner) throws Exception {
        ItemsDB idb = new ItemsDB();
        UserDB udb = new UserDB();
        Items item = idb.get(itemid);
        Categories cat = new Categories(category);
        Users user = udb.get(owner);
        item.setCategory(cat);
        item.setItemName(itemname);
        item.setOwner(user);
        item.setPrice(price);
        idb.update(item);
    }
    
    public void delete(int itemID) throws Exception {
        ItemsDB itemsdb = new ItemsDB();
        Items item = itemsdb.get(itemID);
        itemsdb.delete(item);
    }
}
