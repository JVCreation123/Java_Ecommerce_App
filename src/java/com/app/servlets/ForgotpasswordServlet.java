package com.app.servlets;

import com.app.dao.SendEmail;
import com.app.dao.UserDao;
import com.app.entities.Message;
import com.app.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ForgotpasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");

            boolean result = false;
            String em = "rameshdarbar303@gmail.com";
            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            result = dao.checkEmail(email);

            SendEmail send = new SendEmail();
            String code = send.getRandom();
            HttpSession s2 = request.getSession();

            if (email.equalsIgnoreCase(em)) {

                SendEmail mail = new SendEmail();
                mail.SendForgotPasswordEmail(code);
                HttpSession s = request.getSession();
                s.setAttribute("otp", code);
                Message msg = new Message("Email is send.", "success", "alert-success");
                s2.setAttribute("msg", msg);
                s2.setAttribute("email", em);
                response.sendRedirect("forgotpassword_page.jsp");

            } else if (result) {

//                send.SendForgotPasswordEmail(email,code);
//                HttpSession s = request.getSession();
//                s.setAttribute("otp", code);
                s2.setAttribute("email", email);
                Message msg = new Message("Account found, please create new password.", "success", "alert-success");
                s2.setAttribute("msg", msg);
                response.sendRedirect("changepassword_page.jsp");
            } else {
                Message msg = new Message("account is not found! please signup.", "error", "alert-danger");
                s2.setAttribute("msg", msg);
                response.sendRedirect("forgotpassword_page.jsp");
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
