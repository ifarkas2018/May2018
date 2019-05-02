<%-- 
    Document   : subscrres_page
    Created on : 16-Apr-2019, 16:21:18
    Author     : Ingrid Farkas
--%>

<!-- subscrres_page.jsp - when the user enters the email in the footer and clicks on the Subscribe button SubscrServl.java is invoked which loads this page  -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subscribe</title>
        <!-- link to the external style sheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!-- including the file header.jsp into this file -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp"%>
        <!-- including the file subscrres_content.jsp into this file -->
        <%@ include file="subscrres_content.jsp"%>
        <!-- including the file footer.jsp into this file -->
        <!-- footer.jsp contains the footer of the web page --> 
        <%@ include file="footer.jsp"%>
    </body>
</html>

