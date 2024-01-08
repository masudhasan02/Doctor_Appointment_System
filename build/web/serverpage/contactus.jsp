<%-- 
    Document   : contactus
    Created on : 20 Nov, 2023, 11:45:45 PM
    Author     : kargh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession sess = request.getSession(false);
    if (sess != null && sess.getAttribute("username") != null) {
        // User is logged in
        String username = (String) sess.getAttribute("username");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Inter, sans-serif;
                background-color: whitesmoke;
            }

            .container {
                max-width: 1050px;
                width: 90%;
                margin: auto;
                z-index: 999;
            }

            .navbar {
                width: 100%;
                box-shadow: 0 1px 4px rgb(146 161 176 / 15%);
            }

            .nav-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 62px;
            }

            .navbar .menu-items {
                display: flex;
            }

            .navbar .nav-container li {
                list-style: none;
            }

            .navbar .nav-container a {
                text-decoration: none;
                color: #0e2431;
                font-weight: 500;
                font-size: 1.2rem;
                padding: 0.7rem;
            }

            .navbar .nav-container a:hover {
                font-weight: bolder;
            }

            .nav-container {
                display: block;
                position: relative;
                height: 60px;
            }

            .nav-container .checkbox {
                position: absolute;
                display: block;
                height: 32px;
                width: 32px;
                top: 20px;
                left: 20px;
                z-index: 5;
                opacity: 0;
                cursor: pointer;
            }

            .nav-container .hamburger-lines {
                display: block;
                height: 26px;
                width: 32px;
                position: absolute;
                top: 17px;
                left: 20px;
                z-index: 2;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .nav-container .hamburger-lines .line {
                display: block;
                height: 4px;
                width: 100%;
                border-radius: 10px;
                background: #0e2431;
            }

            .nav-container .hamburger-lines .line1 {
                transform-origin: 0% 0%;
                transition: transform 0.4s ease-in-out;
            }

            .nav-container .hamburger-lines .line2 {
                transition: transform 0.2s ease-in-out;
            }

            .nav-container .hamburger-lines .line3 {
                transform-origin: 0% 100%;
                transition: transform 0.4s ease-in-out;
            }

            .navbar .menu-items {
                padding-top: 120px;
                background-color: white;
                height: 100vh;
                width: 100%;
                transform: translate(-150%);
                display: flex;
                flex-direction: column;
                margin-left: -40px;
                padding-left: 50px;
                transition: transform 0.5s ease-in-out;
                text-align: center;
            }

            .navbar .menu-items li {
                margin-bottom: 1.2rem;
                font-size: 1.5rem;
                font-weight: 500;
            }

            .logo {
                position: absolute;
                top: 5px;
                right: 15px;
            }

            .nav-container input[type="checkbox"]:checked~.menu-items {
                transform: translateX(0);
            }

            .nav-container input[type="checkbox"]:checked~.hamburger-lines .line1 {
                transform: rotate(45deg);
            }

            .nav-container input[type="checkbox"]:checked~.hamburger-lines .line2 {
                transform: scaleY(0);
            }

            .nav-container input[type="checkbox"]:checked~.hamburger-lines .line3 {
                transform: rotate(-45deg);
            }

            .nav-container input[type="checkbox"]:checked~.logo {
                display: none;
            }
            /* *************************************************************** */
            /* *************************************************************** */
            /* *************************************************************** */
            /* *************************************************************** */
            .banner {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px;
                margin: 0;
            }
            .banner-img img{
                width: 80%;
                border-radius: 100%;
            }
            .banner-img, .banner-content{
                margin: 0 auto;
            }
            .banner-content p{
                font-size: 1.5em;
            }

            .banner h2 {
                font-size: 4.5em;
            }

            /* Use flex display for the contact info section */
            .contact-info {
                display: flex;
                justify-content: space-around;
                padding: 50px;

            }

            /* Adjust styles for the phone and email sections */
            .phone,
            .email {
                max-width: 45%;
                background-color: white;
                color: black;
                font-size: 1rem;
                padding: 10px;
                margin: 0 auto;
                text-align: center;
            }

            .phone img,
            .email img {
                width: 10%;
                border-radius: 50%;
                margin: 0 45%;
            }

            .phone p,
            .email p,
            .phone-number-p,
            .email-address-p {
                margin: 0;
                font-size: 1.5em;
                text-align: left;
            }
            span{
                text-align: center;
                margin: 0 auto;
                color: rgb(67, 67, 234);
                font-size: 1.5em;
            }
            .mandatory{
                position: absolute;
                margin: 20px 45% 0 45%;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="mandatory"><p><%= username%></p></div>
        <header class="header">
        <nav>
            <div class="navbar">
                <div class="container nav-container">
                    <input class="checkbox" type="checkbox" name="" id="" />
                    <div class="hamburger-lines">
                        <span class="line line1"></span>
                        <span class="line line2"></span>
                        <span class="line line3"></span>
                    </div>
                    <div class="logo">
                        <img src="../images/QD.png" style="width: 50px;">
                    </div>
                    <div class="menu-items">
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/userProfile.jsp">Profile</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/homepage.jsp">Home</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/pricing.jsp">Pricing</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/sitemap.jsp">Site map</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/aboutus.jsp">About Us</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/feedback.jsp">Feedback</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/signOut.jsp">Log out</a></li>
                        
                    </div>
                </div>
            </div>
        </nav>
    </header>
        <main>
            <!-- support@quickdiagnosis.com         +91-9876543210-->
            <div class="banner">
                <div class="banner-content">
                    <h2>Get in touch</h2>
                    <p class="h2-p">Want to get in touch? We'd love to hear from you. Here's how you can reach us...</p>
                </div>
                <div class="banner-img"><img src="../images/OIP.jpeg" alt="contact us image"></div>
            </div>

            <div class="contact-info">
                <div class="phone">
                    <img src="../images/apple.png" alt="phone-symbol">
                    <p class="phone-p">Interested in Quick Diagnosis? Just pick up the phone to chat with a member of our support
                        team.</p>
                    <span>+91-9876543210</span>
                </div>
                <div class="email">
                    <img src="../images/email.png" alt="email-symbol">
                    <p class="email-p">Sometimes we need a little more details to solve your problem or clear your doubts. Why not
                        email us.</p>
                    <span>support@quickdiagnosis.com</span>
                </div>
            </div>
        </main>
    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        }
    %>
</html>
