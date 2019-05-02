<%-- 
    Document   : search_page
    Created on : 18-Sep-2018, 01:38:47
    Author     : Ingrid Farkas
--%>

<!-- search_page.jsp - when the user clicks on the Search button ( the navigation bar ) this web page is shown -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Book</title>
        <!-- link to the external style sheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!-- including the file header.jsp into this file -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp"%>

        <!-- including the file search_form.jsp into this file -->
        <%@ include file="search_form.jsp"%> 
        
        <!-- including the file footer.jsp into this file -->
        <!-- footer.jsp contains the footer of the web page --> 
        <%@ include file="footer.jsp"%> 
    </body>
</html>

