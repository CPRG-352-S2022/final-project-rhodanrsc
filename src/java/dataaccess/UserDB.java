package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Users;

public class UserDB {
    
    public List<Users> getAll() throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            List<Users> user = em.createNamedQuery("Users.findAll", Users.class).getResultList();
            return user;
        } finally {
            em.close();
        }
    }
    
    public Users get(String email) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Users user = em.find(Users.class, email);
            return user;
        } finally {
            em.close();
        }
    }
    
    public Users getByUUID(String uuid) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Users user = em.find(Users.class, uuid);
            return user;
        } finally {
            em.close();
        }
    }
    
    public void insert(Users user) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.merge(user);
            trans.commit();
        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public void update(Users user) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.merge(user);
            trans.commit();
        } catch(Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public void delete(Users user) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.remove( em.merge(user) );
            trans.commit();
        } catch(Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
}
