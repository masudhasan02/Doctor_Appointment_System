package org.apache.jsp.serverpage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Sign up</title>\n");
      out.write("        <style>\n");
      out.write("            *{\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("            body {\n");
      out.write("                font-family: Arial, sans-serif;\n");
      out.write("                background-color: #f4f4f4;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form {\n");
      out.write("                width: 70%;\n");
      out.write("                margin: 50px auto;\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 1000px;\n");
      out.write("                background-color: #fff;\n");
      out.write("                padding: 40px 20px;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                box-shadow: 0 0 10px 0px #666;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            h2 {\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            select {\n");
      out.write("                appearance: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button {\n");
      out.write("                width: 45%;\n");
      out.write("                padding: 10px;\n");
      out.write("                margin-top: 15px;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                background-color: #007bff;\n");
      out.write("                color: #fff;\n");
      out.write("                cursor: pointer;\n");
      out.write("                font-weight: bolder;\n");
      out.write("                border-radius: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button[type=\"reset\"] {\n");
      out.write("                background-color: #ccc;\n");
      out.write("                color: #333;\n");
      out.write("                margin-right: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button[type=\"submit\"]:hover,\n");
      out.write("            button[type=\"reset\"]:hover {\n");
      out.write("                opacity: 0.8;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a {\n");
      out.write("                display: inline-block;\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: #007bff;\n");
      out.write("            }\n");
      out.write("            .container{\n");
      out.write("                max-width: 1100px;\n");
      out.write("                margin-inline: auto;\n");
      out.write("                padding-inline: 20px;\n");
      out.write("                font-family: Lato;\n");
      out.write("            }\n");
      out.write("            .flex{\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .feature-section{\n");
      out.write("                flex-wrap: wrap;\n");
      out.write("                gap: 20PX;\n");
      out.write("            }\n");
      out.write("            .features-card{\n");
      out.write("\n");
      out.write("                flex-direction: column;\n");
      out.write("                gap: 10px;\n");
      out.write("                max-width: 30%;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .input{\n");
      out.write("                color: #4a4a5a;\n");
      out.write("                height: 34px;\n");
      out.write("                width: 240px;\n");
      out.write("                padding: 6px 10px;\n");
      out.write("                font-size: 14px;\n");
      out.write("                font-family: Lato;\n");
      out.write("                line-height: 20px;\n");
      out.write("                border: 1px solid #CACAD3;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                box-shadow: none;\n");
      out.write("                border-radius: 2px;\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("            .terms{\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: #007bff;\n");
      out.write("                text-align: left;\n");
      out.write("            }\n");
      out.write("            .signup-footer{\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    <center>\n");
      out.write("        <form action=\"http://localhost:8080/DoctorAppointment/Register\" method=\"post\" onsubmit=\"return validateForm()>\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h2>Sign Up</h2>\n");
      out.write("\n");
      out.write("                <div class=\"feature-section flex\">\n");
      out.write("                    <div class=\"features-card\">\n");
      out.write("                        <label for=\"\">First Name</label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <input type=\"text\" name=\"f_name\" placeholder=\"First Name\" class=\"input\"  required>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"features-card\">\n");
      out.write("                        <label for=\"\">Last Name</label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <input type=\"text\" name=\"l_name\" placeholder=\"Last Name\" class=\"input\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"features-card\">\n");
      out.write("                        <label for=\"\">Middle Name</label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <input type=\"text\" name=\"m_name\" placeholder=\"Middle Name\" class=\"input\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <div class=\"feature-section flex\">\n");
      out.write("                    <div class=\"features-card \">\n");
      out.write("                        <label>Email Address</label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <input type=\"email\" name=\"email\" placeholder=\"Email\" class=\"input\" required>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"features-card \">\n");
      out.write("                        <label>Contact Number </label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <input type=\"number\" name=\"phn\" placeholder=\"Contact Number\" class=\"input\" required>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"features-card\">\n");
      out.write("                        <label for=\"gender-selectized\" >\n");
      out.write("                            Gender </label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <select name=\"gender\" class=\"input\" required>\n");
      out.write("                                <option value=\"\" disabled selected class=\"input\" >Choose your option</option>\n");
      out.write("                                <option value=\"m\">Male</option>\n");
      out.write("                                <option value=\"f\">Female</option>\n");
      out.write("                                <option value=\"0\">Rather not say</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <div class=\"feature-section flex\">   \n");
      out.write("                    <div class=\"features-card \">\n");
      out.write("                        <label>Username </label>\n");
      out.write("                        <div class=\"under\"> \n");
      out.write("                            <input type=\"text\" name=\"uname\" required class=\"input\" style=\"width: 280px;\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"features-card \">\n");
      out.write("                        <label>Password </label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <input type=\"password\" name=\"pass\" required class=\"input\" style=\"width: 280px; margin-left: 20px;\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <div class=\"feature-section flex\">   \n");
      out.write("                    <div class=\"features-card \">\n");
      out.write("                        <label>Security question </label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <select name=\"secques\" class=\"input\"  required style=\"width: 280px; margin-left: 20px;\">\n");
      out.write("                                <option value=\"q1\">What is your place of birth?</option>\n");
      out.write("                                <option value=\"q2\">What is the name of your first pet?</option>\n");
      out.write("                                <option value=\"q3\">What is your favorite color?</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"features-card \">\n");
      out.write("                        <label> Security Answer </label>\n");
      out.write("                        <div class=\"under\">\n");
      out.write("                            <input type=\"text\" name=\"secans\" required class=\"input\" style=\"width: 280px; margin-left: 20px;\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <label>\n");
      out.write("                    <input type=\"checkbox\" id=\"termsCheckbox\" name=\"remember\" checked> I accept <a href=\"http://localhost:8080/DoctorAppointment/statpage/termsAndConditions.html\" class=\"button-click\">Terms & Condition</a>\n");
      out.write("                </label>\n");
      out.write("                <br>\n");
      out.write("\n");
      out.write("                <button type=\"submit\" >Submit</button>\n");
      out.write("                <button type=\"reset\">Reset</button>\n");
      out.write("\n");
      out.write("                <footer class=\"signup-footer\">\n");
      out.write("                    <p>Already Have an Account? <a href=\"http://localhost:8080/DoctorAppointment/serverpage/login.jsp\">sign in</a></p>\n");
      out.write("                </footer>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("    <script>\n");
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
      out.write("</html>");
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
