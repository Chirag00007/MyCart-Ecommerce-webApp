/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author CHIRAG VOHRA
 */


// class desc : this class is for storing the all details of product 
// we r going to used one foreign key in it which is for to identify in which category this product falls
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pName;
    @Column(length=3000 )
    private String pDesc;
    private String pPhoto;
    private int pPrice;
    private int pDiscout;
    private int pQuanntiy;
    
    @ManyToOne
    private Category category;

    public Product() {
    }

    public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscout, int pQuanntiy, Category category) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscout = pDiscout;
        this.pQuanntiy = pQuanntiy;
        this.category = category;
    }

    public Product(int pId, String pName, String pDesc, String pPhoto, int pPrice, int pDiscout, int pQuanntiy) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscout = pDiscout;
        this.pQuanntiy = pQuanntiy;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscout() {
        return pDiscout;
    }

    public void setpDiscout(int pDiscout) {
        this.pDiscout = pDiscout;
    }

    public int getpQuanntiy() {
        return pQuanntiy;
    }

    public void setpQuanntiy(int pQuanntiy) {
        this.pQuanntiy = pQuanntiy;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    

    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDiscout=" + pDiscout + ", pQuanntiy=" + pQuanntiy + '}';
    }
    
    // calculate price after discount
    
    public int getPriceAfterApplyingDiscount(){
        int d = (int) ((this.getpDiscout()/100.0) * this.getpPrice());
        return this.getpPrice() - d;
    }
     
}
