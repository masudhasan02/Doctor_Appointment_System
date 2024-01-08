<%-- 
    Document   : feedback
    Created on : 20 Nov, 2023, 11:49:55 PM
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
        <title>Feedback</title>
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
                max-width: 1100px;
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


            /* styling */


            .heading {
                text-align: center;
                margin: 20px auto;
                font-size: 1.5em;
            }

            h1 {
                background-image: linear-gradient(45deg, #FFC700, #FF009D);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                font-size: 48px;
                text-align: center;
            }
            .mixing {

                font-size: 20px;
                display: inline-block;
                text-align: center;
                background: linear-gradient(to left, red, blue);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }



            .comment {
                background-color: hsl(174, 75%, 48%);
                width: 50%;
                margin-left: 25%;
                text-align: center;
                border-radius: 10px;
                padding: 5px;
                color: rgb(14, 13, 12);
            }

            .Email {
                background-color: rgb(247, 246, 246);
                border: none;
                padding: 20px 20px 20px 20px;
                margin-top: 10px;
                text-align: start;
                font-family: Roboto,sans-serif;
            }

            .but {
                width: 45%;
                padding: 10px;
                margin: 15px;
                border: none;
                border-radius: 4px;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                font-weight: bolder;
                border-radius: 8px;

            }
            .but:hover{
                opacity: 0.8;
            }
            .rating {
                display: inline-block;
                unicode-bidi: bidi-override;
                direction: rtl;
            }

            .rating input {
                display: none;
            }

            .rating label {
                float: right;
                padding: 0 2px;
                color: #ccc;
                cursor: pointer;
            }

            .rating label:before {
                content: '\2605';
                font-size: 60px;
            }

            .rating input:checked ~ label {
                color: #FFD700;
            }

            .rating:not(:checked) > label:hover,
            .rating:not(:checked) > label:hover ~ label {
                color: #FFD700;
            }



            .mandatory{
                position: absolute;
                margin: 20px 45% 0 45%;
                text-align: center;
            }
        </style>
    </head>
    <body>
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
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/signOut.jsp">Log out</a></li>
                        
                    </div>
                </div>
            </div>
        </nav>
    </header>



        <div class="heading">
            <h1 >Leave us your feedback!</h1>

            <p>Please provide your valuable feedback and something something ...</p>

        </div>

        <form class="comment" action="http://localhost:8080/DoctorAppointment/Feedback" method="post">
            <h2> Have a suggestion?</h2>
            <p>
                <label class="mixing">Please give your response</label></p>

            <textarea class="Email"  name="feeds" id="" cols="40" rows="6"  placeholder="Comment About Your Experience" oninput="limitTextarea(this, 500)" required></textarea>

                      <div class="container">
                      <div class="rating">
                    <input type="radio" name="star" id="star5" value="5"><label for="star5"></label>
                    <input type="radio" name="star" id="star4" value="4"><label for="star4"></label>
                    <input type="radio" name="star" id="star3" value="3"><label for="star3"></label>
                    <input type="radio" name="star" id="star2" value="2"><label for="star2"></label>
                    <input type="radio" name="star" id="star1" value="1"><label for="star1"></label>
                </div>
                </div>

                    <input type="submit" class="but">
        </form>


        <script>
            function limitTextarea(element, maxLength) {
                let value = element.value;
                if (value.length > maxLength) {
                    element.value = value.substring(0, maxLength);
                }
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
