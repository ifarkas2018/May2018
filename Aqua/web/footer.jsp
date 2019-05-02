<%-- 
    Document   : footer
    Created on : 02-Sep-2018, 01:51:27
    Author     : user
--%>
<!-- footer.jsp builds the footer of the web page --> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body> 
        <footer>
            <!-- footer is a class ( in templatecss.css ) defining the style of this div element -->
            <div class="footer" align="center" id="footer">
                <div class="container"> 
                    <div class="row"> 
                        <!-- the Bootstrap column takes 2 columns on the large screen, 6 columns on the medium sized screens,
                             4 columns on the small sized screens, 6 columns on the extra small screens -->
                        <div  class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                            &nbsp; &nbsp; <!-- adding some empty space -->
                        </div>
                        <!-- the Bootstrap column takes 2 columns on the large screen, 2 columns on the medium sized screens,
                             4 columns on the small sized screens, 6 columns on the extra small screens -->
                        <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                            <h3> About </h3> <!-- title of the column -->
                            <!-- smaller-text is a class used to declare the size of the text -->
                            <ul class="smaller-text" >
                                <li> <a href="#"> Our Company </a> </li> <!-- link that appears in the footer -->
                                <li> <a href="#"> About Us </a> </li>
                                <li> <a href="#"> Terms of Services </a> </li>
                                <li> <a href="#"> Our Team </a> </li>
                            </ul>
                        </div>
                        
                        <!-- the Bootstrap column takes 2 columns on the large screen, 2 columns on the medium sized screens -->
                        <div class="col-lg-2  col-md-2"> 
                            &nbsp; &nbsp; <!-- adding some empty space -->
                        </div>
    
                        <!-- the Bootstrap column takes 1 column on the large screens, 1 columns on the medium sized screens -->
                        <div class="col-lg-1  col-md-1"> 
                            &nbsp; &nbsp; 
                        </div>
    
                        <!-- the Bootstrap column takes 3 column on the large screens, 3 columns on the medium sized screens -->
                        <div class="col-lg-3  col-md-3"> 
                            <h3> Subscribe Us </h3> <!-- title of the column -->
                            <ul>
                                <li> 
                                    <div class="container"> 
                                        <!-- after clicking on the button the SubscrServl servlet is called -->
                                        <form action="SubscrServl" method="post"> <!-- action="SubscrServl" method="post" -->
                                            <div class="row"> <!-- adding a new row the grid -->
                                                <div class="col">
                                                    <!-- input element used for entering the email; form-control-sm is used for smaller size of the input element -->
                                                    <input class="form-control form-control-sm" name="subscr_email" id="subscr_email" maxlength="35" id="subscr_email" type="text" placeholder="Email" required>
                                                </div>
                                            </div>
                                            
                                            <div class="row"> <!- adding a new row the grid ->
                                                <div class="col">
                                                    &nbsp; &nbsp;
                                                </div>
                                            </div>
                                            
                                            <div class="row"> <!-- adding a new row the grid -->
                                                <div class="col">
                                                    <!-- adding the button Subscribe, btn-info is used for defining the color of the button,
                                                         form-control-sm is used for smaller size of the button -->
                                                        <button type="submit" class="btn btn-info btn-sm" id="btnSubscr">Subscribe</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div> <!-- end of class="container" -->
                                </li>
                            </ul> 
                        </div> <!-- end of class="col-lg-3  col-md-3" -->
                    </div> <!-- end of class="row" -->
                    
                    <div class="row">
                        <!-- the Bootstrap column takes 12 columns on the large screens, 12 columns on the medium sized screens -->
                        <div class="col-lg-12 col-md-12">
                            &nbsp; &nbsp; <!-- adding some empty space -->
                        </div>
                    </div>
                </div> <!-- end of class="container" -->
            </div> <!-- end of class="footer" --> 
                    
            <div class="footer"> <!-- this is the bottom part of the footer -->
                <div class="container">
                    <div class="row">
                        <!-- the Bootstrap column takes 12 columns on the large screens, 12 columns on the medium sized screens, 
                             12 columns on the extra small sized screens  -->
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            &nbsp; &nbsp; <!-- adding some empty space -->
                        </div>
                    </div>
                    <div class="container text-center">
                        <!-- the Bootstrap column takes 12 columns on the large screens, 12 columns on the medium sized screens, 
                             12 columns on the extra small sized screens  -->
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <!-- adding the copyright information at the bottom of the footer -->
                            <div class="copyright smaller-text"> Copyright &copy; 2018 Aqua. All rights reserved. 94 Grosvenor Ave., London SW1 5RD</div>
                        </div>
                    </div>
                </div> <!-- end of the class="container" -->
            </div> <!-- end of class="footer" -->
        </footer> 
        <!-- ??????????????????????????????????????????????????????????? -->
        <!-- </div> --> <!-- is this NEEDED end of class="container" -->
       
        
        <script>
            
        // IsEmail : returns true if the email address is valid ( otherwise it returns false )
        function IsEmail(email) {
            // regex pattern is used for validating email 
            var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if(!regex.test(email)) {
                return false;
            } else {
                return true;
            }
        }
        </script>
    </body>
</html>
