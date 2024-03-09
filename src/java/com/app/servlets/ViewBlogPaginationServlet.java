/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.app.servlets;

import com.app.dao.BlogDao;
import com.app.entities.Blogs;
import com.app.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell 3505
 */
public class ViewBlogPaginationServlet extends HttpServlet {

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

            String spageid = request.getParameter("page");
            int pageId = Integer.parseInt(spageid);
//            String spageid2 = request.getParameter("var2");
//            int pageId2 = Integer.parseInt(spageid2);
//            for (int i = 0; i < 4; i++) {
                pageId = pageId + 4;
//            }
//            int total = 5;
//            if (pageId == 1) {
//
//            } else {
//                pageId = pageId - 1;
//                pageId = pageId * total + 1;
//            }
//            BlogDao dao = new BlogDao(ConnectionProvider.getConnection());
//            List<Blogs> blog = dao.getBlogs(pageId, total);
//            for (Blogs bl : blog) {
//                Blogs b = new Blogs();
//                b.setTitle(bl.getTitle());
//                b.setContent(bl.getContent());
//                b.setBlogPic(bl.getBlogPic());
//                b.setDate(bl.getDate());
//
            HttpSession session = request.getSession();
            session.setAttribute("blogg", pageId);
//            out.print(pageId);
            HttpSession session2 = request.getSession();
            int var = 1;
            session2.setAttribute("loader", var);
//            out.print(pageId);
//
//            }
            response.sendRedirect("blog.jsp");

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
