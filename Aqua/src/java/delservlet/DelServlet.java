/*
 * author: Ingrid Farkas
 * project: Aqua Bookstore
 * DelServlet.java : handles running the SQL query ( used in upd_del_title.jsp for Delete )
 */
package delservlet;

// importing classes
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import connection.ConnectionManager;
import delservlet.DetermineID; // contains methods for retrieving the ID

import javax.servlet.http.HttpSession;

/**
 *
 * @author Ingridi Farkas
 * called from upd_del_title.jsp
 */
@WebServlet(urlPatterns = {"/DelServlet"}) // if the URL is /DelServlet
public class DelServlet extends HttpServlet {

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
            out.println("<title>Servlet NewDelServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewDelServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        HttpSession hSession = request.getSession(); // hSession - used to store the information about that user
        try (PrintWriter out = response.getWriter()) {
            String prev_title = request.getParameter("prev_title"); // retrieving the title of the book
            String prev_author = request.getParameter("prev_author"); // the author
            String prev_isbn = request.getParameter("prev_isbn"); // ISBN
         
            // Class.forName("com.mysql.jdbc.Driver");
            //@@@@@@@@@@ Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
            // Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3305/bookstore?useSSL=false", "root", "bird&2018");  
            Connection con = ConnectionManager.getConnection(); //connecting to database 
            Statement stmt = con.createStatement();
            
            
            String query="";
            String auid=""; // author ID ( column au_id, table author )
            boolean added_col = false; // whether name of the column was added to the query
            DetermineID idObject = new DetermineID(); // used for invoking the method determineAuthID(author, stmt) 
            
            // DETERMINING the AUTHOR ID 
            if (!((prev_author.equalsIgnoreCase("")))) {
                // determineAuthID : creating and running the query SELECT au_id FROM author WHERE au_name='...';
                auid = idObject.determineAuthID(prev_author, stmt); // determine the author ID for that author
                
                // if the author with that name doesn't exist, add it to the author table
                if (auid.equals("")) { // the author doesn't exist in the DB
                    String sTitle = "Error!"; // used for passing the title from one JSP script to the other
                    String sMessage = "ERR_NO_AUTHID"; // used for passing the message from one JSP script to the other
                    hSession.setAttribute("source_name", "Delete Book"); // on which page I am now
                    hSession.setAttribute("message", sMessage); // setting the attribute message to the value sMessage
                    hSession.setAttribute("title", sTitle); // setting the attribute message to the value sTitle 
                    request.getRequestDispatcher("error_succ.jsp").forward(request,response); // redirects the response to error_succ.jsp
                }
            }
            
            // the query string: DELETE FROM book WHERE title='...' AND au_id='...' AND isbn='...'; 
            query = "DELETE FROM book WHERE ";
            if (!(prev_title.equalsIgnoreCase(""))) { // if the user entered the title 
                query += "title = '" + prev_title + "' "; // add to the query string : title = '...'
                added_col = true; // the query string contains one column
            }
            
            if (!(auid.equalsIgnoreCase(""))) { // if the author id exists
                if (added_col == true ) // if the name of the column was added to the query add AND
                    query += "AND "; 
                
                query += "au_id = '" + auid + "' "; // add to the query auid = '...'
                added_col = true; // the column was added to the query
            }
            
            // if the user entered the ISBN
            if (!(prev_isbn.equalsIgnoreCase(""))) {
                if (added_col == true ) // if the column was added to the query
                    query += "AND "; // add to the query AND
                
                query += "isbn = '" + prev_isbn + "' "; // add to the query isbn = '...'
                added_col = true; // the column was added to the query
            }
            
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.execute(); // executing the query
            
            hSession.setAttribute("source_name", "Delete Book"); // on which page I am now
            String sTitle = "Delete Book!"; // used for passing the title from one JSP script to the other
            String sMessage = "SUCC_DELETE"; // used for passing the message from one JSP script to the other
            hSession.setAttribute("message", sMessage); // setting the value of the session variable message
            hSession.setAttribute("title", sTitle); // setting the value of the session variable title
            
            request.getRequestDispatcher("error_succ.jsp").forward(request,response); // redirects the response to error_succ.jsp
        } catch (Exception ex) {
            String sTitle = "Error!"; // used for passing the title from one JSP script to the other
            String sMessage = "ERR_DELETE"; // used for passing the message from one JSP script to the other
            hSession.setAttribute("source_name", "Delete Book"); // on which page I am now
            hSession.setAttribute("message", sMessage); // setting the attribute message to the value sMessage
            hSession.setAttribute("title", sTitle); // setting the attribute title to the value sTitle 
            request.getRequestDispatcher("error_succ.jsp").forward(request,response); // redirects the response to error_succ.jsp
        }
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
