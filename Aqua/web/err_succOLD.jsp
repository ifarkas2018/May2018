<%-- 
    Document   : err_succOLD.jsp
    Created on : 17-Mar-2019, 23:00:55
    Author     : user
--%>
<!-- error_succ.jsp adds the error or success message to the web page -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            HttpSession hSession = request.getSession(); // hSession - used to store the information about that user
            String sSource = (String)hSession.getAttribute("source_name");
            // set the title of this web page depending from which page the user came from 
            if (sSource.equalsIgnoreCase("Add Book")){
                out.print("<title>Add Book</title>"); 
            } else if (sSource.equalsIgnoreCase("Search")){
                out.print("<title>Search</title>"); 
            } else if (sSource.equalsIgnoreCase("Update Book")){
                out.print("<title>Update Book</title>"); 
            }
        %>    
        
        <!-- link to the external stylesheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
        <!-- internal CSS stylesheet -->
        <style>
            .red_text {
                color:red; /* red text color */
            }
        </style>
        <!-- including the file header.jsp into this file -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp"%>
    </head>
    


    <body>
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <!-- the Bootstrap column takes 6 columns on the large desktops and 6 columns on the medium sized desktops -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> 
                        <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="picture of books" title="picture of books"> 
                    </div>
                </div>
                
                <!-- the Bootstrap column takes 5 columns on the large screens and 5 columns on the medium sized screens -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container">
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <br/><br/><br/>
                                <%
                                    // title, source_name, message - the information passed from the other JSP ( addDB.jsp or searchDb.jsp )
                                    // sSource - the text shown on the button and for setting the action in the form tag
                                    // @@@@@@@@@@@@@@@@@@@@@@@@@''String sSource = (String)hSession.getAttribute("source_name");
                                    // title - the title passed from one web page to the other
                                    String sTitle = (String)hSession.getAttribute("title");
                                    // message - attribute passed from the other web page used to determine the message on the web page
                                    String sMessage = (String)hSession.getAttribute("message");
                                   
                                    out.print("<h1 class=\"red_text\">");
                                        out.print( sTitle ); 
                                        out.print("</h1>");
                                        out.print("<br/><br/>");
                                        
                                    if (sMessage.equalsIgnoreCase("ERR_DB")){
                                        out.print("An error occurred while accessing the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_SEARCH")){
                                        out.print("An error occurred during the search!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_NO_BOOKID")){
                                        out.print("The book with that title, author and isbn doesn't exist in the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_ADD")){
                                        out.print("An error occurred while adding the book to the database and the book wasn't successfully added to the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_UPDATE")){
                                        out.print("An error occurred while updating the book in the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_ADD_EXISTS")){
                                        out.print("Error! The book with that ISBN already exists in the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("SUCC_ADD")){
                                        out.print("The book was successfully added to the database!");       
                                    } else if (sMessage.equalsIgnoreCase("SUCC_UPDATE")){
                                        out.print("The book was successfully updated in the database!");  
                                    // sSource used for setting the action attribute of the form tag ( the page that is loaded when the user clicks the button
                                    if (sSource.equalsIgnoreCase("Add Book")){
                                %>
                                
                            </div></div></div></div></div></div>
    </body>
</html>
