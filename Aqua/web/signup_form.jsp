<%-- 
    Document   : signup_form ( included in signup_page.jsp )
    Created on : 06-Apr-2019, 00:14:14
    Author     : Ingrid Farkas
    called from signup_page.jsp
--%>

<!-- signup_form.jsp - shows the form for entering the username, password, first name, last name, whether the user is an administrator  -->
<!--                 - included in signup_page.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- internal style sheet --> 
        <style>
            .text_color {
                color:red; /* red text color */
            }
        </style>
    </head>
    
    <title>Sign Up</title>
    <body>
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
                                <h3>Sign Up</h3> <!-- title on the web page -->
                                <br/> 
                                <form id="signup" action="SignUpServlet" method="post">                                   
                                    <!-- creating the input element for the username -->
                                    <div class="form-group">
                                        <label for="lab_user">Username:</label> <!-- username label -->
                                        <!-- filling in the username: required -->
                                        <input type="text" class="form-control form-control-sm" name="username" id="username" required> 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                                        
                                    <!-- creating the input element for the password -->
                                    <div class="form-group">
                                        <label for="lab_passw">Password:</label> <!-- password name label -->
                                        <!-- filling in the passw: required -->
                                        <input type="password" class="form-control form-control-sm" name="passw" id="passw" required> 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                                    
                                    <!-- creating the input element for the first name -->
                                    <div class="form-group">
                                        <label for="lab_fname">First Name:</label> <!-- first name label -->
                                        <input type="text" class="form-control form-control-sm" name="first_name" id="first_name"> 
                                    </div>

                                    <!-- creating the input element for the last name -->
                                    <div class="form-group">
                                        <label for="lab_lname">Last Name:</label> <!-- last name label -->
                                        <input type="text" class="form-control form-control-sm" name="last_name" id="last_name"> 
                                    </div>

                                    <!-- creating the input element for the administrator -->
                                    <div class="form-group">
                                        <label for="lab_admin">Administrator:</label> <!-- administrator label -->
                                        <div class="form-check">
                                            <!-- Yes radio button -->
                                            <input class="form-check-input" type="radio" name="admin" id="admin_yes" value="adm_yes">
                                            <label class="form-check-label" for="admin_yes">
                                                Yes
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <!-- No radio button -->
                                            <input class="form-check-input" type="radio" name="admin" id="admin_no" value="adm_no" checked>
                                            <label class="form-check-label" for="admin_no">
                                                No
                                            </label>
                                        </div>
                                    </div>
                                                                               
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>
                                        
                                    <!-- adding the Submit button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                    <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Submit</button>
                                    <!-- adding a new container -->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>

                                    <!-- adding a new container -->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div> 
                                </form>  
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

