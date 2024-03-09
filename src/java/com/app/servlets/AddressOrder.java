package com.app.servlets;

import com.app.dao.OrderDao;
import com.app.dao.SendEmail;
import com.app.entities.Cart;
import com.app.entities.Order;
import com.app.entities.OrderData;
import com.app.entities.User;
import com.app.helper.ConnectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddressOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            ArrayList<Order> orders = (ArrayList<Order>) request.getSession().getAttribute("orderinfo");
            User user = (User) request.getSession().getAttribute("currentUser");
            OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
            SendEmail sm = new SendEmail();
//            File file = new File("null");
            boolean ss=false;
            String email = request.getParameter("uemail");
            String name = request.getParameter("uname");
            String address = request.getParameter("uaddress");
            String city = request.getParameter("ucity");
            int pin = Integer.parseInt(request.getParameter("upin"));
            BigDecimal mob = new BigDecimal(request.getParameter("umob"));
            String check=request.getParameter("check");
            
            if(check==null){
                out.println("Please check terms and conditions....!!!");
            }else{
                
            for (Order o : orders) {
                OrderData data = new OrderData();
                data.setPid(o.getPid());
                data.setUid(user.getId());
                data.setO_id(o.getOrderId());
                data.setName(name);
                data.setEmail(email);
                data.setPrname(o.getPrName());
                data.setPrprice(o.getPrPrice());
                data.setQuantity(o.getQuantity());
                data.setAddress(address);
                data.setCity(city);
                data.setPin(pin);
                data.setMob(mob);
                data.setPic(o.getPrPic());
                

                HttpSession session = request.getSession();
                session.setAttribute("ordersforbill", data);
                        
                boolean result = dao.insertMainOrder(data);
//                if(!result) break;

                dao.RemoveOrder(o.getOrderId());
                sm.sendEmailWithAttachment(user, data );
                ss=true;
            }
            if (ss) {

                response.sendRedirect("invoice.jsp");
            }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
