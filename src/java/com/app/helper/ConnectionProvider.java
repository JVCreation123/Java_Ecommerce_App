
package com.app.helper;

import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection()
    {
        try {
            if(con==null){
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?useSSL=false&allowPublicKeyRetrieval=true","root","SHREEJI@baps123");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
                    
        }
        return con;
    }
    
}
