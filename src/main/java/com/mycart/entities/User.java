
package com.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author CHIRAG VOHRA hibernate 
 */

// Entity Desc : This user class is for getting the details of user.
// and by using the hibernate I will store all the data in Mysql
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length=10, name = "user_id")
    private int userId;
     
     @Column(length=30, name = "user_name")
    private String userName;
     
    @Column(length=35, name = "user_email",unique = true)
    private String userEmail;
    
    @Column(length=20, name = "user_password")
    private String userPassword;
    
    @Column(length=15, name = "user_Phone")
    private String userPhone;
    
    @Column(length=1500, name = "user_pic")
    private String userPic;  //if need to store multiple pics of user u can create List<> for this and can make a differnt database for it also
   
    @Column(length=1500, name = "user_address")
    private String userAddress;
    
    private String userType;

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    // Parameterisd constructor for all fields . because sometime we needs id also
    public User(int userId,String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress,String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }
    
   

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
     
    // Parameterisd constructor for all fields except id as it is auto generated
   
    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }

    
    
     
}
