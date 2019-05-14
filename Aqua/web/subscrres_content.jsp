<%-- 
    Document   : subscrres_content
    Created on : 16-Apr-2019, 16:28:06
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="miscellaneous.AquaMethods"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subscription</title>
        
        <style>
            .red_text {
                color:red; /* red text color */
            }
        </style>
        
        <script>
            function setFillIn(){
                document.cookie = "fill_in=true;"; // should the user return to the form he was on before subscribing the fill_in should be true
                //alert("subscrres_content: " + document.cookie);
            }
        </script>
    </head>
    <body onload="setFillIn()">
        <!-- adding a new row to the Bootstrap grid; class whitebckgr is for setting the background to white -->
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
                
                <!-- the Bootstrap column takes 5 columns on the large desktops and 5 columns on the medium sized desktops -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container"> <!-- adding the container to the Bootstrap grid -->
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <h1>Subscribe</h1>
                                <br/> 
                                <%  HttpSession hSession = AquaMethods.returnSession(request);
                                    String validEmail = String.valueOf(hSession.getAttribute("valid_email"));
                                    String exOccurred = "false"; // whether an exception occured 
                                    // before page_name @@@@@@@@@@@@@@@@@
                                    String page_name = String.valueOf(hSession.getAttribute("webpg_name")); // name of the page where the user was before clicking on the Subscribe button
                                    exOccurred = String.valueOf(hSession.getAttribute("db_exoccurred"));
                                    
                                    if (validEmail.equalsIgnoreCase("false"))
                                        out.print( "<span class=\"red_text\">You entered an invalid email address!</span>" );
                                    else if (exOccurred.equalsIgnoreCase("exists"))
                                        out.print( "<span class=\"red_text\">The email you entered already exists in the database!</span>" );
                                    else if (exOccurred.equalsIgnoreCase("true"))
                                        out.print( "<span class=\"red_text\">An error occurred while accessing the database!</span>" ); 
                                    else {
                                        out.print("Your email was added successfully to the database.<br />Thank you for subscribing to our newsletter!");
                                    } 

                                    if ((page_name.equalsIgnoreCase("null")) || (page_name.equalsIgnoreCase("")) || (page_name == null)) 
                                        page_name = "index.jsp";
                                %>
                                <br /><br />
                                <!-- after clicking on the button the web page is loaded where the user was before clicking on the Subscribe button -->
                                <form action=<%= page_name %> method="post" > 
                                    <!-- adding the button Subscribe, btn-info is used for defining the color of the button,
                                         form-control-sm is used for smaller size of the button -->
                                    <button type="submit" class="btn btn-info btn-sm" id="btnClose">Close</button>
                                </form>    
                                <!-- the FORM was here -->
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
    </body>
</html>
