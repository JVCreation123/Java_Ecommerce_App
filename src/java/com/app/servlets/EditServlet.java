/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.app.servlets;

import com.app.dao.UserDao;
import com.app.entities.Message;
import com.app.entities.User;
import com.app.helper.ConnectionProvider;
import com.app.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig

public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String uname = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String address = request.getParameter("user_address");

            Part part = request.getPart("image");

            String imageName = part.getSubmittedFileName();

            //getsession for set data in that
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            user.setName(uname);
            user.setEmail(email);
            user.setPassword(password);
            user.setAddress(address);

            String oldFile = user.getProfile();
            user.setProfile(imageName);

            UserDao userdao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userdao.updateUser(user);

            if (ans) {
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;


                if (!oldFile.equals("default.png")) {
                    Helper.deleteFile(pathOldFile);
                }

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Successfully updated");
                    Message m = new Message("Profile Successfully Updated", "success", "alert-success");
                    s.setAttribute("msg", m);
                } else {
                    Message m = new Message("Profile Not Updated", "error", "alert-danger");
                    s.setAttribute("msg", m);
                }
            }

            response.sendRedirect("profile.jsp");

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
