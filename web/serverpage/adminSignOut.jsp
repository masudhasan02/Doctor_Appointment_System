<%-- 
    Document   : adminSignOut
    Created on : 21 Nov, 2023, 12:00:21 AM
    Author     : kargh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession sesss = request.getSession(false);
    if (sesss != null && sesss.getAttribute("adminname") != null) {
        // User is logged in
        String username = (String) sesss.getAttribute("adminname");
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
        <title>JSP Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Roboto, Inter, sans-serif;
                background-color: whitesmoke;
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
        </style>
    </head>
    <body>
        <main>
            <div class="main-img">
                <img src="../images/door.png" alt="logout image">
            </div>
            <div class="confirmation">
                <p>Are you leaving?</p>
                <div class="choice">
                    <form action="http://localhost:8080/DoctorAppointment/AdminSignOut" method="post">
                        <input type="submit" value="Yes">
                    </form>
                    <button class="no" onclick="redirectToHomepage()">No</button>   
                </div>
            </div>
        </main>
        <script>
            function redirectToHomepage() {
                // Redirect to the specified URL
                window.location.href = 'http://localhost:8080/DoctorAppointment/serverpage/adminHomePage.jsp';
            }
        </script>
    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("adminLogin.jsp");
        }
    %>
</html>
