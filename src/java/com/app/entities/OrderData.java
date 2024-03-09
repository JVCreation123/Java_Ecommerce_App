/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.entities;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;

public class OrderData extends Order {

    private int id;
    private int pid;
    private int uid;
    private int o_id;
    private String name;
    private String prname;
    private long prprice;
    private int quantity;
    private String email;
    private String address;
    private String city;
    private int pin;
    private BigDecimal mob;
    private String pic;
    private Timestamp dates;
    

    public OrderData() {
    }

    public OrderData(int id, int pid, int uid, int o_id, String name, String prname, Long prprice, int quantity, String email, String address, String city, int pin, BigDecimal mob, String pic, Timestamp dates) {
        this.id = id;
        this.pid=pid;
        this.uid = uid;
        this.o_id = o_id;
        this.name = name;
        this.prname = prname;
        this.prprice = prprice;
        this.quantity = quantity;
        this.email = email;
        this.address = address;
        this.city = city;
        this.pin = pin;
        this.mob = mob;
        this.pic=pic;
        this.dates = dates;
    }

    public OrderData(int pid, int uid, int o_id, String name, String prname, Long prprice, int quantity, String email, String address, String city, int pin, BigDecimal mob, String pic) {
        this.pid=pid;
        this.uid = uid;
        this.o_id = o_id;
        this.name = name;
        this.prname = prname;
        this.prprice = prprice;
        this.quantity = quantity;
        this.email = email;
        this.address = address;
        this.city = city;
        this.pin = pin;
        this.mob = mob;
        this.pic=pic;
    }

    public OrderData(int id,int uid,String name, String prname, Long prprice, int quantity, String address, int pin, BigDecimal mob, String pic, Timestamp dates) {
        this.id=id;
        this.uid=uid;
        this.name = name;
        this.prname = prname;
        this.prprice = prprice;
        this.quantity = quantity;
        this.address = address;
        this.pin = pin;
        this.mob = mob;
        this.pic = pic;
        this.dates = dates;
    }
    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    
    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }

    public BigDecimal getMob() {
        return mob;
    }

    public void setMob(BigDecimal mob) {
        this.mob = mob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getPrname() {
        return prname;
    }

    public void setPrname(String prname) {
        this.prname = prname;
    }

    public Long getPrprice() {
        return prprice;
    }

    public void setPrprice(Long prprice) {
        this.prprice = prprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
    
    
    

    public Timestamp getDates() {
        return dates;
    }

    public void setDates(Timestamp dates) {
        this.dates = dates;
    }
    
    

}
