<%-- 
    Document   : login
    Created on : 15 Nov, 2023, 2:19:38 PM
    Author     : kargh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--http://localhost:8080/DoctorAppointment/serverpage/login.jsp--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log-in</title>
        <style>
            *{
                margin: 0;
                box-sizing: border-box;
                padding: 0;
            }
            body{
                font-size: 'Lato', sans-serif;
            }
            .outer-box{
                width: 100vw;
                height: 100vh;
                background: linear-gradient(to top left, red,blue);
            }
            .inner-box{
                width: 400px;
                margin: 0 auto;
                position: relative;
                top: 40%;
                transform: translateY(-50%);
                padding: 20px 40px;
                background: linear-gradient(to left,#ffffffff,#ffffff33);
                backdrop-filter: blur(7px);
                border-radius: 8px;
                z-index: 2;
            }
            .signup-header h1{
                font-size: 3rem;
                color: #212121;
            }
            .signup-header p{
                font-size: 0.9rem;
                color: #555;
            }
            .signup-body{
                margin: 15px 0;
            }
            .signup-body p{
                margin: 15px 0;
            }
            .signup-body p label{
                display: block;
                font-weight: bold;
            }
            .signup-body p input{
                width: 100%;
                padding: 10px;
                border: 2px solid #cccc;
                border-radius: 4px;
                font-size: 1rem;
                margin-top: 4px;
                box-shadow: 10px 2px 15px #2773a5;
            }
            .signup-body p input[type="submit"]{
                background-color: #3498db;
                border: none;
                color: white;
                cursor: pointer;
            }
            .signup-body p input[type="submit"]:hover{
                background-color: #2773a5;
            }
            .signup-footer p{
                color: #555;
                text-align: center;
            }
            .signup-footer p a{
                color: #2773a5;
            }
            .button-click{
                text-decoration: none;
            }
            .cancelbtn{   
                box-shadow: 5px 5px 5px grey;
                margin-top: 20px;
                font-size: medium;
                font-family: 'Times New Roman', Times, serif;
                background: linear-gradient(to right,rgb(245, 15, 15),rgb(184, 75, 84));
                backdrop-filter: blur(20px);
                color:#333
            }
            span.psw {
                float: right;
                padding-top: 16px;

            }
            .circle{
                width: 200px;
                height: 200px;
                border-radius: 100px;
                background:linear-gradient(to LEFT,#ffffff33, #ffffffaa);
                position: absolute;
                z-index: 1;
            }
            .c1{
                top: 100px;
                left: 40px;
            }
            .c2{
                right: 50px;
                bottom: 200px;
            }
            .admin{
                float: right;
            }
            .admin a{
                text-decoration: none;
                color: #2773a5;
            }
        </style>
    </head>
    <body>
        <div class="outer-box">
            <div class="inner-box">
                <header class="signup-header">
                    <h1>SignIn</h1> <span class="admin"><a href="http://localhost:8080/DoctorAppointment/serverpage/adminLogin.jsp">Admin Login</a></span>
                    <p>It Just takes 30 seconds </p>
                    
                </header>
                <main class="signup-body">
                    <form action="http://localhost:8080/DoctorAppointment/Login" method="post" onsubmit="return validateForm()">
                        <p>
                            <label for="fullname">UserName</label>
                            <input type="text" id="fullname" name="uname" placeholder="Enter Your Name/email address" autofocus required >
                        </p>
                        <p>
                            <label for="password">Password</label>
                            <input type="password" id="password" name="pass" placeholder="Enter Your Password" required >
                        </p>
                        <div class="butt">
                            <label for="">
                                <input type="checkbox" id="termsCheckbox" name="remember" checked> I accept <a target="_blank" href="http://localhost:8080/DoctorAppointment/statpage/termsAndConditions.html" class="button-click">Terms & Condition</a>
                            </label>
                        </div>
                        <div class="form-input">
                            <button type="reset" class="cancelbtn">Reset</button>   
                            <span class="psw"> <a href="http://localhost:8080/DoctorAppointment/serverpage/forgetPass.jsp" style="text-decoration: none;"> Forgot password?</a></span> 
                        </div>
                        <p>
                            <input type="submit" id="submit" value="Login" >
                        </p>


                    </form>
                </main>

                <footer class="signup-footer" >
                    <p>Create a new Account <a href="http://localhost:8080/DoctorAppointment/serverpage/signup.jsp" style="text-decoration: none;">Sign Up</a> </p>

                </footer>
            </div>

            <div class="circle c1"></div>
            <div class="circle c2"></div>

        </div>
        <script>
            function validateForm() {
                var termsCheckbox = document.getElementById("termsCheckbox");

                if (!termsCheckbox.checked) {
                    alert("Please accept the terms and conditions before submitting.");
                    return false; // Prevent form submission
                }

                // If the checkbox is checked, allow form submission
                return true;
            }
        </script>
    </body>
</html>
