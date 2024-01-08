<%-- 
    Document   : adminAddDoc
    Created on : 19 Nov, 2023, 12:14:53 AM
    Author     : kargh
--%>
<%-- http://localhost:8080/DoctorAppointment/serverpage/adminAddDoc.jsp --%>
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
        <title>Add Doctor</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
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

            main, footer {
                margin: 10px;
                padding: 20px;
                border: 1px solid #ccc;
            }

            header, footer{
                text-align: center;
            }

            header a{
                float: left;
            }

            form {
                max-width: 600px;
                margin: 0 auto;
            }

            label {
                display: block;
                margin-bottom: 5px;
            }

            input, select {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                box-sizing: border-box;
            }

            input[type="submit"], input[type="reset"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover, input[type="reset"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <header>
            <ul class="nav-list">
                <li class="nav-list-item"><img src="../images/QD.png" alt="logo"></li>
                <li class="nav-list-item"><a href="http://localhost:8080/DoctorAppointment/serverpage/adminHomePage.jsp">Home</a></li>
                <li class="nav-list-item"><a href="http://localhost:8080/DoctorAppointment/serverpage/adminSignOut.jsp">Logout</a></li>
            </ul>
        </header>
        <main>
            <h2>Add a Doctor to the database</h2>
            <form action="http://localhost:8080/DoctorAppointment/AddDoc    " method="post">
                <input type="text" name="name" placeholder="Doctor's Name" required>
                <input type="email" name="email" placeholder="Doctor's Email Address">
                <input type="text" name="yoe" placeholder="Doctor's Years of Experience" required>
                <label for="spec">Doctor Specialization:</label>
                <select name="spec" required>
                    <option value="" disabled selected>Choose your option</option>
                    <option value="cardiologist">Cardiologist</option>
                    <option value="neurologist">Neurologist</option>
                    <option value="gastroenterologist">Gastroenterologist</option>
                    <option value="orthopaedic">Orthopaedic</option>
                    <option value="oncologist">Oncologist</option>
                    <option value="gynecologist">Gynecologist</option>
                    <option value="dermatologist">Dermatologist</option>
                    <option value="Ophthalmologist">Ophthalmologist</option>
                    <option value="Pediatrics">Pediatrics</option>
                    <option value="Endocrinologist">Endocrinologist</option>
                    <option value="Urologist">Urologist</option>
                    <option value="Nephrologist">Nephrologist</option>
                    <option value="Pulmonologist">Pulmonologist</option>
                    <option value="Rheumatologist">Rheumatologist</option>
                    <option value="Neuro surgeon">Neuro surgeon</option>
                    <option value="Radiologist">Radiologist</option>
                    <option value="Plastic surgeon">Plastic surgeon</option>
                    <option value="Neonatologist">Neonatologist</option>
                    <option value="Vascular Surgeon">Vascular Surgeon</option>
                    <option value="Psychiatry">Psychiatry</option>
                    <option value="Cabg">Cabg</option>
                    <option value="Thyroidectomy">Thyroidectomy</option>
                    <option value="Dentistry">Dentistry</option>
                    <option value="Angioplasty">Angioplasty</option>
                    <option value="ENT">ENT (Ear, Nose, Throat)</option>

                </select>
                <input type="text" name="prac" placeholder="Doctor's Practicing Hospital" required>

                <input type="text" placeholder="Chamber Location On Sunday" name="sun">
                <input type="text" placeholder="Chamber Location On Monday" name="mon">
                <input type="text" placeholder="Chamber Location On Tuesday" name="tue">
                <input type="text" placeholder="Chamber Location On Wednesday" name="wed">
                <input type="text" placeholder="Chamber Location On Thursday" name="thu">
                <input type="text" placeholder="Chamber Location On Friday" name="fri">
                <input type="text" placeholder="Chamber Location On Saturday" name="sat">

                <input type="text" name="timing" placeholder="Doctor Appointment timing"required>


                <input type="submit" placeholder="Add">
                <input type="reset" placeholder="Reset">
            </form>
        </main>
        <footer>
            <p>&copy; QUICK DIAGNOSIS &reg; TECHNOLOGIES &trade;</p>
        </footer>
    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("adminLogin.jsp");
        }
    %>
</html>
