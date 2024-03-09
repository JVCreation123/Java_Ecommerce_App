/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.dao;

import com.app.entities.Blogs;
import com.app.helper.ConnectionProvider;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class BlogDao {
    
    private Connection con;

    public BlogDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean saveBlog(Blogs b){
        boolean f=false;
        
        try {
            
            String q="insert into blogs(title, content, blogpic) values(?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(q);
            pstmt.setString(1, b.getTitle());
            pstmt.setString(2, b.getContent());
            pstmt.setString(3, b.getBlogPic());
            pstmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return f;
    }
    
    
    public List<Blogs> getAllBlogs(){
        
        List<Blogs> list = new ArrayList<>();
        
        try {
            
            String q="select * from blogs";
            Statement st=this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                String title=set.getString("title");
                String content = set.getString("content");
                String pic = set.getString("blogpic");
                Timestamp date=set.getTimestamp("date");
                Blogs b=new Blogs(title, content, pic, date);
                list.add(b);
                
            }           
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
        
    }
    
    
    
    public int BlogCount(){
        int count=0;
        
        
        try {
            String q="select count(*) from blogs";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next()){
                count=set.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public List<Blogs> getBlogs(int var){
        List<Blogs> list=new ArrayList<Blogs>();
        
        try {
            
            PreparedStatement pstmt=this.con.prepareStatement("select * from blogs limit 0, "+var);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                
                Blogs blog=new Blogs();
                blog.setTitle(set.getString("title"));
                blog.setContent(set.getString("content"));
                blog.setBlogPic(set.getString("blogpic"));
                blog.setDate(set.getTimestamp("date"));
                list.add(blog);
                        
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
}
