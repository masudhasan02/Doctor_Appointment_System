<%-- 
    Document   : sitemap
    Created on : 20 Nov, 2023, 11:47:48 PM
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
<%--     <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        }
    %> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Site Map</title>
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

            /* heading */
            .heading {
                font-size: 40px;
                margin: 30px auto 20px auto; 
                padding: 30px auto;
                text-align: center;
            }

            .heading span {
                font-size: 55px;
            }

            .heading-desc {
                font-size: 22px;
                max-width: 100 px;
                margin: 20px auto;
                text-align: center;
            }

            /* links */
            .links {
                font-size: 20px;
                text-align: center;
            }
            .links p{
                line-height: 30px;
            }
            main a {
                text-decoration: none;
                color: blue;
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
                            <li><a href="http://localhost:8080/DoctorAppointment/serverpage/aboutus.jsp">About Us</a></li>
                            <li><a href="http://localhost:8080/DoctorAppointment/serverpage/contactus.jsp">Contact Us</a></li>
                            <li><a href="http://localhost:8080/DoctorAppointment/serverpage/feedback.jsp">Feedback</a></li>
                            <li><a href="http://localhost:8080/DoctorAppointment/serverpage/signOut.jsp">Log out</a></li>

                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <main>
            <div class="heading">
                <p><span>F</span>eeling <span>L</span>ost<span>?</span></p>
            </div>
            <div class="heading-desc">
                <p>Don't worry! Here you can find all the links to the pages provided by us.</p>
            </div>
            <div class="links"><br>
                <p>Get to know about us at <a href="http://localhost:8080/DoctorAppointment/serverpage/aboutus.jsp">About Us</a></p><br>
                <p>Check you data from <a href="http://localhost:8080/DoctorAppointment/serverpage/useProfile.jsp">Profile</a></p><br>
                <p>Want to get in touch? <a href="http://localhost:8080/DoctorAppointment/serverpage/contactus.jsp">Contact Us</a></p><br>
                <p>Share your valuable feedbacks at <a href="http://localhost:8080/DoctorAppointment/serverpage/feedback.jsp">Feedback</a></p><br>
                <p>You can go to home-page from <a href="http://localhost:8080/DoctorAppointment/serverpage/homepage.jsp">Home</a></p><br>
                <p>Sign out from Quick Diagnosis <a href="/http://localhost:8080/DoctorAppointment/serverpage/signOut.jsp">Logout</a></p><br>
                <p>Learn about our subscription plans <a href="http://localhost:8080/DoctorAppointment/serverpage/pricing.jsp">Pricing</a></p><br>
                <p>Update your password <a href="http://localhost:8080/DoctorAppointment/serverpage/validateEmail.jsp">Pricing</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/cardiologist.jsp">cardiologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/neurologist.jsp">neurologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/gastroenterologist.jsp" >gastroenterologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/orthopaedic.jsp">orthopaedic</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/oncologist.jsp">oncologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/gynecologist.jsp" >gynecologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/dermatologist.jsp" >dermatologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/ophthalmologist.jsp" >Ophthalmologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/pediatrics.jsp" >Pediatrics</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/endocrinologist.jsp" >Endocrinologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/urologist.jsp" >Urologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/nephrologist.jsp" >Nephrologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/pulmonologist.jsp" >Pulmonologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/rheumatologist.jsp" >Rheumatologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/neuroSurgeon.jsp" >surgeon</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/radiologist.jsp" >Radiologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/plasticSurgeon.jsp" >Plastics surgeon</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/neonatologist.jsp" >Neonatologist</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/vascularSurgeon.jsp" >Vascular Surgeon</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/phychiatry.jsp" >Psychiatry</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/cabg.jsp" >Cabg</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/thyroidectomy.jsp">Thyroidectomy</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/dentistry.jsp" >Dentistry</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/angioplasty.jsp" >Angioplasty</a></p><br>
                <p><a href="http://localhost:8080/DoctorAppointment/serverpage/ent.jsp" >ENT</a></p><br>
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
