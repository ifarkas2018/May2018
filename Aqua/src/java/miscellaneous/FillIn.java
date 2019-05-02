/*
 * author: Ingrid Farkas
 * project: Aqua Bookstore
 * FillIn.java : when the user clicks on the Books, Update Book ( header.jsp ) this servlet is called
 */
package miscellaneous;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "FillIn", urlPatterns = {"/FillIn"})
public class FillIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FillIn</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FillIn at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession hSession2 = AquaMethods.returnSession(request);
            AquaMethods.setToEmptyInput(request, hSession2 ); // setToEmptyInput: set the session variable values to "" for the variables named input0, input1, ...
            //if (AquaMethods.sessVarExists(hSession2, "input1")) { 
                //String str1 = String.valueOf(hSession2.getAttribute("input1")); 
            //}
            
            Cookie[] cookies = request.getCookies(); // retrieving the array of cookies
            // going throught the cookies
            for (Cookie cookie:cookies){
                // get the name of the cookie
                String cookie_name = cookie.getName();
                // is the name of the cookie fill_in
                boolean is_fill_in = cookie_name.startsWith("fill_in", 0); 
                String cookie_val = cookie.getValue();
                // set the session variable cookie_name to the cookie_val
                if (is_fill_in)
                    hSession2.setAttribute(cookie_name, cookie_val);
            }
            //if (AquaMethods.sessVarExists(hSession2, "input1")) { 
                //String str1 = String.valueOf(hSession2.getAttribute("input1")); 
            //}
            response.sendRedirect("update_prev.jsp"); // redirects the response to update_prev.jsp
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
