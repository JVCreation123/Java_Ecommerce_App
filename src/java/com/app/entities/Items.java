package com.app.entities;

import java.sql.*;

public class Items {

    private int pid;
    private String prName;
    private long prPrice;
    private String prCompany;
    private String prPic;
    private String itemtype;
    private int cid;

    public Items() {
    }

    public Items(int pid, String prName, long prPrice, String prCompany, String prPic, int cid) {
        this.pid = pid;
        this.prName = prName;
        this.prPrice = prPrice;        
        this.prCompany = prCompany;
        this.prPic = prPic;
        this.cid = cid;
    }

    public Items(int pid, String prName, long prPrice, String prCompany) {
        this.pid = pid;
        this.prName = prName;
        this.prPrice = prPrice;
        this.prCompany = prCompany;
    }

    
    public Items(String prName, long prPrice, String prCompany, String prPic, int cid) {
        this.prName = prName;
        this.prPrice = prPrice;
        this.prCompany = prCompany;
        this.prPic = prPic;
        this.cid = cid;

    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPrName() {
        return prName;
    }

    public void setPrName(String prName) {
        this.prName = prName;
    }

    public long getPrPrice() {
        return prPrice;
    }

    public void setPrPrice(long prPrice) {
        this.prPrice = prPrice;
    }

    public String getPrCompany() {
        return prCompany;
    }

    public void setPrCompany(String prCompany) {
        this.prCompany = prCompany;
    }
  
    
    
    
    public String getPrPic() {
        return prPic;
    }

    public void setPrPic(String prPic) {
        this.prPic = prPic;
    }

    public String getItemtype() {
        return itemtype;
    }

    public void setItemtype(String itemtype) {
        this.itemtype = itemtype;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
    
    
                         

}
