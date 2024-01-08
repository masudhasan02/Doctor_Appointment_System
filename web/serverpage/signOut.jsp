<%-- 
    Document   : signOut
    Created on : 20 Nov, 2023, 11:15:54 AM
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
        <title>Logout confirmation</title>
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

            .main-img img {
                width: 30%;
                min-width: 320px;
            }
            .main-img{
                text-align: center;
            }
            .confirmation{
                text-align: center;
                font-size: 1.3em;
            }
            .choice button{
                margin: 10px 10px;
                padding: 1% 30px;
            }
            .choice input{
                margin: 10px 10px;
                padding: 1% 30px;
            }
            .choice input{
                background-color: rgb(236, 138, 139);
            }
            .choice input:hover{
                background-color: rgb(213, 94, 94);
            }
            .no{
                background-color: rgb(125, 235, 125);
            }
            .no:hover{
                background-color: rgb(81, 195, 81);
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
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/contactus.jsp">Contact Us</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/feedback.jsp">Feedback</a></li>
                        
                    </div>
                </div>
            </div>
        </nav>
    </header>
        <main>
            <div class="main-img">
                <img src="../images/door.png" alt="logout image">
            </div>
            <div class="confirmation">
                <p>Are you leaving?</p>
                <div class="choice">
                    <form action="http://localhost:8080/DoctorAppointment/SignOut" method="post">
                        <input type="submit" value="Yes">
                    </form>
                    <button class="no" onclick="redirectToHomepage()">No</button>   
                </div>
            </div>
        </main>
        <script>
            function redirectToHomepage() {
                // Redirect to the specified URL
                window.location.href = 'http://localhost:8080/DoctorAppointment/serverpage/homepage.jsp';
            }
        </script>
    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        }
    %>
</html>
