<%-- 
    Document   : contact_info
    Created on : 10-Apr-2019, 19:49:41
    Author     : Ingrid Farkas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/templatecss.css">
        <title>Contact Us</title>
      
        <!-- internal style sheet -->
        <style>
      
            /* color of the email link after the link was clicked on */
            .email a:visited {
                color: rgb(180, 187, 184) !important;  /* lighter grey */ 
            } 
            /* color of the email link when the user hovers on it */
            .email a:hover, a:active {
                color: #7F8C8D !important;   /* rgb(215,152,235) darker grey #7F8C8D*/ 
            } 
            
            /* color of the email link */ 
            .email a {
                color: #17A2B8 !important;  /* color of the Subscribe button in the footer */
            }
      
        </style>
    </head>
    
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
                                <h3>Contact Us</h3>
                                <br/> 
                                <span class="text-info">
                                    <font size="+2">London</font>
                                </span>
                                <br/>
                                94 Grosvenor Ave., London SW1 5RD <br/>
                                Email: 
                                <span class="email"><a href = "mailto:london@aquabooks.co.uk?subject=Feedback&body=Message">
                                    london@aquabooks.co.uk
                                    </a></span>
                                <br/>
                                <br/>
                                <table class="table table-bordered table-sm">
                                    <thead >
                                      <tr class="table-active">
                                        <th scope="col" colspan="2">Opening Hours</th>
                                        <!-- <th scope="col">First</th> -->
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr class="table-light">
                                        <th scope="row">Monday-Friday</th>
                                        <td>10.00 am - 9.30 pm</td>
                                      </tr>
                                      <tr class="table-light">
                                        <th scope="row">Saturday</th>
                                        <td>10.00 am - 9.00 pm</td>
                                      </tr>
                                      <tr class="table-light">
                                        <th scope="row">Sunday</th>
                                        <!-- <td colspan="2">Larry the Bird</td> -->
                                        <td>10.00 am - 6.00 pm</td>
                                      </tr>
                                    </tbody>
                                  </table>
                                <span class="text-info">
                                    <font size="+2">Norwich</font><br/>
                                </span>
                                78 Main Street, London S2H 8LS <br/>
                                Email: 

                                <span class="email"><a href = "mailto:norwich@aquabooks.co.uk?subject=Feedback&body=Message">
                                    norwich@aquabooks.co.uk
                                    </a></span>
                                    
                                <br/>
                                <br/>
                                <table class="table table-bordered table-sm">
                                    <thead >
                                      <tr class="table-active">
                                        <th scope="col" colspan="2">Opening Hours</th>
                                        <!-- <th scope="col">First</th> -->
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr class="table-light">
                                        <th scope="row">Monday-Friday</th>
                                        <td>7.00 am - 9.30 pm</td>
                                      </tr>
                                      <tr class="table-light">
                                        <th scope="row">Saturday</th>
                                        <td>9.00 am - 5.00 pm</td>
                                      </tr>
                                      <tr class="table-light">
                                        <th scope="row">Sunday</th>
                                        <!-- <td colspan="2">Larry the Bird</td> -->
                                        <td>9.00 am - 5.00 pm</td>
                                      </tr>
                                    </tbody>
                                 </table>
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

