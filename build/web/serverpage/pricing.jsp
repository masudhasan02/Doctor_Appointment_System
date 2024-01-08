<%-- 
    Document   : pricing
    Created on : 20 Nov, 2023, 11:38:29 PM
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
        <title>Pricing</title>
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
            /* ///////////////////////////////////////////////  */
            /* //////////////////////////////////////////////  */
            .heading {
                font-size: 1.4em;
                text-align: center;
            }

            .heading h1,
            .heading p {
                max-width: 40%;
                margin: 20px auto;
            }

            /* ****************************************** */
            /* ****************************************** */
            .pricing-plans {
                display: flex;
                flex-direction: row;
                justify-content: space-around;
                margin: 40px 0 0 0;

            }

            .plan {
                display: flex;
                flex-direction: column;
                text-align: center;
                max-width: 80%;
            }

            .plan li {
                text-align: left;
            }

            .design {
                background-color: rgb(148, 195, 235);
                padding: 5%;
            }

            .feature {
                background-color: lemonchiffon;
                padding: 10%;
            }

            @media (max-width: 1222px) {
                .pricing-plans {
                    flex-direction: column;
                }
                .plan{
                    margin: 10px auto;
                }
                .plan li {
                    text-align: center;
                }

                ;
            }

            /* ---------------------------------------------------- */
            /* ---------------------------------------------------- */
            .btn {
                background-color: initial;
                background-image: linear-gradient(#8614f8 0, #760be0 100%);
                border-radius: 5px;
                border-style: none;
                box-shadow: rgba(245, 244, 247, .25) 0 1px 1px inset;
                color: #fff;
                cursor: pointer;
                display: inline-block;
                font-size: 16px;
                font-weight: 500;
                height: 60px;
                line-height: 60px;
                margin-top: 10px;
                margin-left: -4px;
                outline: 0;
                text-align: center;
                transition: all .3s cubic-bezier(.05, .03, .35, 1);
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                vertical-align: bottom;
                width: 190px;
            }

            .btn:hover {
                opacity: .7;
            }

            @media screen and (max-width: 1000px) {
                .btn {
                    font-size: 14px;
                    height: 55px;
                    line-height: 55px;
                    width: 150px;
                }
            }
            .design a{
                text-decoration: none;
                color: white;
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
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/sitemap.jsp">Site map</a></li>
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
                <h1>Quick Diagnosis plans start at less than ₹1000 a Month</h1>
                <p>You don't have to wait in the queue for your or your loved ones checkup. Just join a video meeting from
                    your home and have a
                    doctor's consultation with no hidden fees.</p>
            </div>
            <div class="pricing-plans">
                <div class="plan">
                    <div class="design">
                        <p>2 free sessions</p>
                        <p><span>₹999/month</span></p>
                        <a href="http://localhost:8080/DoctorAppointment/statpage/Payment_1.html"><button type="submit" class="btn" name="planType" value="3Specialist">Subcribe to QD</button></a>
                    </div>
                    <div class="feature">
                        <ul style="list-style-type:none;">
                            <li>2 free consultaion sessions with the doctor.</li>
                        </ul>
                    </div>
                </div>
                <div class="plan">
                    <div class="design">
                        <p>5 free sessions</p>
                        <p><span>₹3999/month</span></p>
                        <a href="http://localhost:8080/DoctorAppointment/statpage/Payment_5.html"><button type="submit" class="btn" name="planType" value="3Specialist">Subcribe to QD</button></a>
                    </div>
                    <div class="feature">
                        <ul style="list-style-type:none;">
                            <li>5 free consultation sessions with the doctor.</li>
                        </ul>
                    </div>
                </div>
                <div class="plan">
                    <div class="design">
                        <p>10 free sessions</p>
                        <p><span>₹5999/month</span></p>
                        <a href="http://localhost:8080/DoctorAppointment/statpage/Payment_6.html"><button type="submit" class="btn" name="planType" value="3Specialist">Subcribe to QD</button></a>
                    </div>
                    <div class="feature">
                        <ul style="list-style-type:none;">
                            <li>10 free consultation session with the doctor.</li>
                        </ul>
                    </div>
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
