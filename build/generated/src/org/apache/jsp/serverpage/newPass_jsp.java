package org.apache.jsp.serverpage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import javax.servlet.http.*;

public final class newPass_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("            * {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body {\n");
      out.write("                font-family: Arial, sans-serif;\n");
      out.write("                background-color: #f4f4f4;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                height: 100vh;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .container {\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .password-form {\n");
      out.write("                width: 400px;\n");
      out.write("                padding: 20px;\n");
      out.write("                background-color: #fff;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            h2 {\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group {\n");
      out.write("                margin-bottom: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            label {\n");
      out.write("                display: block;\n");
      out.write("                margin-bottom: 5px;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"password\"] {\n");
      out.write("                /* width: calc(100% - 22px); */\n");
      out.write("                padding: 10px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                box-shadow: 2px 2px 5px #2773a5;\n");
      out.write("                transition:  0.3s ease;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"password\"]:focus {\n");
      out.write("                outline: none;\n");
      out.write("                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input {\n");
      out.write("                width: 93%;\n");
      out.write("                padding: 10px;\n");
      out.write("                border: 2px solid #cccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                font-size: 1rem;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                box-shadow: 2px 2px 5px #2773a5;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"Submit\"] {\n");
      out.write("                margin-top: 18px;\n");
      out.write("                background-color: #3498db;\n");
      out.write("                border: none;\n");
      out.write("                color: white;\n");
      out.write("                cursor: pointer;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            input[type=\"Submit\"]:hover{\n");
      out.write("                background-color: #2773a5;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!DOCTYPE html>\n");
      out.write("    <html lang=\"en\">\n");
      out.write("        <head>\n");
      out.write("            <meta charset=\"UTF-8\">\n");
      out.write("            <title>Password Change</title>\n");
      out.write("        </head>\n");
      out.write("        <body>\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"password-form\">\n");
      out.write("                    <h2>Change Password</h2>\n");
      out.write("\n");
      out.write("                    <form action=\"#\" method=\"post\">\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"new-password\">New Password:</label>\n");
      out.write("                            <input type=\"password\" id=\"new-password\" name=\"new-password\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"confirm-password\">Confirm New Password:</label>\n");
      out.write("                            <input type=\"password\" id=\"confirm-password\" name=\"confirm-password\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"Submit\" value=\"Submit\">\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </body>\n");
      out.write("        ");
      out.write("\n");
      out.write("    </html>\n");
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
