<%-- 
    Document   : signup
    Created on : 16 Nov, 2023, 10:08:55 PM
    Author     : kargh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <style>
            *{
                box-sizing: border-box;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            form {
                width: 70%;
                margin: 50px auto;
                width: 100%;
                max-width: 1000px;
                background-color: #fff;
                padding: 40px 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px 0px #666;
            }

            h2 {
                text-align: center;
            }

            select {
                appearance: none;
            }

            button {
                width: 45%;
                padding: 10px;
                margin-top: 15px;
                border: none;
                border-radius: 4px;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                font-weight: bolder;
                border-radius: 8px;
            }

            button[type="reset"] {
                background-color: #ccc;
                color: #333;
                margin-right: 10px;
            }

            button[type="submit"]:hover,
            button[type="reset"]:hover {
                opacity: 0.8;
            }

            a {
                display: inline-block;
                text-decoration: none;
                color: #007bff;
            }
            .container{
                max-width: 1100px;
                margin-inline: auto;
                padding-inline: 20px;
                font-family: Lato;
            }
            .flex{
                display: flex;
                align-items: center;
            }

            .feature-section{
                flex-wrap: wrap;
                gap: 20PX;
            }
            .features-card{

                flex-direction: column;
                gap: 10px;
                max-width: 30%;
                text-align: center;
            }
            .input{
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
            .terms{
                text-decoration: none;
                color: #007bff;
                text-align: left;
            }
            .signup-footer{
                text-align: center;
            }

        </style>
    </head>
    <body>
    <center>
        <form action="http://localhost:8080/DoctorAppointment/Register" method="post" onsubmit="return validateForm()>

            <div class="container">
                <h2>Sign Up</h2>

                <div class="feature-section flex">
                    <div class="features-card">
                        <label for="">First Name</label>
                        <div class="under">
                            <input type="text" name="f_name" placeholder="First Name" class="input"  required>
                        </div>
                    </div>


                    <div class="features-card">
                        <label for="">Last Name</label>
                        <div class="under">
                            <input type="text" name="l_name" placeholder="Last Name" class="input">
                        </div>
                    </div>


                    <div class="features-card">
                        <label for="">Middle Name</label>
                        <div class="under">
                            <input type="text" name="m_name" placeholder="Middle Name" class="input">
                        </div>
                    </div>
                </div>
                <br>
                <div class="feature-section flex">
                    <div class="features-card ">
                        <label>Email Address</label>
                        <div class="under">
                            <input type="email" name="email" placeholder="Email" class="input" required>
                        </div>
                    </div>

                    <div class="features-card ">
                        <label>Contact Number </label>
                        <div class="under">
                            <input type="number" name="phn" placeholder="Contact Number" class="input" required>
                        </div>
                    </div>


                    <div class="features-card">
                        <label for="gender-selectized" >
                            Gender </label>
                        <div class="under">
                            <select name="gender" class="input" required>
                                <option value="" disabled selected class="input" >Choose your option</option>
                                <option value="m">Male</option>
                                <option value="f">Female</option>
                                <option value="0">Rather not say</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br>
                <div class="feature-section flex">   
                    <div class="features-card ">
                        <label>Username </label>
                        <div class="under"> 
                            <input type="text" name="uname" required class="input" style="width: 280px;">
                        </div>
                    </div>


                    <div class="features-card ">
                        <label>Password </label>
                        <div class="under">
                            <input type="password" name="pass" required class="input" style="width: 280px; margin-left: 20px;">
                        </div>
                    </div>
                </div>
                <br>
                <div class="feature-section flex">   
                    <div class="features-card ">
                        <label>Security question </label>
                        <div class="under">
                            <select name="secques" class="input"  required style="width: 280px; margin-left: 20px;">
                                <option value="q1">What is your place of birth?</option>
                                <option value="q2">What is the name of your first pet?</option>
                                <option value="q3">What is your favorite color?</option>
                            </select>
                        </div>
                    </div>


                    <div class="features-card ">
                        <label> Security Answer </label>
                        <div class="under">
                            <input type="text" name="secans" required class="input" style="width: 280px; margin-left: 20px;">
                        </div>
                    </div>
                </div>
                <br>
                <label>
                    <input type="checkbox" id="termsCheckbox" name="remember" checked> I accept <a href="http://localhost:8080/DoctorAppointment/statpage/termsAndConditions.html" class="button-click">Terms & Condition</a>
                </label>
                <br>

                <button type="submit" >Submit</button>
                <button type="reset">Reset</button>

                <footer class="signup-footer">
                    <p>Already Have an Account? <a href="http://localhost:8080/DoctorAppointment/serverpage/login.jsp">sign in</a></p>
                </footer>

            </div>
        </form>
    </body>
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
</html>