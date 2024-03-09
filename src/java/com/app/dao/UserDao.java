package com.app.dao;

import com.app.entities.Categories;
import com.app.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        boolean f = false;

        try {
            String query = "insert into user(name,email,password,gender,address) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAddress());
            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String q = "select * from user where email =? and password =?";

            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                String name = set.getString("name");

                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAddress(set.getString("address"));
                user.setDate(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setUsertype(set.getString("usertype"));


            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    
    public boolean updateUser(User user)
    {
        boolean f=false;
        
        try{
            
            String q="update user set name=?, email=?, password=?, gender=?, address=?, profile=? where id=?";
            
            PreparedStatement p=con.prepareStatement(q);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAddress());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            
            p.executeUpdate();
            f=true;    
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    
    public int getUserscount(){
        
        boolean f=false;
        int count=0;
        
        ArrayList<User> ll=new ArrayList<>();
        try {
            
            String q="select count(*) from user";
            Statement s = con.createStatement();
            ResultSet set = s.executeQuery(q);
            while(set.next()){
                count = set.getInt(1);
            }
            
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return count;
       
    }
    
    
    
    public boolean checkEmail(String email){
        boolean f=false;
        
        try {
            
            String q="select * from ecommerce.user where email=?";
            PreparedStatement pstmt=this.con.prepareStatement(q);
            pstmt.setString(1, email);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                String em=set.getString("email");
//                if(em==email){
                    f=true;                                                                                                                             
//                }
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean changePassword(String email, String password){
        boolean f=false;
        
        try {
            
            String q="update user set password=? where email=?";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setString(1, password);
            pstmt.setString(2, email);
            pstmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public List<User> getAllUsers(){
        
        List<User> list=new ArrayList<>();
        try {
            
            String q="select * from user";
            Statement st=this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                
                int id=set.getInt("id");
                String name=set.getString("name");
                String pic=set.getString("profile");
                Timestamp date=set.getTimestamp("rdate");
                String email=set.getString("email");
                String gender=set.getString("gender");
                User user=new User(id, name, email, gender, date, pic);
                list.add(user);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
}
