/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.app.servlets;

import com.app.dao.UserDao;
import com.app.entities.Message;
import com.app.entities.User;
import com.app.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class login_servlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String uemail = request.getParameter("email");
            String upassword = request.getParameter("password");
            
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            
            User user=dao.getUserByEmailAndPassword(uemail, upassword);
            
            if(user==null)
            {
                out.println("Invalid user");
                Message m=new Message("Something went wrong...!", "error","alert-danger");
                
                HttpSession s = request.getSession();
                s.setAttribute("msg", m);
                response.sendRedirect("login_page.jsp");
                
                
            }
            else{
                
                
                HttpSession session=request.getSession();
                session.setAttribute("currentUser",user);
                
                if(user.getUsertype().equals("admin")){
                    
                    response.sendRedirect("admin.jsp");
                }
                else if((user.getUsertype().equals("normal")) ){
                    
                    response.sendRedirect("profile.jsp");
                }
                else{
                    out.println("Invalid");
                }
                
                
                
                
                
//                if((user.getUserType().equals("admin")))
//                {
//                }
            }
            
            
            out.println("</body>");
            out.println("</html>");
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
