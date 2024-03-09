/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.dao;

import com.app.entities.Items;
import com.app.entities.Order;
import com.app.entities.OrderData;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    Connection con;

    public OrderDao(Connection con) {
        this.con = con;
    }

    public boolean insertOrder(Order model) {
        boolean result = false;

        try {

            String q = "insert into orders(pid,uid,quantity,o_date) values(?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, model.getPid());
            pstmt.setInt(2, model.getUid());
            pstmt.setInt(3, model.getQuantity());
            pstmt.setString(4, model.getDate());
            pstmt.executeUpdate();
            result = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Order> userOrder(int pid) {
        List<Order> list = new ArrayList<>();

        try {

            String q = "select * from orders where uid=? order by orders.o_id desc";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, pid);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                Order order = new Order();
                ItemsDao idao = new ItemsDao(this.con);
                int pId = set.getInt("pid");
                Items item = idao.getSingleItem(pId);
                order.setOrderId(set.getInt("o_id"));
                order.setPid(pId);
                order.setPrPic(item.getPrPic());
                order.setPrName(item.getPrName());
                order.setPrPrice(item.getPrPrice() * set.getInt("quantity"));
                order.setQuantity(set.getInt("quantity"));
                order.setDate(set.getString("o_date"));
                list.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void cancelOrder(int id) {
        try {

            String q = "delete from orders where o_id=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, id);
            pstmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean insertMainOrder(OrderData model) {
        boolean result = false;

        try {

            String q = "insert into orderdata(pid,uid,o_id,name,prname,prprice,quantity,email,address,city,pin,pic,mob) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1,model.getPid());
            pstmt.setInt(2, model.getUid());
            pstmt.setInt(3, model.getO_id());
            pstmt.setString(4, model.getName());
            pstmt.setString(5, model.getPrname());
            pstmt.setDouble(6, model.getPrprice());
            pstmt.setInt(7, model.getQuantity());
            pstmt.setString(8, model.getEmail());
            pstmt.setString(9, model.getAddress());
            pstmt.setString(10, model.getCity());
            pstmt.setInt(11, model.getPin());
            pstmt.setString(12, model.getPic());
            pstmt.setBigDecimal(13, model.getMob());
            pstmt.executeUpdate();
            result = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public void RemoveOrder(int id) {
        try {

            String q = "delete from orders where o_id=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, id);
            pstmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Order> OrdersHistory(int uid){
        List<Order> list=new ArrayList<>();
        try {
            
            String q="select * from orderdata where uid=?";
            PreparedStatement pstmt=this.con.prepareStatement(q);
            pstmt.setInt(1,uid);
            ResultSet set = pstmt.executeQuery();
            while(set.next()){
                Order order=new Order();
                ItemsDao item=new ItemsDao(this.con);
                OrderData dd=new OrderData();
                
                order.setOrderId(set.getInt("o_id"));
                order.setPrName(set.getString("prname"));
                order.setPrPrice(set.getLong("prprice"));
                order.setQuantity(set.getInt("quantity"));
                order.setDate(set.getString("dates"));
                order.setPrPic(set.getString("pic"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    public List<OrderData> getAllOrders(){
        List<OrderData> list=new ArrayList<>();
        
        try {
            String q="select * from orderdata";
            Statement st=this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                int id=set.getInt("id");
                int uid=set.getInt("uid");
                String name=set.getString("name");
                String prname= set.getString("prname");
                Long price=set.getLong("prprice");
                int quantity=set.getInt("quantity");
                String pic=set.getString("pic");
                String address=set.getString("address");
                int pin=set.getInt("pin");
                BigDecimal mob=set.getBigDecimal("mob");
                Timestamp date=set.getTimestamp("dates");
                OrderData orders = new OrderData(id,uid,name, prname, price, quantity, address, pin, mob, pic, date);
                list.add(orders);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
}
