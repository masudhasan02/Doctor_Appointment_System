<%-- 
    Document   : userOtpVerification
    Created on : 22 Nov, 2023, 11:40:36 PM
    Author     : kargh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession sess = request.getSession(false);
    if (sess != null && sess.getAttribute("username") != null) {
        // User is logged in

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify OTP</title><style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            h2 {
                color: #333;
            }

            p {
                color: #666;
            }

            #otpInput {
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 200px;
                box-shadow: 2px 2px 5px #2773a5;
            }

            #verifyBtn,
            #resendBtn {
                padding: 10px 20px;
                margin: 5px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #verifyBtn {
                background-color: #4CAF50;
                color: white;
            }

            #verifyBtn:hover {
                background-color: #45a049;
            }

            #resendBtn {
                background-color: #008CBA;
                color: white;
            }

            #resendBtn:hover {
                background-color: #0077a3;
            }

            #message {
                color: #FF0000;
                font-style: italic;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Forgot Password OTP Verification</h2>
            <p>Please enter the OTP sent to your email:</p>
            <form id="otpForm" action="http://localhost:8080/DoctorAppointment/UserOtpVerification" method="post">
                <input type="text" name="userOtp" id="otpInput" placeholder="Enter OTP" required>
                <button type="submit" id="verifyBtn">Verify</button>
                <button type="button" id="resendBtn">Resend OTP</button>
            </form>
            <p id="message"></p>
        </div>

    </body>
    <%
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        }
    %>
</html>
