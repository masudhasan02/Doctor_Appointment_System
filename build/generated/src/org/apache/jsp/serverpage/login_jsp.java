package org.apache.jsp.serverpage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Log-in</title>\n");
      out.write("        <style>\n");
      out.write("            *{\n");
      out.write("                margin: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                padding: 0;\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("                font-size: 'Lato', sans-serif;\n");
      out.write("            }\n");
      out.write("            .outer-box{\n");
      out.write("                width: 100vw;\n");
      out.write("                height: 100vh;\n");
      out.write("                background: linear-gradient(to top left, red,blue);\n");
      out.write("            }\n");
      out.write("            .inner-box{\n");
      out.write("                width: 400px;\n");
      out.write("                margin: 0 auto;\n");
      out.write("                position: relative;\n");
      out.write("                top: 40%;\n");
      out.write("                transform: translateY(-50%);\n");
      out.write("                padding: 20px 40px;\n");
      out.write("                background: linear-gradient(to left,#ffffffff,#ffffff33);\n");
      out.write("                backdrop-filter: blur(7px);\n");
      out.write("                border-radius: 8px;\n");
      out.write("                z-index: 2;\n");
      out.write("            }\n");
      out.write("            .signup-header h1{\n");
      out.write("                font-size: 3rem;\n");
      out.write("                color: #212121;\n");
      out.write("            }\n");
      out.write("            .signup-header p{\n");
      out.write("                font-size: 0.9rem;\n");
      out.write("                color: #555;\n");
      out.write("            }\n");
      out.write("            .signup-body{\n");
      out.write("                margin: 15px 0;\n");
      out.write("            }\n");
      out.write("            .signup-body p{\n");
      out.write("                margin: 15px 0;\n");
      out.write("            }\n");
      out.write("            .signup-body p label{\n");
      out.write("                display: block;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("            .signup-body p input{\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 10px;\n");
      out.write("                border: 2px solid #cccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                font-size: 1rem;\n");
      out.write("                margin-top: 4px;\n");
      out.write("                box-shadow: 10px 2px 15px #2773a5;\n");
      out.write("            }\n");
      out.write("            .signup-body p input[type=\"submit\"]{\n");
      out.write("                background-color: #3498db;\n");
      out.write("                border: none;\n");
      out.write("                color: white;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("            .signup-body p input[type=\"submit\"]:hover{\n");
      out.write("                background-color: #2773a5;\n");
      out.write("            }\n");
      out.write("            .signup-footer p{\n");
      out.write("                color: #555;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .signup-footer p a{\n");
      out.write("                color: #2773a5;\n");
      out.write("            }\n");
      out.write("            .button-click{\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            .cancelbtn{   \n");
      out.write("                box-shadow: 5px 5px 5px grey;\n");
      out.write("                margin-top: 20px;\n");
      out.write("                font-size: medium;\n");
      out.write("                font-family: 'Times New Roman', Times, serif;\n");
      out.write("                background: linear-gradient(to right,rgb(245, 15, 15),rgb(184, 75, 84));\n");
      out.write("                backdrop-filter: blur(20px);\n");
      out.write("                color:#333\n");
      out.write("            }\n");
      out.write("            span.psw {\n");
      out.write("                float: right;\n");
      out.write("                padding-top: 16px;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            .circle{\n");
      out.write("                width: 200px;\n");
      out.write("                height: 200px;\n");
      out.write("                border-radius: 100px;\n");
      out.write("                background:linear-gradient(to LEFT,#ffffff33, #ffffffaa);\n");
      out.write("                position: absolute;\n");
      out.write("                z-index: 1;\n");
      out.write("            }\n");
      out.write("            .c1{\n");
      out.write("                top: 100px;\n");
      out.write("                left: 40px;\n");
      out.write("            }\n");
      out.write("            .c2{\n");
      out.write("                right: 50px;\n");
      out.write("                bottom: 200px;\n");
      out.write("            }\n");
      out.write("            .admin{\n");
      out.write("                float: right;\n");
      out.write("            }\n");
      out.write("            .admin a{\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: #2773a5;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"outer-box\">\n");
      out.write("            <div class=\"inner-box\">\n");
      out.write("                <header class=\"signup-header\">\n");
      out.write("                    <h1>SignIn</h1> <span class=\"admin\"><a href=\"http://localhost:8080/DoctorAppointment/serverpage/adminLogin.jsp\">Admin Login</a></span>\n");
      out.write("                    <p>It Just takes 30 seconds </p>\n");
      out.write("                    \n");
      out.write("                </header>\n");
      out.write("                <main class=\"signup-body\">\n");
      out.write("                    <form action=\"http://localhost:8080/DoctorAppointment/Login\" method=\"post\" onsubmit=\"return validateForm()\">\n");
      out.write("                        <p>\n");
      out.write("                            <label for=\"fullname\">UserName</label>\n");
      out.write("                            <input type=\"text\" id=\"fullname\" name=\"uname\" placeholder=\"Enter Your Name/email address\" autofocus required >\n");
      out.write("                        </p>\n");
      out.write("                        <p>\n");
      out.write("                            <label for=\"password\">Password</label>\n");
      out.write("                            <input type=\"password\" id=\"password\" name=\"pass\" placeholder=\"Enter Your Password\" required >\n");
      out.write("                        </p>\n");
      out.write("                        <div class=\"butt\">\n");
      out.write("                            <label for=\"\">\n");
      out.write("                                <input type=\"checkbox\" id=\"termsCheckbox\" name=\"remember\" checked> I accept <a target=\"_blank\" href=\"http://localhost:8080/DoctorAppointment/statpage/termsAndConditions.html\" class=\"button-click\">Terms & Condition</a>\n");
      out.write("                            </label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-input\">\n");
      out.write("                            <button type=\"reset\" class=\"cancelbtn\">Reset</button>   \n");
      out.write("                            <span class=\"psw\"> <a href=\"http://localhost:8080/DoctorAppointment/serverpage/forgetPass.jsp\" style=\"text-decoration: none;\"> Forgot password?</a></span> \n");
      out.write("                        </div>\n");
      out.write("                        <p>\n");
      out.write("                            <input type=\"submit\" id=\"submit\" value=\"Login\" >\n");
      out.write("                        </p>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                </main>\n");
      out.write("\n");
      out.write("                <footer class=\"signup-footer\" >\n");
      out.write("                    <p>Create a new Account <a href=\"http://localhost:8080/DoctorAppointment/serverpage/signup.jsp\" style=\"text-decoration: none;\">Sign Up</a> </p>\n");
      out.write("\n");
      out.write("                </footer>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"circle c1\"></div>\n");
      out.write("            <div class=\"circle c2\"></div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function validateForm() {\n");
      out.write("                var termsCheckbox = document.getElementById(\"termsCheckbox\");\n");
      out.write("\n");
      out.write("                if (!termsCheckbox.checked) {\n");
      out.write("                    alert(\"Please accept the terms and conditions before submitting.\");\n");
      out.write("                    return false; // Prevent form submission\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                // If the checkbox is checked, allow form submission\n");
      out.write("                return true;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
