<%-- Document : adminHomePage Created on : 19 Nov, 2023, 12:15:08 AM Author : kargh --%>
<%-- http://localhost:8080/DoctorAppointment/serverpage/adminHomePage.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <title>Admin HomePage</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Inter, sans-serif;
                text-align: center;
                background: linear-gradient(45deg, white, rgb(223, 218, 218));
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

            .container {
                display: flex;
                flex-direction: column;
                width: 80%;
                min-width: 950px;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .container-card {
                display: flex;
                flex-direction: row;
                width: 90%;
                margin: 30px auto;
                padding: 20px;
                justify-content: space-around;
            }

            @media(max-width:800px){
                .container-card{
                    flex-direction: column;
                }
                .container-card .card{
                    margin: 20px auto;
                }
            }

            .card {
                max-width: 500px;
                text-align: center;
                min-width: 300px;
                margin: 10px;
                background-color: rgb(188, 188, 255);
            }

            .card a{
                text-decoration: none;
                color: black;
            }

        </style>
    </head>

    <body>
        <header>
            <ul class="nav-list">
                <li class="nav-list-item"><img src="../images/QD.png" alt="logo"></li>
                <li class="nav-list-item"><a href="http://localhost:8080/DoctorAppointment/serverpage/adminSignOut.jsp">Logout</a></li>
            </ul>
        </header>
        <h1>Admin HomePage</h1>
        <div class="container">
            <div class="container-card">
                <div class="card">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/adminViewUsers.jsp"><h2>User Details</h2></a>
                    <p>Check all the user data</p>
                </div>
                <div class="card">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/adminDoctorDetails.jsp"><h2>Doctor Details</h2></a>
                    <p>Check all the doctor data</p>
                </div>
            </div>
            <div class="container-card">
                <div class="card">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/adminAddDoc.jsp"><h2>Add Doctor</h2></a>
                    <p>Add a doctor to the database</p>
                </div>
                <div class="card">
                    <a href="http://localhost:8080/DoctorAppointment/serverpage/viewFeedbacks.jsp"><h2>View Feedbacks</h2></a>
                    <p>View all the feedbacks of the user</p>
                </div>
            </div>
        </div>
    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("adminLogin.jsp");
        }
    %>
</html>