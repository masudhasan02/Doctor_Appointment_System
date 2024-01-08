<%-- 
    Document   : cardiologist
    Created on : 21 Nov, 2023, 6:35:10 PM
    Author     : kargh
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
        <title>Doctor Records</title>
        <!--STEP 2: ADDING A INTERNAL STYLE FOR TABLE-->
        <style>
            .unavailable-button {
                cursor: not-allowed;
                /* Add any other styling properties as needed */
            }




            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: roboto, sans-serif;
            }

            body {
                min-height: 100vh;
                background: whitesmoke;

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

            thead th span.icon-arrow {

                display: inline-block;
                width: 1.3rem;
                height: 1.3rem;
                border-radius: 50%;
                border: 1.4px solid transparent;
                text-align: center;
                font-size: 1rem;
                margin-left: .5rem;
                transition: .2s ease-in-out;
            }

            thead th:hover { 
                color: #00b0bd;
                cursor: default; 
            }

            thead th.active,tbody td.active {
                color: #00bd0d;
            }
            .table__body {
                width: 95%;
                max-height: calc(89% - 1.6rem);
                background-color: #fffb;
                margin: .8rem auto;
                border-radius: .6rem;
                overflow: overlay;
            }

            table {
                width: 100%;
            }

            td img {
                width: 36px;
                height: 36px;
                margin-right: .5rem;
                border-radius: 50%;

                vertical-align: middle;
            }

            table, th, td {
                border-collapse: collapse;
                padding: 1rem;
                text-align: left;
            }

            thead th {
                position: sticky;
                top: 0;
                left: 0;
                background-color: #d5d1defe;
                cursor: pointer;
                text-transform: capitalize;
            }

            tbody tr:nth-child(even) {
                background-color: #0000000b;
            }

            tbody tr {
                --delay: .1s;
                transition: .5s ease-in-out var(--delay), background-color 0s;
            }

            tbody tr.hide {
                opacity: 0;
                transform: translateX(100%);
            }

            tbody tr:hover {
                background-color: #fff6 !important;
            }

            tbody tr td,
            tbody tr td p,
            tbody tr td img {
                transition: .2s ease-in-out;
            }

            tbody tr.hide td,
            tbody tr.hide td p {
                padding: 0;
                font: 0 / 0 sans-serif;
                transition: .2s ease-in-out .5s;
            }

            tbody tr.hide td img {
                width: 0;
                height: 0;
                transition: .2s ease-in-out .5s;
            }
            .status {
                padding: .4rem 0;
                border-radius: 22px 6px ;
                text-align: center;
            }

            .status.available {
                background-color: #86e49d;
                color: #006b21;
            }

            .status.not-available {
                background-color: #d893a3;
                color: #b30021;
            }
            .mandatory{
                position: absolute;
                margin: 20px 45% 0 45%;
                text-align: center;
            }
        </style>
    </head>
    <%!
        // STEP 3: DECLARING OBJECTS AND VARIABLES
        OracleConnection oconn;
        OraclePreparedStatement ops;
        OracleResultSet ors;
        OracleResultSetMetaData orsmd;
        int counter, reccounter, colcounter;
    %>
    <%
        // Get today's date
        Calendar calendar = Calendar.getInstance();
        java.util.Date today = calendar.getTime();

        // Format the date to display the day
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE"); // EEEE gives the full day name
        String dayOfWeek = sdf.format(today);
        String day = "";

        if (dayOfWeek.equalsIgnoreCase("sunday")) {
            day = "sunday";
        } else if (dayOfWeek.equalsIgnoreCase("monday")) {
            day = "monday";
        } else if (dayOfWeek.equalsIgnoreCase("tuesday")) {
            day = "tuesday";
        } else if (dayOfWeek.equalsIgnoreCase("wednesday")) {
            day = "wednesday";
        } else if (dayOfWeek.equalsIgnoreCase("thursday")) {
            day = "thursday";
        } else if (dayOfWeek.equalsIgnoreCase("friday")) {
            day = "friday";
        } else {
            day = "saturday";
        }

        // STEP 4: REGISTRATION OF ORACLE DRIVER
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

        // STEP 5: INSTANTIATING TH             E CONNECTION
        oconn
                = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@ohara:1521:ORCL", "ARGHYADEEP", "KUNDU");

        // STEP 6: INSTANTIATING THE STATEMENT OBJECT
        ops = (OraclePreparedStatement) oconn.prepareCall("select name, specialization, practicing_hospital, years_of_experience," + day + ", timing, email from doctor_details where lower(specialization) = ?");

        ops.setString(1, "rheumatologist");
        // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
        ors = (OracleResultSet) ops.executeQuery();

        // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
        orsmd = (OracleResultSetMetaData) ors.getMetaData();
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
                            <li><a href="http://localhost:8080/DoctorAppointment/serverpage/userProfile.jsp">Profile</a></li>
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

        <!--STEP 1: BASIC STRUCTURE OF A TABLE-->
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th> Name </th>
                        <th> Specialization </th>
                        <th> Practicing Hospital </th>
                        <th> Years Of Experience </th>
                        <th> Status </th>
                        <th> Location </th>
                        <th> Timing </th>
                        <th> Action </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // STEP 10: BRINGING ALL THE RECORDS AND DISPLAYING AS TABLE ROWS
                        while (ors.next() == true) {
                            String temp = "";
                    %>
                    <tr>
                        <%
                            for (counter = 1; counter <= orsmd.getColumnCount(); counter++) {
                                if (counter == 5) {
                                    temp = ors.getString(counter);
                                    if (temp == null) {
                        %>
                        <td class="status not-available">Not Available</th><th></td>
                            <%
                            } else {
                            %>
                        <td class="status available">Available</th><th><%= temp%></td>
                            <%
                                }
                            } else if (counter == orsmd.getColumnCount()) {
                                if (temp == null) {
                            %>
                        <td><input type="submit" class="unavailable-button primary-button" disabled value="unavailable"></td>
                            <%
                            } else {
                            %>
                        <td><form action="http://localhost:8080/DoctorAppointment/BookAppointment" method="post">
                                <input type="hidden" name="doctorEmail" value="<%= ors.getString(counter)%>">
                                <input type="hidden" name="location" value="<%= temp%>">
                                <input type="submit" class="primary-button" value="Book an Appointment">
                            </form></td>
                            <%
                                }
                            } else {
                            %>
                        <td><%=ors.getString(counter)%></td>
                        <%
                                }
                            }
                        %>

                    </tr>
                    <%
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="10">&copy; QUICK DIAGNOSIS &reg; TECHNOLOGIES &trade;</td>
                    </tr>
                </tfoot>
            </table>
        </section>
        <%
            // STEP 11: CLOSING THE CONNECTIONS
            ors.close();
            ops.close();
            oconn.close();
        %>
    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        }
    %>
</html>