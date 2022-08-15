package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Categories;
import models.Items;
import models.Users;

public class CategoriesDB {
    
    public List<Categories> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            List<Categories> categories = em.createNamedQuery("Categories.findAll", Categories.class).getResultList();
            return categories;
        } finally {
            em.close();
        }
    }
    
    public Categories get(int categoryID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Categories category = em.find(Categories.class, categoryID);
            return category;
        } finally { 
            em.close();
        }
    }
   
    public void insert(Categories category) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.persist(category);
            em.merge(category);
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public void update(Categories category) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.merge(category);
            trans.commit();
        } catch(Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
