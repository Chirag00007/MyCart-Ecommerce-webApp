package com.mycart.helper;


import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author CHIRAG VOHRA
 */
public class FactoryProvider {

    private static SessionFactory factory;

    public static SessionFactory getFactory() {
        try {
            // this method is following the singleton design pattern because if sessionFactory have already the value then it will not configure again again
            if (factory == null) {
                factory = new Configuration().
                        configure("hibernate.cfg.xml")
                        .buildSessionFactory();

            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return factory;
    }

   

}
