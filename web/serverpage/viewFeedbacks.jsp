<%-- 
    Document   : viewFeedbacks
    Created on : 22 Nov, 2023, 8:30:31 PM
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
    if (sess != null && sess.getAttribute("adminname") != null) {
        // User is logged in
        String username = (String) sess.getAttribute("adminname");
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
        <title>Feedback Records</title>
        <!--STEP 2: ADDING A INTERNAL STYLE FOR TABLE-->
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: roboto, sans-serif;
            }

            body {
                min-height: 100vh;
                background-color: whitesmoke;

            }

            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
            }

            img {
                width: 50px;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover {
                background-color: #111;
            }
            h1{
                font-size: 2.2em;
                margin: 30px auto;
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
        // STEP 4: REGISTRATION OF ORACLE DRIVER
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

        // STEP 5: INSTANTIATING TH             E CONNECTION
        oconn
                = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@ohara:1521:ORCL", "ARGHYADEEP", "KUNDU");

        // STEP 6: INSTANTIATING THE STATEMENT OBJECT
        ops = (OraclePreparedStatement) oconn.prepareCall("select username, star, feeds from feedback");

        // STEP 7: FILLING UP THE DATABASE RECORDS IN A TEMPORARY CONTAINER
        ors = (OracleResultSet) ops.executeQuery();

        // STEP 8: GETTING THE COLUMNS INFORMATION(METADATA)
        orsmd = (OracleResultSetMetaData) ors.getMetaData();
    %>
    <body>
        <header>
            <ul class="nav-list">
                <li class="nav-list-item"><img src="../images/QD.png" alt="logo"></li>
                <li class="nav-list-item"><a href="http://localhost:8080/DoctorAppointment/serverpage/adminHomePage.jsp">Home</a></li>
                <li class="nav-list-item"><a href="http://localhost:8080/DoctorAppointment/serverpage/adminSignOut.jsp">Logout</a></li>
            </ul>
        </header>
        <!--STEP 1: BASIC STRUCTURE OF A TABLE-->
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Star(s)</th>
                        <th>Comments</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        // STEP 10: BRINGING ALL THE RECORDS AND DISPLAYING AS TABLE ROWS
                        while (ors.next() == true) {

                    %>
                    <tr>
                        <%                            for (counter = 1; counter <= orsmd.getColumnCount(); counter++) {

                        %>
                        <td><%=ors.getString(counter)%></td>
                        <%
                            }%>
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