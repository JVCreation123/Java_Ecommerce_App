package com.app.dao;

import com.app.entities.Cart;
import com.app.entities.Categories;
import com.app.entities.Items;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemsDao {

    Connection con;

    public ItemsDao(Connection con) {
        this.con = con;
    }

    public boolean saveItems(Items i) {
        boolean f = false;

        try {

            String q = "insert into items(prName, prPrice, prCompany, prPic, cid) values(?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, i.getPrName());
            pstmt.setDouble(2, i.getPrPrice());
            pstmt.setString(3, i.getPrCompany());
            pstmt.setString(4, i.getPrPic());
            pstmt.setInt(5, i.getCid());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<Items> getAllItems() {

        List<Items> list = new ArrayList<>();

        try {

            PreparedStatement p = this.con.prepareStatement("select * from items order by pid desc");
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String prName = set.getString("prName");
                Long prPrice = set.getLong("prPrice");
                String prCompany = set.getString("prCompany");
                String prPic = set.getString("prPic");
                int cid = set.getInt("cid");

                Items item = new Items(pid, prName, prPrice, prCompany, prPic, cid);
                list.add(item);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Items> getAllItemsById(int cid) {

        List<Items> list = new ArrayList<>();

        try {

            PreparedStatement p = this.con.prepareStatement("select * from items where cid=?");
            p.setInt(1, cid);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String prName = set.getString("prName");
                Long prPrice = set.getLong("prPrice");
                String prCompany = set.getString("prCompany");
                String prPic = set.getString("prPic");

                Items item = new Items(pid, prName, prPrice, prCompany, prPic, cid);
                list.add(item);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<Categories> getAllCategories() {

        ArrayList<Categories> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement s = con.createStatement();
            ResultSet set = s.executeQuery(q);
            while (set.next()) {

                int cid = set.getInt("cid");
                String cname = set.getString("name");
                Categories cc = new Categories(cid, cname);
                list.add(cc);

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return list;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> items = new ArrayList<Cart>();

        try {

            if (cartList.size() > 0) {
                for (Cart c : cartList) {
                    String query = "select * from items where pid=?";
                    PreparedStatement pstmt = this.con.prepareStatement(query);
                    pstmt.setInt(1, c.getPid());
                    ResultSet set = pstmt.executeQuery();
                    while (set.next()) {
                        Cart row = new Cart();
                        row.setPid(set.getInt("pid"));
                        row.setPrName(set.getString("prName"));
                        row.setPrPrice(set.getLong("prPrice") * c.getQuantity());
                        row.setQuantity(c.getQuantity());
                        items.add(row);
                    }

                }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return items;
    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList){
        double sum=0;
        
        try {
            
            if(cartList.size()>0){
                for(Cart item:cartList){
                    String q="select * from items where pid=?";
                    PreparedStatement pstmt=this.con.prepareStatement(q);
                    pstmt.setInt(1, item.getPid());
                    ResultSet set=pstmt.executeQuery();
                    
                    while(set.next()){
                        sum+=set.getDouble("prPrice")*item.getQuantity();
                    }
                    
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        
        
        return sum;
    }
    
    public Items getSingleItem(int pid){
        Items row=null;
        
        try {
            
            String q="select * from items where pid=?";
            PreparedStatement pstmt=this.con.prepareStatement(q);
            pstmt.setInt(1, pid);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                row=new Items();
                row.setPid(set.getInt("pid"));
                row.setPrName(set.getString("prName"));
                row.setPrPrice(set.getLong("prPrice"));
                row.setPrCompany(set.getString("prCompany"));
                row.setPrPic(set.getString("prPic"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return row;
    }
    
    
    public int getProductscount(){
        
        
        int count=0;
        
        try {
            
            String q="select count(*) from items";
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
    
        public void RemoveItem(int id) {
        try {

            String q = "delete from items where pid=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, id);
            pstmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

        public boolean UpdateItem(Items item){
            boolean f=false;
            
            try {
                String q="update items set prName=?,prPrice=?,prCompany=? where pid=?";
                PreparedStatement pstmt=this.con.prepareStatement(q);
                pstmt.setString(1,item.getPrName());
                pstmt.setDouble(2, item.getPrPrice());
                pstmt.setString(3, item.getPrCompany());
                pstmt.setInt(4, item.getPid());
                pstmt.executeUpdate();
                f=true;
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return f;
            
        }

}
