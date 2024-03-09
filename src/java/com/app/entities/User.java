
package com.app.entities;
import java.sql.*;
public class User {
    
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp date;
    private String profile;
    private String usertype;
    private String address;
    private String code;

    public User() {
    }
    public User(String email, String password) {
        this.email=email;
        this.password=password;
    }

    public User(int id, String name, String email, String password, String gender, Timestamp date, String address, String code) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.date = date;
        this.address = address;
        this.code = code;
    }

    //for userdata

    public User(int id, String name, String email, String gender, Timestamp date, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.gender = gender;
        this.date = date;
        this.profile = profile;
    }
    
    
    
    public User(String name, String email, String password, String gender, String address, String code) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.address = address;
        this.code=code;
    }
       public User(String name, String email, String password, String gender, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.address = address;
    }
      public User(String name, String email, String code) {
        this.name = name;
        this.email = email;
        this.code = code;
    }
    
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    
    
    
    
    
}
