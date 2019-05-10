<%-- 
    Document   : update_prev
    Created on : 14-Mar-2019, 04:56:04
    Author     : Ingrid Farkas
--%>

<!-- update_prev.jsp - when the user clicks on the Update button ( the navigation bar ) this web page is shown -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book</title>
        <!-- link to the external style sheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <% 
            //HttpSession hSession = request.getSession(); // the session to which I am going to add attributes
            HttpSession hSession = AquaMethods.returnSession(request);
            hSession.setAttribute("source_name", "Update Book"); // on which page I am now
            //hSession.setAttribute("webpg_name", "update_prev.jsp"); // name of the file for this web page
        %>
        
        <!-- including the file header.jsp -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp" %>
        <!-- including the file update_title.jsp -->
        <%@ include file="upd_del_title.jsp" %> 
        <!-- including the file footer.jsp -->
        <!-- footer.jsp contains the footer of the web page --> 
        <%@ include file="footer.jsp" %> 
    </body>
</html>

