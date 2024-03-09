
package com.app.helper;

import com.mysql.cj.Session;
import com.mysql.cj.xdevapi.SessionFactory;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;


public class Helper {
    
    public static boolean deleteFile(String path)
    {
        boolean f= false;
        
        try{
            
            File file=new File(path);
            f=file.delete();
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public static boolean saveFile(InputStream inp,String path)
    {
        boolean f=false;
        
        try{
            
            byte b[]=new byte[inp.available()];
            inp.read(b);
            FileOutputStream fos=new FileOutputStream(path);
            
            fos.write(b);
            fos.flush();
            fos.close();
            f=true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
//    public static void getCounts(SessionFactory factory){
//        
//        Session session = factory.openSession();
//        String q1=
//    }
}
