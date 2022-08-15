package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Items;
import models.Users;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author RhodanPC
 */
public class ItemsDB {
    
    public List<Items> getAllItems() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            List<Items> itemList = em.createNamedQuery("Items.findAll", Items.class).getResultList();
            return itemList;
        } finally {
            em.close();
        }
    }
    
    public List<Items> getAll(String username) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Users user = em.find(Users.class, username);
            List<Items> noteList = user.getItemsList();
            return noteList;
        } finally {
            em.close();
        }
    }
    
    public Items get(int itemID) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Items item = em.find(Items.class, itemID);
            return item;
        } finally { 
            em.close();
        }
    }
    
    public void insert(Items item) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            Users user = item.getOwner();
            user.getItemsList().add(item);
            trans.begin();
            em.persist(item);
            em.merge(user);
            trans.commit();
        } finally {
            em.close();
        }
    }
    
    public void update(Items item) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.merge(item);
            trans.commit();
        } catch(Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public void delete(Items item) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            Users user = item.getOwner();
            user.getItemsList().remove(item);
            trans.begin();
            em.remove( em.merge(item) );
            em.merge(user);
            trans.commit();
        } catch(Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
}
