/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycart.dao;

import com.mycart.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author CHIRAG VOHRA
 */
public class CategoryDao {
    private SessionFactory factory;
    public CategoryDao(SessionFactory factory)
    {
        this.factory = factory;
    }
    
    //this method is saving the category data which we add in admin modal
    public int saveCategory(Category cat){
        int catId;
        try (
                
            Session session = this.factory.openSession()) {
            Transaction tx = session.beginTransaction();
            catId = (int) session.save(cat);
            tx.commit();
        }
        return catId;
    }
    
    // this method is getting the data of category from databases
    // uses : to show categoroies in product addition
    
    public List<Category> getCategories(){
        Session s = this.factory.openSession();
        Transaction t = s.beginTransaction();
        Query query;
        query = s.createQuery("from Category");
        List<Category> list = query.list();
        t.commit();
        return list;
        
    }
    
    public Category getCategoryById(int cid)
    {
        Category cat = null;
        try {
             Session s = this.factory.openSession();
             cat = s.get(Category.class, cid);
             s.close();
             
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
