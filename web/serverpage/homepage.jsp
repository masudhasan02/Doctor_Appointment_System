<%-- 
    Document   : homepage
    Created on : 18 Nov, 2023, 1:13:15 PM
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            :root {
                --primary-text-color: #183b86;
                --secondary-text-color: #577592;
                --accent-color: #2294ed;
                --accent-color-dark: #1d69a3;
                --padding-inline-section: 20px;
            }

            body {
                font-family: 'Poppins', sans-serif;
                color: var(--primary-text-color);
            }

            h1 {
                font-size: 3rem;
            }

            h2 {
                font-size: 2rem;
            }

            h3 {
                font-size: 1.5rem;
            }

            p {
                font-family: 'Roboto';
                font-size: 1.2rem;
                color: var(--secondary-text-color);
                line-height: 1.8rem;
                padding-left: 10px;
            }

            ul {
                list-style: none;
            }

            a {
                text-decoration: none;
                display: inline-block;
            }

            /* Utility Classes */
            .small-bold-text {
                font-size: 1rem;
                font-weight: 700;
            }

            .container {
                max-width: 1200px;
                margin-inline: auto;
                padding-inline: var(--padding-inline-section);
                align-items: center;
            }

            .flex {
                display: flex;
                align-items: center;
            }

            .hover-link {
                color: var(--primary-text-color);
                transition: 0.2s ease-out;
            }

            .hover-link:hover {
                color: var(--accent-color);
            }

            .primary-button {
                background-color: var(--accent-color);
                border-radius: 6px;
                font-weight: 700;
                color: white !important;
                padding: 12px 24px;
                box-shadow: 0 0 2px var(--secondary-text-color);
                transition: 0.2s ease-out;
            }

            .primary-button:hover {
                background-color: var(--accent-color-dark);
            }

            .secondary-button {
                border: 0.5px solid var(--secondary-text-color);
                border-radius: 6px;
                font-weight: 700;
                color: var(--primary-text-color) !important;
                padding: 12px 24px;
                transition: 0.2s ease-out;
            }

            .secondary-button:hover {
                border-color: var(--accent-color);
                color: var(--accent-color) !important;
            }

            /* nav bar */
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

            /* COMPANY NAME */
            h1 {
                font-size: 80px;
                color: #8f0950;
                margin-top: 60px;
                text-align: center;
                -webkit-animation: glow 1s ease-in-out infinite alternate;
                -moz-animation: glow 1s ease-in-out infinite alternate;
                animation: glow 1s ease-in-out infinite alternate;
            }

            @-webkit-keyframes glow {
                from {
                    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
                }

                to {
                    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
                }
            }

            /* offer img */
            .offer-card {
                margin: 90px auto 30px;
                text-align: center;
            }

            .offer-card img {
                max-width: 70%;
            }

            /* example section */

            .examples-header {
                flex-direction: column;
                gap: 20px;
            }

            .examples-area {
                justify-content: space-between;
                margin-block: 30px;
            }

            .examples-card {
                width: 23%;
                position: relative;
                min-height: 300px;
                background: linear-gradient(rgb(0, 0, 0, 0.2), rgb(0, 0, 0, 0.8)), url(../images/ips_ah.webp);
                background-size: cover;
                transition: 0.2s ease-out;
            }

            .examples-card:hover {
                box-shadow: 0 0 10px #888;
            }

            .examples-card:nth-child(2) {
                background: linear-gradient(rgb(0, 0, 0, 0.2), rgb(0, 0, 0, 0.8)), url(../images/whychoseapollo_ah.webp);
                background-size: cover;
            }

            .examples-card:nth-child(3) {
                background: linear-gradient(rgb(0, 0, 0, 0.2), rgb(0, 0, 0, 0.8)), url(../images/transplant-disclaimer-min.jpg);
                background-size: cover;
            }

            .examples-card:nth-child(4) {
                background: linear-gradient(rgb(0, 0, 0, 0.2), rgb(0, 0, 0, 0.8)), url(../images/recruitment-disclaimer-min.jpg);
                background-size: cover;
            }

            .card-text {
                position: absolute;
                bottom: 20px;
                left: 20px;
                right: 20px;
                color: white;
            }

            /* header */
            /*header {
                padding: 50px var(--padding-inline-section) 0;
            }*/

            .header-section {
                justify-content: center;
                gap: 50px;
            }

            .header-left {
                max-width: 40vw;
            }

            .header-left h1 {
                margin-top: 20px;

            }

            .get-started-btn {
                margin-top: 20px;
            }

            .header-right {
                margin-left: 30px;
            }

            .header-right img {
                width: 330px;
            }

            .header-right:hover {
                box-shadow: 0 0 10px #888;
            }

            /* special section */
            .special-image img {
                margin-top: 30px;
                width: 250px;
                padding-bottom: 30px;
                filter: drop-shadow(16px 7px 8px #1396d2);
                border-radius: 50px;
            }

            .special-desc {
                flex-direction: column;
                align-items: flex-start;
            }

            .special-container {
                color: white;
                justify-content: space-around;
                display: flex;
            }

            .ul-listing {
                display: flex;
                gap: 40px;
            }

            .special-feature-section {
                background-color: #183b54;
                height: 500px;
            }

            .hover-linke-button {
                color: white;
                transition: 0.2s ease-out;
            }

            .hover-linke-button:hover {
                color: var(--accent-color);
            }

            .special-button-link {
                border: 0.5px solid var(--secondary-text-color);
                border-radius: 6px;
                font-weight: 600;
                padding: 12px 24px;
                transition: 0.2s ease-out;
            }

            /* footer */
            footer {
                padding-block: 70px;
                background-color: #ebf2fa;
            }

            .link-column {
                flex-direction: column;
                gap: 10px;

            }

            .footer-container {
                justify-content: space-between;
            }

            .flex {
                display: flex;
                align-items: center;
            }

            /* big feature section */

            .big-feature-section {
                padding: 30px 20px 0;
            }

            .big-features-container {
                gap: 30px;
            }

            .feature-img img {
                width: 100%;
            }

            .feature-desc {
                flex-direction: column;
                align-items: flex-start;
            }

            /* features section */
            .features-section {
                padding: 80px 20px 0;
            }

            .features-header {
                text-align: center;
            }

            .features-heading-text {
                margin-bottom: 20px;
            }

            .features-area {
                flex-wrap: wrap;
                justify-content: space-between;
                gap: 30px;
            }

            .features-card {
                flex-direction: column;
                gap: 20px;
                max-width: 30%;
            }

            .pg_widget {
                height: 106px;
            }

            .pg_widget:hover {
                transition: 0.5s;
                transform: scale(1.4);
                box-shadow: 0 0 20px 2px rgba(0, 0, 0, 0.1);
                background-size: cover;
            }

            .pg_widget {
                background: #fff;
                box-shadow: 0px 0px 36px rgb(16 40 81 / 12%);
                padding: 16px 10px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                flex-direction: column;
                justify-content: center;
                border: 1px solid #fff;
                cursor: pointer;
            }

            .row {
                --bs-gutter-x: 1.5rem;
                --bs-gutter-y: 0;
                display: flex;
                flex-wrap: wrap;
                margin-top: calc(-1 * var(--bs-gutter-y));
                margin-right: calc(-.5 * var(--bs-gutter-x));
                margin-left: calc(-.5 * var(--bs-gutter-x));
            }

            a {
                text-decoration: none;
                display: inline-block;
            }

            /* sub footer */
            .subfooter {
                padding: 10px;
                background-color: #b9cde4;
                padding: 20px;
            }

            .subfooter-container {
                justify-content: center;
                gap: 30px;
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
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/pricing.jsp">Pricing</a></li>
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
            <div class="company-logo">
                <h1>Quick Diagnosis</h1>
            </div>
            <div class="offer-card">
                <img src="../images/Slide1.jpg" alt="" srcset="">
            </div>
        </main>


        <!-- big feature section -->

        <section class="big-feature-section">
            <div class="container flex big-features-container">
                <div class="feature-img">
                    <img src="../images/Newfolder/speciality_ah_m.webp" alt="">
                </div>
                <div class="feature-desc flex">
                    <h4>Effortless validation for</h4>
                    <h3> professional Doctors</h3>
                    <p>Experience the convenience of securing a doctor's appointment from the comfort of your home with
                        Quick
                        Diagnosis. Say goodbye to the hassle of traveling to the clinic and enduring long queues for an
                        appointment.</p>
                    <br>
                </div>
            </div>
        </section>


        <section class="big-feature-section">
            <div class="container flex big-features-container">
                <div class="feature-desc flex">
                    <h4>That's not all –</h4>
                    <h3>Enjoy complimentary doctor consultations</h3>
                    <p>simply by utilizing our services.
                        We prioritize your well-being and make accessing healthcare easier than ever.
                    </p>
                    <p>We use Usability Hub tests to help us make decisions for various projects. From web and mobile design
                        to marketing activities.</p>

                </div>
                <div class="feature-img">
                    <img src="../images/AUME-Doctor-Appointments.jpg" alt="">
                </div>
            </div>
        </section>



        <!-- feature section -->

  <section class="features-section">

    <div class="container ">

         <div class="features-header">
            <h2 class="features-heading-text">I AM YOUR DOCTOR QD</h2>
            <a class="secondary-button" >See All Secialization➡️</a>
         </div>
<br>
     <div class="features-area flex">
                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/cardiologist.jsp" class="pg_widget" id="COE_Cardiology">
                        <img src="../images/Newfolder/cardiology_icon.svg" alt="icon">
                        <h5>Cardiology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/neurologist.jsp" class="pg_widget" id="COE_Neurology">
                        <img src="../images/Newfolder/neurology.svg" alt="icon">
                        <h5>Neurology</h5>
                    </a>
                </div>

                 <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/gastroenterologist.jsp" class="pg_widget" id="COE_Gastroenterology">
                        <img src="../images/Newfolder/gastroenterology.svg" alt="icon">
                        <h5>Gastroenterology</h5>
                    </a>
                </div>
                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/orthopaedic.jsp" class="pg_widget" id="COE_Orthopaedic">
                        <img src="../images/Newfolder/orthopaedic.svg" alt="icon">
                        <h5>Orthopaedic</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/oncologist.jsp" class="pg_widget" id="COE_Oncology">
                        <img src="../images/Newfolder/oncology_icon.svg" alt="icon">
                        <h5>Oncology</h5>
                    </a>
                </div>


                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/gynecologist.jsp" class="pg_widget" id="COE_Gynecology">
                        <img src="../images/Newfolder/gynecology.svg" alt="icon">
                        <h5>Gynecology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/dermatologist.jsp" class="pg_widget" id="COE_Dermatology">
                        <img src="../images/Newfolder/dermatology.svg" alt="icon">
                        <h5>Dermatology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/ophthalmologist.jsp" class="pg_widget" id="COE_Ophthalmology">
                        <img src="../images/Newfolder/ophthalmology.svg" alt="icon">
                        <h5>Ophthalmology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/pediatrics.jsp" class="pg_widget" id="COE_Pediatrics">
                        <img src="../images/Newfolder/paediatricurology.svg" alt="icon">
                        <h5>Pediatrics</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/endocrinologist.jsp" class="pg_widget" id="COE_Endocrinology">
                        <img src="../images/Newfolder/endocrinology.svg" alt="icon">
                        <h5>Endocrinology</h5>
                    </a>
                </div>

                
                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/urologist.jsp" class="pg_widget" id="COE_Urology">
                        <img src="../images/Newfolder/urology.svg" alt="icon">
                        <h5>Urology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/nephrologist.jsp" class="pg_widget" id="COE_Nephrology">
                        <img src="../images/Newfolder/nephrology.svg" alt="icon">
                        <h5>Nephrology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/pulmonologist.jsp" class="pg_widget" id="COE_Pulmonology">
                        <img src="../images/Newfolder/pulmonology.svg" alt="icon">
                        <h5>Pulmonology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/rheumatologist.jsp" class="pg_widget" id="COE_Rheumatology">
                        <img src="../images/Newfolder/rheumatology.svg" alt="icon">
                        <h5>Rheumatology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/neuroSurgeon.jsp" class="pg_widget" id="COE_Neurosurgery">
                        <img src="../images/Newfolder/neurology.svg" alt="icon">
                        <h5>Neurosurgery</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/radiologist.jsp" class="pg_widget" id="COE_Radiology">
                        <img src="../images/Newfolder/radiology.svg" alt="icon">
                        <h5>Radiology</h5>
                    </a>
                </div>


                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/plasticSurgeon.jsp" class="pg_widget" id="COE_Plasticsurgery">
                        <img src="../images/Newfolder/plasticsurgery.svg" alt="icon">
                        <h5>Plastic surgery</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/neonatologist.jsp" class="pg_widget" id="COE_Neonatology">
                        <img src="../images/Newfolder/neonatology.svg" alt="icon">
                        <h5>Neonatology</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/vascularSurgeon.jsp" class="pg_widget" id="COE_VascularSurgery">
                        <img src="../images/Newfolder/vascularsurgery.svg" alt="icon">
                        <h5>Vascular Surgery</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/phychiatry.jsp" class="pg_widget" id="COE_Psychiatry">
                        <img src="../images/Newfolder/psychiatry.svg" alt="icon">
                        <h5>Psychiatry</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/cabg.jsp" class="pg_widget" id="COE_Cabg">
                        <img src="../images/Newfolder/cabg_icon.webp" alt="icon">
                        <h5>Cabg</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/thyroidectomy.jsp" class="pg_widget" id="COE_Thyroidectomy">
                        <img src="../images/Newfolder/Thyroidectomy.svg" alt="icon">
                        <h5>Thyroidectomy</h5>
                    </a>
                </div>

                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/dentistry.jsp" class="pg_widget" id="COE_Dentistry">
                        <img src="../images/Newfolder/dentistry.svg" alt="icon">
                        <h5>Dentistry</h5>
                    </a>
                </div>
                
                
                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/angioplasty.jsp" class="pg_widget" id="Angioplasty">
                        <img src="../images/Newfolder/Angioplasty.svg" alt="icon">
                        <h5>Angioplasty</h5>
                    </a>
                </div>



                <div class="features-card flex">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/ent.jsp" class="pg_widget" id="COE_ENT">
                        <img src="../images/Newfolder/ent.svg" alt="icon">
                        <h5>ENT (Ear, Nose, Throat)</h5>
                    </a>
                </div>
                

            </div>
            </div>
        </section>

        <!-- example section -->
        <!--  examples section-->
        <br>
        <br>



        <!-- another section -->
        <div class="container header section flex">
            <div class="header-left">
                <h2>Articles from health experts</h2>
                <p>Health articles that keep you informed about</p>
                <p>good health practices and achieve your goals.</p>
                <a href="https://www.who.int/health-topics/" target="_blank" class="primary-button get-started-btn">Read All Articles</a>
            </div>

            <div class="header-right">
                <a href="https://ourworldindata.org/coronavirus" target="_blank"><img src="../images/Newfolder/th.jpeg" alt="" style="height: 210px;"></a>
                <p>12 Coronavirus Myths and Facts</p>
                <p> That You Should Be Aware </p>
            </div>
            <div class="header-right">
                <a href="https://www.health.harvard.edu/staying-healthy/how-to-boost-your-immune-system" target="_blank"><img src="../images/how-to-eat-your-vitamins-768x614.jpg" alt="" style="height: 210px;"></a>
                <p>Eating Right to Build Immunity Against</p>
                <p> Cold and Viral Infections
            </div>

        </div>
        <br><br>



        <!-- example card -->
        <section class="examples-section">
            <div class="container">
                <div class="examples-header flex">
                    <h2 class="examples-heading-text">Disclaimer</h2>
                   <!-- <a href="#" class="secondary-button">See more examples ➡️</a>-->
                </div>
                <div class="examples-area flex">
                    <a href="#" class="examples-card">
                        <h3 class="card-text">Only doctors practicing in hospitals are available. </h3>
                    </a>

                    <a href="#" class="examples-card">
                        <h3 class="card-text">We keep our patient's data secure.</h3>
                    </a>

                    <a href="#" class="examples-card">
                        <h3 class="card-text">We do not offer money for kidney donation.</h3>
                    </a>

                    <a href="#" class="examples-card">
                        <h3 class="card-text">We are not responsible for any surgeries.</h3>
                    </a>
                </div>
            </div>
        </section>



        <!--  special section -->
        <div class="special-feature-section">
            <div class="container special-container">
                <div class="special-desc">
                    <h2 style="padding:40px 0;color:white;">Why Choose Quick Diagnosis?</h2>
                    Experience the convenience of securing a doctor's appointment from <br>
                    the comfort of your home with Quick Diagnosis. Say goodbye to the hassle<br>
                    of traveling to the clinic and enduring long queues for an appointment. <!--That's not all – enjoy complimentary doctor consultations simply by utilizing our services. We prioritize your well-being and make accessing healthcare easier than ever.-->
                    <p style="font-weight: 600; color: white;">Our panel includes:</p><br>

                    <div class="ul-listing">
                        <ul role="list" style="list-style: circle; ">
                            <li style="margin-top: 5px;">complimentary doctor consultations</li>
                            <li style="margin-top: 5px;"><u>accessing health care easier</u></li>
                            <li style="margin-top: 5px;">guaranteed doctor appointment</li>
                        </ul>
                        <ul role="list" style="list-style: circle;">
                            <li style="margin-top: 5px;">Coverage in 10+ cities</li>
                            <li style="margin-top: 5px;">Average consultation of 20minutes</li>
                            <li style="margin-top: 5px;">No fake doctors guarantee</li> <br>
                            <br>
                        </ul>
                    </div>
                </div>
                <div class="special-image">
                    <img src="../images/Doctor-Appointments-P-copy-768x1152.png" alt="">
                </div>
            </div>
        </div>



        <!-- footer -->
        <footer>
            <div class="container flex footer-container">
                <a href="#" class="company-logo">
                    <img src="../images/doctor.jpg" alt="" style="width: 150px;">
                </a>
                <div class="link-column flex" style="align-items: flex-start;">
                    <h4>Find Doctor</h4>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/cardiologist.jsp" class="hover-link">Cardiologist</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/neurologist.jsp" class="hover-link">Neurologist</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/gastroenterologist.jsp" class="hover-link">gastroenterologist</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/oncologist.jsp" class="hover-link">Oncologist</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/dermatologist.jsp" class="hover-link">Dermatologist</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/urologist.jsp" class="hover-link">Urologist</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/pulmonologist.jsp" class="hover-link">Pulmonologist</a>
                </div>

               

                <div class="link-column flex" style="align-items: flex-start;">
                    <h4>Resources</h4>
                    <a href="https://ourworldindata.org/coronavirus" class="hover-link">Coronavirus</a>
                    <a href="https://ourworldindata.org/obesity" class="hover-link">Obesity</a>
                    <a href="https://ourworldindata.org/smoking" class="hover-link">Smoking</a>
                    <a href="https://ourworldindata.org/alcohol-consumption" class="hover-link">Alcohol Consumption</a>
                    <a href="https://ourworldindata.org/hiv-aids" class="hover-link">HIV/AIDS</a>
                    <a href="https://ourworldindata.org/malaria" class="hover-link">Malaria</a>
                    <a href="https://ourworldindata.org/tetanus" class="hover-link">Tetanus</a>
                    <a href=https://ourworldindata.org/cancer"" class="hover-link">Cancer</a>
                </div>

                <div class="link-column flex" style="align-items: flex-start;">
                    <h4>Quick Diagnosis</h4>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/aboutus.jsp" class="hover-link">About Us</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/contactus.jsp" class="hover-link">Contact Us</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/feedback.jsp" class="hover-link">Feedback</a>
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/pricing.jsp" class="hover-link">Pricing</a>
                </div>

            </div>
        </footer>


        <!-- sub footer -->
        <div class="subfooter">
            <div class="container flex subfooter-container">
                <a target="_blank" href="http://localhost:8080/DoctorAppointment/statpage/termsAndConditions.html" class="hover-lniks">Privacy Policy</a>
                <a target="_blank" href="http://localhost:8080/DoctorAppointment/statpage/termsAndConditions.html" class="hover-lniks">Terms & Condition</a>
                <a target="_blank" href="http://localhost:8080/DoctorAppointment/statpage/termsAndConditions.html" class="hover-lniks">Security Information</a>
                <a href="www.facebook.com" target="_blank" class="hover-links"><i class="fa-brands fa-facebook"></i></a>
                <a href="www.twitter.com" target="_blank" class="hover-links"><i class="fa-brands fa-twitter"></i></a>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/1fbca38778.js" crossorigin="anonymous"></script>
    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        }
    %>
</html>