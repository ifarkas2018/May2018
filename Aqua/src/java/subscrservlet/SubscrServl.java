/*
 * author: Ingrid Farkas
 * project: Aqua Bookstore
 * SubscribeServl.java : when the user clicks on the Subscribe button ( footer.jsp ) this servlet is called
 */
package subscrservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import loginservlet.UserDAO;
import miscellaneous.AquaMethods;

/**
 *
 * @author user
 */
public class SubscrServl extends HttpServlet {

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
            out.println("<title>Servlet SubscrServl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubscrServl at " + request.getContextPath() + "</h1>");
            out.println("Subscribe Servlet");
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
        processRequest(request, response);
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
        // processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {	    
            HttpSession hSession2 = AquaMethods.returnSession(request);
            
            if (AquaMethods.sessVarExists(hSession2, "input1")) { 
                String str1 = String.valueOf(hSession2.getAttribute("input1")); 
            }
            
            //String str = String.valueOf(hSession2.getAttribute("page_name"));
            // read the text from the subscr_email ( the footer.jsp ) - Email address for the subscription 
            String subscrEmail = request.getParameter("subscr_email"); // the text in the input field subscr_email ( footer.jsp )
            
            Cookie[] cookies = request.getCookies();
            //String username = null;
            //HttpSession hSession = request.getSession(); // retrieve the session to which I am going to add variables
            boolean first_time = false; // is it the first cookie with the key which starts with "input"
            // AquaMethods.setToEmptyInput(request, hSession2); // setting every session variable with name that starts with "input" to "" 
            hSession2.setAttribute("fill_in", "false"); // if there is no cookie with name that starts with "input" then there are no data to be filled in 
            
            //String str2 = String.valueOf(hSession2.getAttribute("page_name"));
            
            // going throught the cookies
            for (Cookie cookie:cookies){
                //if ("username".equals(cookie.getName())){
                    //username = cookie.getValue();
                /*
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet SubscrServl</title>");            
                out.println("</head>");
                out.println("<body>");
                // out.println("<h1>Servlet SubscrServl at " + request.getContextPath() + "</h1>");
                out.println(cookie.getName() + "=" + cookie.getValue() + "---------");
                out.println("Subscribe Servlet");
                out.println("</body>");
                out.println("</html>");
                    //out.print("cookies: ");
                */
                // set the session variable values to "" for the variables named input0, input1, ...
                String cookie_name = cookie.getName();
                // is the value in the cookie the text from the input box
                boolean is_input = cookie_name.startsWith("input", 0); // whether the cookie name I have retrieved contains text from one of the input fileds
                
                if (is_input) {
                    // if this is the first cookie whose key starts with input set the variable fill_in to true
                    // when I load the page if the fill_in is set to true that means that the fields of the form need to be field in with the values
                    // from session variables
                    if (!first_time) {
                        first_time = true;
                        hSession2.setAttribute("fill_in", "true");
                    }
                    String cookie_val = cookie.getValue();
                    // I am adding this value to the session - because of the SUBSCRIPTION
                    // the IDEA of the SUBSCRIPTION : after entering the email address and clicking on the button ( Subscribe ) the page is shown whether
                    // the user successfully subscribed to the newsletter - after that when the user clicks on the Close button the web page which was before
                    // loaded has to be loaded with the values - these values are the values I am writing to the session
                    hSession2.setAttribute(cookie_name, cookie_val);
                    // String str = String.valueOf(hSession2.getAttribute(cookie_name));
                    // String str1="";
                }
            }
            
            if (AquaMethods.sessVarExists(hSession2, "input1")) { 
                String str1 = String.valueOf(hSession2.getAttribute("input1")); 
            }
            
            // @@@@@@@@@@@@@@@@@@ the cookies retrieved here add to the session variables @@@@@@@@@@@@@@@@@@@@@@@@@@
            // read the session variables and pu them into input fields when loading the form @@@@@@@@@@@@@@@@@@@@@@@@@@ 
            
            
            // method addEmail adds the new email for the subscription to the table subscription
            // returns TRUE if an axception occurred, otherwise it returns FALSE
            // @@@@@@@@@@@@@ UNCOMMENT THIS
            String exOccurred = SubscrDAO.addEmail(subscrEmail);
            hSession2.setAttribute("db_exoccurred", exOccurred );
            //String str1 = String.valueOf(hSession2.getAttribute("page_name"));
            // IMPORTANT - RETURN !!!!!!!!   ???????????????
            // show the page subscrres_page.jsp
            response.sendRedirect("subscrres_page.jsp"); // redirects the response to subscrres_page.jsp
            // @@@@@@@@@@@@@@@ add here the code for reading where the user was and showing that page
        } catch ( Exception theException){ // Throwable
            // response.sendRedirect("index.jsp"); // redirects the response to subscrres_page.jsp
        }
    }

    /**.

     * Returns a short description of the servlet     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
