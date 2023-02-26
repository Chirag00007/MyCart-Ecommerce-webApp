/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycart.dao;

import com.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author CHIRAG VOHRA
 */
public class ProductDao {
     private SessionFactory factory;
    public ProductDao(SessionFactory factory)
    {
        this.factory = factory;
    }
   
    public boolean saveProduct(Product product)
    {
        boolean flag = false;
        try {
           Session session = this.factory.openSession();
           Transaction tx = session.beginTransaction();
           session.save(product);
           tx.commit();
           session.close();
           flag=true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = true;
        }
        return flag;
        
    }
    
    // get all products
    
    public List<Product> getAllProducts(){
         Session session = this.factory.openSession();
        Query query= session.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    
    // get all products by id
    
    public List<Product> getAllProductsById(int cid){
         Session session = this.factory.openSession();
        Query query= session.createQuery("from Product as p where p.category.categoryId=: id ");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;
    }
    
    
}
