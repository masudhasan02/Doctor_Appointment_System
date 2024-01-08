/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookAppointment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;

/**
 *
 * @author kargh
 */
@WebServlet(name = "BookAppointment", urlPatterns = {"/BookAppointment"})
public class BookAppointment extends HttpServlet {

    String vto, vfrom, vsubject, vbody;

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
            out.println("<title>Servlet BookAppointment</title>");
            out.println("</head>");
            out.println("<body>");

            //session username
            String emailadd = "";
            String uname = "";
            String fullName = "";
            HttpSession sess = request.getSession(false);
            if (sess != null && sess.getAttribute("username") != null) {
                // User is logged in
                uname = (String) sess.getAttribute("username");

                try {
                    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                    try (OracleConnection oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@ohara:1521:ORCL", "ARGHYADEEP", "KUNDU")) {

                        String q = "SELECT * FROM user_details WHERE username = ?";

                        try (OraclePreparedStatement ost = (OraclePreparedStatement) oconn.prepareStatement(q)) {
                            ost.setString(1, uname);

                            try (OracleResultSet ors = (OracleResultSet) ost.executeQuery()) {
                                if (ors.next()) {
                                    emailadd = ors.getString("email");
                                    fullName = ors.getString("f_name") + " " + ors.getString("l_name");
                                } else {
                                    out.println("<script>alert('User email doesn't exist);</script>");
                                }
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(e);
                }

                String docemail = request.getParameter("doctorEmail");
                String location = request.getParameter("location");

                /* out.println(emailadd);
                out.println(fullName);
                out.println(uname);
                out.println(location);
                out.println(docemail); */
                //email
                // Sender's email ID needs to be mentioned
                String from = "quick.diagnosis.qd@gmail.com";
                // Assuming you are sending email from localhost
                String host = "smtp.gmail.com";
                final String username = "quick.diagnosis.qd@gmail.com";
                final String password = "ykrzwvwtujizhdrz"; // Use the actual password

                // Get system properties
                Properties props = new Properties();
                props.put("mail.smtp.auth","true");
                props.put("mail.smtp.starttls.enable","true");
                props.put("mail.smtp.host","smtp.gmail.com");
                props.put("mail.smtp.port","587");
                
                

                // Get the default Session object.
                Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

                try {
                    //sending mail to user
                    // Create a default MimeMessage object.
                    Message message = new MimeMessage(session);

                    // Set From: header field of the header.
                    message.setFrom(new InternetAddress(from));

                    // Set To: header field of the header.
                    message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailadd));

                    // Set Subject: header field
                    message.setSubject("Regarding your appointment");

                    // Now set the actual message
                    message.setText("Dear User, \n\n Your appointment has been booked successfully.");

                    // Send message
                    Transport.send(message);

                    //sending mail to doctor
                    // Set From: header field of the header.
                    message.setFrom(new InternetAddress(from));

                    // Set To: header field of the header.
                    message.setRecipient(Message.RecipientType.TO, new InternetAddress(docemail));

                    // Set Subject: header field
                    message.setSubject("Regarding an appointment");

                    // Now set the actual message
                    message.setText("Dear Doctor, \n\n Today you have an appoinment with " + fullName + " in your chamber in " + location + ".");

                    // Send message
                    Transport.send(message);

                    out.println("<script>alert('Appointment booking successful')</script>");

                } catch (MessagingException mex) {
                    mex.printStackTrace();
                    out.println("<script>alert('Appointment booking unsuccessful')</script>");
                }
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
