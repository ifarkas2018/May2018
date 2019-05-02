<%-- 
    Document   : searchDB
    Created on : 18-Sep-2018, 00:54:05
    Author     : Ingrid Farkas
    called from search_form.jsp

    @@@@@@@@@@@@@@@ I used mysql-connector-java-5.1.47-bin.jar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionManager"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.CharSequence"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/templatecss.css" type="text/css" rel="stylesheet"/>
        <title>Search Book</title>
        <%@ include file="header.jsp"%>
    </head>
    <body>
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="picture of books" title="picture of books"> 
                    </div>
                </div>
                       
                <div class="col-lg-5 col-md-5"> 
                    <div class="container">
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <h3>Search</h3><br/>
                                <%!
                                    // cont_wildcard returns true if the string contains one of wildcards % or _. Otherwise it returns false.
                                    boolean cont_wildcard(String str)
                                    {
                                        CharSequence undersc = "_";
                                        CharSequence percentage = "%";
                                        // does the string contain _ or %
                                        if ((str.contains(undersc)) || (str.contains(percentage)))
                                            return true;
                                        else
                                            return false;
                                    }
                                %>
                                <%
                                HttpSession hSession = request.getSession();
                                try{ 
                                    String form_title = request.getParameter("title"); // the text entered as the title
                                    String form_auth = request.getParameter("author"); // the text entered as the author
                                    String form_isbn = request.getParameter("isbn"); // the text entered as the isbn
                                    String form_sortby = request.getParameter("sortby"); // the text entered as the sortby
                                    String form_categ = request.getParameter("categ"); // the option chosen in the drop-down list - category
                                    String form_price = request.getParameter("price_range"); // the option chosen in the drop-down list - Price Range
                                    String form_publyear = request.getParameter("publ_year"); // the text entered as the publ_year
                                %>  
                                <%
                                    //Class.forName("com.mysql.jdbc.Driver");
                                    //Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3305/bookstore?useSSL=false", "root", "bird&2018");  
                                    Connection con = ConnectionManager.getConnection(); //connecting to database ;
                                    Statement stmt = con.createStatement();
                                    
                                    String sQuery = "select b.title, b.price, b.publ_year, b.descr, a.au_name from book b, author a where (b.au_id = a.au_id)";
                                  
                                    // if there is anything entered in input field with the label Title
                                    if (!(form_title.equalsIgnoreCase(""))) {
                                        // if the title contains ? or _ then add the Like 
                                        if (cont_wildcard(form_title)){
                                            sQuery += " AND (b.title LIKE '" + form_title+ "')";
                                        } else 
                                            sQuery += " AND (b.title='" + form_title + "')";
                                    }     
                                    
                                    // if there is anything entered in the input field with the label Author's Name
                                    if (!(form_auth.equalsIgnoreCase(""))) {
                                        // if the title contains ? or _ then add the Like 
                                        if (cont_wildcard(form_auth))
                                            sQuery += " AND (a.au_name LIKE '" + form_auth + "')";
                                        else
                                            sQuery += " AND (a.au_name='" + form_auth + "')";
                                    }
                                    
                                    // if there is anything entered in the input field with the label ISBN
                                    if (!(form_isbn.equalsIgnoreCase(""))) {
                                        // if the title contains ? or _ then add the Like 
                                        if (cont_wildcard(form_isbn))
                                            sQuery += " AND (b.isbn LIKE '" + form_isbn + "')";
                                        else
                                            sQuery += " AND (b.isbn='" + form_isbn + "')";
                                    }
                                    
                                    String tempStr; // used for building of the query 
                                    // has the user choosen Fiction & Poetry ( drop down box ) for the Category, assign that to the tempStr
                                    if (form_categ.equalsIgnoreCase("fict"))
                                        tempStr = "Fiction & Poetry";
                                    // has the user choosen Business ( drop down box ) for the Category, assign that to the tempStr
                                    else if (form_categ.equalsIgnoreCase("bus"))
                                        tempStr = "Business";
                                    // has the user choosen Education ( drop down box ) for the Category, assign that to the tempStr
                                    else if (form_categ.equalsIgnoreCase("edu"))
                                        tempStr = "Education";
                                    // has the user choosen Computing & IT ( drop down box ) for the Category, assign that to the tempStr
                                    else if (form_categ.equalsIgnoreCase("comp"))
                                        tempStr = "Computing & IT";
                                    // has the user choosen Children's ( drop down box ) for the Category, assign that to the tempStr
                                    else if (form_categ.equalsIgnoreCase("child"))
                                        tempStr = "Children";
                                    else
                                        tempStr="";
                                    
                                    // build the query by adding whether the category is tempStr
                                    if (!(tempStr.equalsIgnoreCase(""))) 
                                        sQuery += " AND (b.category='" + tempStr + "')";
                                    
                                    tempStr="";
                                    // if the user chose for the the price range <5 GBP
                                    if (form_price.equalsIgnoreCase("less5"))
                                        tempStr = "< 5"; 
                                    // if the user chose for the the price range between 5GBP and 10GBP
                                    else if (form_price.equalsIgnoreCase("betw5-10"))
                                        tempStr = "BETWEEN 5 AND 10";
                                    // if the user chose for the the price range between 10GBP and 20GBP
                                    else if (form_price.equalsIgnoreCase("betw10-20"))
                                        tempStr = "BETWEEN 10 AND 20";
                                    // if the user chose for the the price range between 20GBP and 30GBP
                                    else if (form_price.equalsIgnoreCase("betw20-30"))
                                        tempStr = "BETWEEN 20 AND 30";
                                    // if the user chose for the the price range between 30GBP and 50GBP
                                    else if (form_price.equalsIgnoreCase("betw30-50"))
                                        tempStr = "BETWEEN 30 AND 50";
                                    // if the user chose for the the price range above 50GBP
                                    if (form_price.equalsIgnoreCase("above50"))
                                        tempStr = "> 50";
                                    
                                    // build the query by adding whether the price is in required range
                                    if (!(tempStr.equalsIgnoreCase(""))) 
                                        sQuery += " AND (b.price " + tempStr + " )";
                                   
                                    // if there is anything entered in the input field with the label Publication Year
                                    if (!(form_publyear.equalsIgnoreCase(""))) {
                                        // if the title contains ? or _ then add the Like 
                                        if (cont_wildcard(form_publyear))
                                            sQuery += " AND (b.publ_year LIKE '" + form_publyear + "')";
                                        else
                                            sQuery += " AND (b.publ_year='" + form_publyear + "')";
                                    }
                                    
                                    // add whether the query results should be sorted ASC or DESC based on the user's choice
                                    sQuery += " ORDER BY b.price "; 
                                    
                                    if (form_sortby.equalsIgnoreCase("low")) 
                                        sQuery += "ASC";
                                    else
                                        sQuery += "DESC";
                                    sQuery += ";";
                                    
                                    out.print(sQuery);
                                    // execute the query - the result will be in the rs
                                    ResultSet rs = stmt.executeQuery(sQuery); 
                                    out.println("<br />");
                                    
                                    if (rs.next()){ // there are books which meet the criteria
                                        out.println("The following books meet the search criteria: ");
                                    } else { // there are none books that meet the criteria
                                        out.println("<span class=\"red_text\">There are none books that meet the search criteria!</span>");
                                    }
                                    
                                    // show the result in an unordered list
                                    out.print("<ul>");
                                    // if in the result set there is the next row
                                    do 
                                    {
                                        // read the value of the title 
                                        String sTitle = rs.getString("title");
                                        // read the value of the name of the author
                                        String sAuthor = rs.getString("au_name");
                                        // read the price
                                        String sPrice = rs.getString("price");
                                        // show the value for the title, author and price
                                        String descr = rs.getString("descr");
                                        out.print("<li>" + sTitle + " by (author) " + sAuthor ); 
                                        // if there is value for the price : show the price
                                        if (sPrice != null){
                                            out.print(" ( price: " + sPrice + "GBP )");
                                        }
                                        // if there is a book description : show the price
                                        if (descr != null) {
                                            out.print("<br />" + "Description: " + descr );
                                        }
                                        out.print("</li>");
                                    } while(rs.next());
                                    
                                    out.print("</ul>");
                                }catch(Exception e){
                                    String sMessage = "ERR_SEARCH";
                                    String sTitle = "Search!"; // used for passing the title from one JSP script to the other
                                    hSession.setAttribute("source_name", "Search"); // on which page I am now
                                    hSession.setAttribute("title", sTitle); // setting the attribute message to the value sTitle
                                    hSession.setAttribute("message", sMessage); // setting the attribute message to the value sMessage
                                    response.sendRedirect("error_succ.jsp"); // redirects the response to error_succ.jsp
                                }
                                %>

                            </div> <!-- end of class="col" -->
                        </div> <!-- end of class="row" --> 
                    </div> <!-- end of class="container" -->
                </div> <!-- end of class="col-lg-5 col-md-5" -->
            </div> <!-- end of class="row" -->
        </div> <!-- end of class="whitebckgr" -->
            
        <!-- adding a new row; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div> 
          
        <%@ include file="footer.jsp"%>
    </body>
</html>
