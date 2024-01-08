<%-- Document : adminLogin Created on : 18 Nov, 2023, 11:53:38 PM Author : kargh --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            main {
                max-width: 400px;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #ccc;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #333;
            }

            form {
                margin-top: 20px;
            }

            table {
                width: 100%;
            }

            td {
                padding: 10px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                box-sizing: border-box;
            }

            input[type="submit"],
            input[type="reset"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover,
            input[type="reset"]:hover {
                background-color: #45a049;
            }
            .user{
                float: right;
            }
            .user a{
                text-decoration: none;
                color: #2773a5;
            }
        </style>
    </head>

    <body>
        <main>
            <h2>Admin Login</h2>
            <form action="http://localhost:8080/DoctorAppointment/AdminLogin" method="post">
                <table>
                    <tr><td>Enter Username:</td><td><input type="text" name="uname"></td></tr>
                    <tr><td>Enter Password:</td><td><input type="password" name="pass"></td></tr>
                    <tr><td><input type="submit" value="login"></td><td><input type="reset"></td></tr>
                    <tr><td></td><td><span class="user"><a href="http://localhost:8080/DoctorAppointment/serverpage/login.jsp">User Login</a></span></td></tr>

                </table>
            </form>
        </main>
        <footer>

        </footer>
    </body>

</html>