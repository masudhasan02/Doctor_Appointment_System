<%-- 
    Document   : aboutus
    Created on : 20 Nov, 2023, 11:43:43 PM
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
        <title>About Us</title>
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

            /* Add styles for the cards here */
            .card {
                display: flex;
                flex-direction: row;
                margin: 20px;
            }

            .card h2,
            .card p {
                flex: 1;
                max-width: 70%;
                margin: 20px auto;
            }

            .card p {
                font-size: 1.15em;
            }

            .card h2 {
                font-size: 2.5em;
            }

            .card img {
                max-width: 50%;
                max-height: 100%;
            }

            /* .card:nth-child(odd) {
              flex-direction: row-reverse;
            } */

            /* Media query for tablets (e.g., 900px width) */
            @media (max-width: 900px) {
                .card {
                    flex-direction: column;
                }

                .card img {
                    max-width: 100%;
                }

                .card h2 {
                    font-size: 2em;
                }
            }

            /* Media query for mobile phones (e.g., 480px width) */
            @media (max-width: 480px) {
                .card img {
                    max-width: 100%;
                }

                .card p {
                    order: -1;
                }
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
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/contactus.jsp">Contact Us</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/feedback.jsp">Feedback</a></li>
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/signOut.jsp">Log out</a></li>
                        
                    </div>
                </div>
            </div>
        </nav>
    </header>
        <main>
            <div class="card">
                <img src="../images/goal.jpg" alt="" class="card-img">
                <div class="card-content">
                    <h2 class="card-h2">Our Goal</h2>
                    <p>At Quick Diagnosis, our unwavering mission is to make healthcare accessible and efficient for all. We are
                        committed to revolutionizing the way health diagnoses are conducted by ensuring they are not only accurate but
                        also affordable and prompt. We understand the crucial role that timely diagnosis plays in overall health and
                        well-being. That's why we have tirelessly worked to develop cutting-edge technologies and innovative solutions
                        that empower individuals to take control of their health. With our dedication to affordability and speed, we
                        aim to remove barriers to healthcare access, making it easier for everyone to prioritize their well-being and
                        live healthier lives. Your health is our priority, and we're here to make sure it's within reach for everyone.
                    </p>
                </div>
            </div>
            <div class="card">
                <img src="../images/achievements.jpg" alt="" class="card-img">
                <div class="card-content">
                    <h2 class="card-h2">Our achievements</h2>
                    <p>We take immense pride in our accomplishments at Quick Diagnosis, and one of our most significant achievements
                        over the past three years is having successfully conducted over 700,000 health diagnoses. Our commitment to
                        accuracy and precision has not only made us a trusted resource for individuals seeking answers about their
                        health but has also enabled us to accurately diagnose fatal health problems, saving lives in the process.
                        These accomplishments are a testament to the hard work and dedication of our team, as well as our unwavering
                        commitment to providing accessible and reliable healthcare solutions. We are determined to continue making a
                        positive impact on the lives of countless individuals by delivering accurate diagnoses and promoting better
                        health outcomes for all.</p>
                </div>
            </div>
            <div class="card">
                <img src="../images/awards.jpg" alt="" class="card-img">
                <div class="card-content">
                    <h2 class="card-h2">Awards</h2>
                    <p>At Quick Diagnosis, we are honored and humbled to have received multiple prestigious awards and recognitions
                        from both the Government of India and leading health governing bodies. These accolades stand as a testament to
                        our unwavering commitment to excellence in healthcare. Our dedication to innovation and our relentless pursuit
                        of improving healthcare access and diagnostics have been acknowledged and celebrated by esteemed institutions.
                        These awards not only validate our efforts but also inspire us to continuously raise the bar in delivering
                        top-notch healthcare solutions. We are immensely grateful for the trust and support bestowed upon us by the
                        Government of India and leading health governing bodies, and we remain steadfast in our mission to make
                        healthcare accessible, accurate, and efficient for all.</p>
                </div>
            </div>
            <div class="card">
                <img src="../images/partners.jpg" alt="" class="card-img">
                <div class="card-content">
                    <h2 class="card-h2">Our Partners</h2>
                    <p>At Quick Diagnosis, we take immense pride in our partnerships with a diverse and highly skilled team of
                        doctors. Our esteemed partners bring a wealth of experience to the table, with backgrounds ranging from 3 to
                        40 years of dedicated practice in the field of medicine, both in India and abroad. This collaboration of
                        seasoned professionals allows us to tap into a rich pool of knowledge and expertise, ensuring that our
                        healthcare solutions are informed by the latest advancements and global best practices. Their unwavering
                        commitment to patient care, combined with their deep understanding of the nuances of healthcare delivery,
                        strengthens our mission to provide accessible and accurate healthcare to individuals around the world. We are
                        privileged to work alongside these distinguished doctors, whose collective wisdom enhances the quality and
                        effectiveness of our services.</p>
                </div>
            </div>
            <div class="card">
                <img src="../images/commitment.jpg" alt="" class="card-img">
                <div class="card-content">
                    <h2 class="card-h2">Our Commitment</h2>
                    <p>At Quick Diagnosis, we are unwavering in our commitment to revolutionize healthcare access across India. Our
                        goal is clear: to ensure that every individual, regardless of their location or circumstance, has affordable
                        and rapid access to health diagnosis. We take immense pride in our ability to connect you with a qualified
                        doctor online within a maximum waiting period of just 2 minutes. We believe that time is of the essence when
                        it comes to health, and our streamlined approach is designed to eliminate unnecessary delays, providing you
                        with the care you need exactly when you need it. With our dedication to affordability and speed, we are
                        transforming the healthcare landscape in India, making it possible for everyone to prioritize their well-being
                        and embrace a healthier life. Your health is our priority, and we are here to ensure that it's always within
                        reach.</p>
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
