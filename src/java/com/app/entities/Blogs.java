/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.entities;

import java.sql.Timestamp;

public class Blogs {

    private int id;
    private String title;
    private String content;
    private String blogPic;
    private Timestamp date;

    public Blogs() {
    }
    
    
    public Blogs(int id,String title, String content, String blogPic, Timestamp date) {
        this.id=id;
        this.title = title;
        this.content = content;
        this.blogPic = blogPic;
        this.date =date;
    }

    public Blogs(String title, String content, String blogPic, Timestamp date) {
        this.title = title;
        this.content = content;
        this.blogPic = blogPic;
        this.date =date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBlogPic() {
        return blogPic;
    }

    public void setBlogPic(String blogPic) {
        this.blogPic = blogPic;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
    
    
    
}
