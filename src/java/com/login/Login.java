/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import javax.servlet.ServletContext;
import oracle.jdbc.*;

/**
 *
 * @author kargh
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            /* TODO output your page here. You may use the following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");

            // Getting all the values from the login jsp page
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");

            // Connection
            try {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                try (OracleConnection oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@ohara:1521:ORCL", "ARGHYADEEP", "KUNDU")) {

                    String q = "SELECT * FROM user_details WHERE username = ? or email = ?";

                    try (OraclePreparedStatement ost = (OraclePreparedStatement) oconn.prepareStatement(q)) {
                        ost.setString(1, uname);
                        ost.setString(2, uname);
                        try (OracleResultSet ors = (OracleResultSet) ost.executeQuery()) {
                            if (ors.next()) {
                                // Set the "USERNAME" as a session attribute
                                if(pass.equals(ors.getString("password")))
                                {
                                String vname = ors.getString("username");
                                HttpSession sess = request.getSession(true);
                                sess.setAttribute("username", vname);
                                sess.setAttribute("userPassword",pass);
                                response.sendRedirect("http://localhost:8080/DoctorAppointment/serverpage/homepage.jsp");

                            }else{out.println("<script>alert('Wrong password');</script>");}
                            }    else {
                                out.println("<script>alert('Wrong username/email');</script>");
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e);
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
