
package com.mycart.dao;

import com.mycart.entities.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;



/**
 *
 * @author CHIRAG VOHRA
 */
public class UserDao {
    private final SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // get user by email and password
    public  User getUserByEmailAndPassword(String email , String password){
         User user = null;
         try {
            
             String hqlQuery = "from User where userEmail =: e and userPassword =: p";
             try (Session session = this.factory.openSession()) {
                 Query q =  session.createQuery(hqlQuery);
                 q.setParameter("e", email);
                 q.setParameter("p", password);
                 
                 user = (User)q.uniqueResult();
                 
             }
            
             
        } catch (HibernateException e) {
        }
         return user;
    }

//    public  String getUserType(String email){
//       Session session = this.factory.openSession();
//       Query q = session.createQuery("select userType from User where user_email=:email");
//       q.setParameter("userEmail", email);
//       return (String) q.uniqueResult();
//       
//         
}
    

