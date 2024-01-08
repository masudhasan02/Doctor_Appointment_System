/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.addDoc;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import oracle.jdbc.*;

/**
 *
 * @author kargh
 */
@WebServlet(name = "AddDoc", urlPatterns = {"/AddDoc"})
public class AddDoc extends HttpServlet {

    OracleConnection oconn = null;
    OraclePreparedStatement ost = null;
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
            out.println("<title>Servlet AddDoc</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //getting all the values from the signup jsp page.
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String spec = request.getParameter("spec");
            String prac = request.getParameter("prac");
            String yoe = request.getParameter("yoe");
            String sun = request.getParameter("sun");
            String mon = request.getParameter("mon");
            String tue = request.getParameter("tue");
            String wed = request.getParameter("wed");
            String thu = request.getParameter("thu");
            String fri = request.getParameter("fri");
            String sat = request.getParameter("sat");
            String timing = request.getParameter("timing");
            
            //out.println(gender);
            //out.println(fname);
            //out.println(email);
            //out.println(uname);
            //out.println(pass);

            //connection
            try {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@ohara:1521:ORCL", "ARGHYADEEP", "KUNDU");
                

                
                String q = "insert into doctor_details(name, specialization, practicing_hospital, years_of_experience, email, sunday,monday,tuesday,wednesday,thursday,friday,saturday, timing) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
                
                ost =(OraclePreparedStatement) oconn.prepareStatement(q);
                
                ost.setString(1, name);
                ost.setString(2, spec);
                ost.setString(3, prac);
                ost.setString(4, yoe);
                ost.setString(5, email);
                ost.setString(6, sun);
                ost.setString(7, mon);
                ost.setString(8, tue);
                ost.setString(9, wed);
                ost.setString(10, thu);
                ost.setString(11, fri);
                ost.setString(12, sat);
                ost.setString(13, timing);
                
                ost.executeUpdate();
                
                
                out.println("<script>alert('Doctor details have been added');</script>");
                
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('Doctor details have not been added');</script>>");
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
