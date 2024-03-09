package com.app.servlets;

import com.app.dao.OrderDao;
import com.app.entities.Cart;
import com.app.entities.Order;
import com.app.entities.User;
import com.app.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderNowServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            User user = (User) request.getSession().getAttribute("currentUser");
            if (user != null) {

                String pid = request.getParameter("pid");
                int pquantity = Integer.parseInt(request.getParameter("quantity"));
                if (pquantity <= 0) {
                    pquantity = 1;
                }

                Order orderModal = new Order();
                orderModal.setPid(Integer.parseInt(pid));
                orderModal.setUid(user.getId());
                orderModal.setQuantity(pquantity);
                orderModal.setDate(formatter.format(date));

                OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
                boolean result = dao.insertOrder(orderModal);
                if (result) {

                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    if (cart_list != null) {
                        for (Cart c : cart_list) {
                            if (c.getPid() == Integer.parseInt(pid)) {
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }

                    response.sendRedirect("orders.jsp");
                } else {
                    out.println("<h1 style='color:red'>Error</h1>");

                }

            } else {
                response.sendRedirect("login_page.jsp");
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
