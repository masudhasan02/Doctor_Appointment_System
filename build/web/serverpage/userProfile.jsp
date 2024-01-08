<%-- 
    Document   : userProfile
    Created on : 19 Nov, 2023, 10:35:53 PM
    Author     : kargh
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
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
        <title><%= username%></title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .primary-button{
                background-color: #2294ed;
                border-radius: 6px;
                font-weight: 700;
                color: white !important;
                padding: 12px 24px;
                box-shadow: 0 0 2px #577592;
                transition: 0.2s ease-out;
                min-width: 190px;
            }
            .primary-button:hover{
                background-color: #1d69a3;
            }

            body {
                font-family: Roboto ,Inter, sans-serif;
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

            h1{
                text-align: center;
                margin: 30px;
                font-size: 2.5em;
            }

            .hero {
                align-items: center;
                display: flex;
                justify-content: flex-start;

            }

            .card {
                width: 120px;
                text-align: center;
            }

            .card img {
                border-radius: 20px;
                margin-top: 8px;
                margin-bottom: 10px;
            }

            .add-photo {
                border: none;
                padding: 0;
                color: #14BEF0;
                background: none;
                font-weight: bold;
                font-size: 12px;
                line-height: 20px;
                margin-right: 10px;
                font-family: Lato;

            }

            .add-photo-inp {
                display: none;
            }

            img {
                background-color: white;
                max-width: 100px;
                max-height: 100px;
                height: auto;
                vertical-align: middle;
                border: 0;

            }

            .container {
                max-width: 1100px;
                margin-inline: auto;
                padding-inline: 20px;
            }

            .flex {
                display: flex;
                align-items: center;
            }

            .feature-section {
                flex-wrap: wrap;
                gap: 100PX;
                margin: 20px auto;
            }

            .features-card {
                flex-direction: column;
                gap: 20px;
                max-width: 30%;
                text-align: center;
            }

            .under-div {
                color: #4a4a5a;
                height: 34px;
                width: 240px;
                padding: 6px 10px;
                font-size: 14px;
                font-family: Lato;
                line-height: 20px;
                border: 1px solid #CACAD3;
                box-sizing: border-box;
                box-shadow: none;
                border-radius: 2px;
                margin: 0;
            }

            .user-profile {
                display: inline-block;
                vertical-align: top;
                width: 240px;
                margin-right: 60px;
                justify-content: space-between;
            }

            .user-profile__header {
                width: 100%;
                height: 64px;
                font-weight: bold;
                font-size: 16px;
                padding: 22px 24px;
                border-bottom: 1px solid #868691;
                box-sizing: border-box;
                line-height: 20px;
            }

            p {
                line-height: 20px;
                border-bottom: 1px solid #a6a6b8;
            }
            .mandatory{
                position: absolute;
                margin: 20px 45% 0 45%;
                text-align: center;
            }
        </style>
    </head>

    <%
        OracleConnection oconn = null;
        OraclePreparedStatement ops = null;
        OracleResultSet ors = null;

        try {
            // STEP 4: REGISTRATION OF ORACLE DRIVER
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

            // STEP 5: INSTANTIATING THE CONNECTION
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@ohara:1521:ORCL", "ARGHYADEEP", "KUNDU");

            // STEP 6: INSTANTIATING THE STATEMENT OBJECT
            ops = (OraclePreparedStatement) oconn.prepareCall("select * from user_details where username = ?");

            ops.setString(1, username);

            // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
            ors = (OracleResultSet) ops.executeQuery();

            // Iterate through the result set and display the values
            while (ors.next()) {
                // Assuming you have columns like F_NAME, L_NAME, M_NAME, etc.
                String firstName = ors.getString("F_NAME");
                String lastName = ors.getString("L_NAME");
                String middleName = ors.getString("M_NAME");
                String email = ors.getString("EMAIL");
                long phn = ors.getLong("PHN");
                String gender = ors.getString("GENDER");
                // Add more variables for other columns as needed

                //operations
                if (gender.equalsIgnoreCase("m")) {
                    gender = "Male";
                } else if (gender.equalsIgnoreCase("f")) {
                    gender = "female";
                } else {
                    gender = "Rather not say";
                }
                // Display the values in your HTML
                if (middleName != null) {
    %>
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
                            <li><a href="http://localhost:8080/DoctorAppointment/serverpage/homepage.jsp">Home</a></li>
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
        <h1>Welcome, <%= username%>!</h1>

        <div class="container">

            <!-- section -->
            <div class="hero">
                <div class="card">
                    <h3>Profile photo</h3>
                    <img src="/web/images/medium_thumbnail (1).png" id="profile-pic" class="profile-img">
                </div>
            </div>


            <br>
            <!-- first section -->
            <p>Details</p>
            <br>
            <div class="feature-section flex">
                <div class="features-card">
                    <label for="">First Name</label><span>*</span>
                    <div class="under">
                        <input id="name" name="name" tabindex="1" type="text" value="<%= firstName%>" class="under-div" disabled>
                    </div>
                </div>

                <div class="features-card ">
                    <label>Middle Name </label>
                    <div class="under">
                        <input id="name" name="name" type="text" value="<%= middleName%>" class="under-div" disabled>
                    </div>
                </div>

                <div class="features-card ">
                    <label>Last Name</label>
                    <div class="under">
                        <input id="name" name="name" type="text" value="<%= lastName%>" class="under-div" disabled>
                    </div>
                </div>
            </div>

            <div class="feature-section flex">
                <div class="features-card">
                    <label>Gender</label><span>*</span>
                    <div class="under">
                        <input id="name" name="name" tabindex="1" type="text" value="<%= gender%>" class="under-div" disabled>
                    </div>
                </div>

                <div class="features-card ">
                    <label>Email Address</label>
                    <div class="under">
                        <input id="mobile" name="mobile" type="email" value="<%= email%>" class="under-div" disabled>
                    </div>
                </div>

                <div class="features-card ">
                    <label>Contact Number</label>
                    <div class="under">
                        <input type="text" value="<%= phn%>" autocomplete="off" class="under-div" disabled>
                    </div>
                </div>
            </div>
            <button class="primary-button" id="myButton">Change Password</button>
        </div>
    </div>
    <script>
        document.getElementById("myButton").addEventListener("click", function () {
            // Replace the URL with the link you want to go to
            window.location.href = "http://localhost:8080/DoctorAppointment/serverpage/validateEmail.jsp";
        });
    </script>
</body>
<%
} else if (middleName == null) {
%>
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
                        <li><a href="http://localhost:8080/DoctorAppointment/serverpage/homepage.jsp">Home</a></li>
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
    <h1>Welcome, <%= username%>!</h1>

    <div class="container">

        <!-- section -->
        <div class="hero">
            <div class="card">
                <img src="../images/medium_thumbnail.png" id="profile-pic" class="profile-img">
                <p><%= username%></p>
            </div>
        </div>


        <br>
        <!-- first section -->
        <p>Details</p>
        <br>
        <div class="feature-section flex">
            <div class="features-card">
                <label for="">First Name</label>
                <div class="under">
                    <input id="name" name="name" tabindex="1" type="text" value="<%= firstName%>" class="under-div" disabled>
                </div>
            </div>

            <div class="features-card ">
                <label>Last Name</label>
                <div class="under">
                    <input id="name" name="name" type="text" value="<%= lastName%>" class="under-div" disabled>
                </div>
            </div>
        </div>

        <div class="feature-section flex">
            <div class="features-card">
                <label>Gender</label>
                <div class="under">
                    <input id="name" name="name" tabindex="1" type="text" value="<%= gender%>" class="under-div" disabled>
                </div>
            </div>

            <div class="features-card ">
                <label>Email Address</label>
                <div class="under">
                    <input id="mobile" name="mobile" type="email" value="<%= email%>" class="under-div" disabled>
                </div>
            </div>

            <div class="features-card ">
                <label>Contact Number</label>
                <div class="under">
                    <input type="text" value="<%= phn%>" autocomplete="off" class="under-div" disabled>
                </div>
            </div>
        </div>
        <button class="primary-button" id="myButton">Change Password</button>
    </div>
</div>
<script>
    document.getElementById("myButton").addEventListener("click", function () {
        // Replace the URL with the link you want to go to
        window.location.href = "http://localhost:8080/DoctorAppointment/serverpage/validateEmail.jsp";
    });
</script>
</body>
<%
                }
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            try {
                if (ors != null) {
                    ors.close();
                }
                if (ops != null) {
                    ops.close();
                }
                if (oconn != null) {
                    oconn.close();
                }
            } catch (Exception ex) {
                out.println("<p>Error closing resources: " + ex.getMessage() + "</p>");
                ex.printStackTrace();
            }
        }
    } else {
        // Redirect to login if not logged in
        response.sendRedirect("login.jsp");
    }
%>
</html>
