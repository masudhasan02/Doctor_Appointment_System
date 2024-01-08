/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import oracle.jdbc.*;

/**
 *
 * @author kargh
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    OracleConnection oconn;
    OraclePreparedStatement ost;
    OracleResultSet ors = null;

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            //getting all the values from the signup jsp page.
            String fname = request.getParameter("f_name");
            String lname = request.getParameter("l_name");
            String mname = request.getParameter("m_name");
            String email = request.getParameter("email");
            String phn = request.getParameter("phn");
            String gender = request.getParameter("gender");
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            String secquestion = request.getParameter("secques");
            String secanswer = request.getParameter("secans");

            //out.println(gender);
            //out.println(fname);
            //out.println(email);
            //out.println(uname);
            //out.println(pass);
            //connection
            try {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@ohara:1521:ORCL", "ARGHYADEEP", "KUNDU");

                String q = "insert into user_details(f_name, l_name,m_name,email,phn,gender,username,password,secques,secans) values(?,?,?,?,?,?,?,?,?,?)";

                ost = (OraclePreparedStatement) oconn.prepareStatement(q);

                ost.setString(1, fname);
                ost.setString(2, lname);
                ost.setString(3, mname);
                ost.setString(4, email);
                ost.setString(5, phn);
                ost.setString(6, gender);
                ost.setString(7, uname);
                ost.setString(8, pass);
                ost.setString(9, secquestion);
                ost.setString(10, secanswer);

                ost.executeUpdate();

                HttpSession sess = request.getSession(true);
                sess.setAttribute("username", uname);
                sess.setAttribute("userPassword",pass);
                out.println("<script>alert('Password changed');</script>");
                response.sendRedirect("http://localhost:8080/DoctorAppointment/serverpage/homepage.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('Username or email already exists');</script>");
            }

            //query
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
