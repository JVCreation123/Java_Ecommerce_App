/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.entities;


public class Categories {
    
    private int cid;
    private String name;

    public Categories(int cid, String name) {
        this.cid = cid;
        this.name = name;
    }

    public Categories(String name) {
        this.name = name;
    }
    
    
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    
}
