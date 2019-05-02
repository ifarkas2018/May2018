<%-- 
    Document   : header
    Created on : 02-Sep-2018, 01:50:03
    Author     : user
--%>
<!-- author: Ingrid Farkas -->
<!-- header.jsp creates - company logo, company name and the navigation bar -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>            
        <!-- meta elements -->
        <!-- character set used on the web page -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- specifying the keywords used for Internet search --> 
        <meta name="keywords" content="Aqua, Bookstore in London, Online Bookstore">
        <!-- meta tag used for specifying the description and the purpose of the web site -->
        <meta name="description" content="Browse and Shop From the Wide Selection of Books">
        <meta name="author" content="Ingrid Farkas"> 
        <!-- used for making responsive web pages on devices with different screen sizes -->
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <!-- online Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- a link to the Bootstrap CDN -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
    </head>

    <body class="greybckgr"> <!-- greybckgr - class which defines grey background ( templatecss.css ) -->
        <div class="container">
            <div class="whitebckgr"> <!-- new row - white background -->
            <div class="whitebckgr"> 
                <!-- the Bootstrap column takes 12 columns on the large screens, 12 columns on the medium sized screens,
                     12 columns on the small sized screens, 12 columns on the extra small screens -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p>&nbsp; &nbsp;</p> <!-- adding some empty space -->
                </div>
              
                <div class="row"> <!-- adding a new row to the grid -->
                    <!-- the Bootstrap column takes 5 columns on the large screens, 5 columns on the medium sized screens -->
                    <div class="col-lg-5 col-md-5"> 
                        &nbsp; &nbsp; <!-- adding some empty space -->
                    </div>
                    <!-- the Bootstrap column takes 4 columns on the large screens, 4 columns on the medium sized screens -->
                    <div class="col-lg-4 col-md-4"> 
                        &nbsp;  
                        <!-- image that is the logo of the Aqua; alt - the text that is shown if the image can't be loaded ( alternate text )
                             title - the text that is shown when the user points at the image -->
                        <img class="img-logo" src="images/bookshelf.png" alt="Aqua log" title="Aqua Logo">  
                                    
                        <span class="title-text">Aqua</span> <!-- the title of the bookstore -->
                    </div>
                    
                    <!-- the Bootstrap column takes 7 columns on the large screens, 7 columns on the medium sized screens,
                         12 columns on the small screens, 12 columns on the extra small sized screens -->
                    <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 "> 
                        &nbsp; &nbsp; <!-- adding some empty space -->
                    </div>
                </div> 
            </div>          

            <div class="whitebckgr"> <!-- new row - white background -->
                <div class="col">
                    &nbsp; &nbsp; <!-- adding some empty space -->
                </div>
            </div>    

            <div class="row">
                <!-- the Bootstrap column takes 12 columns on the large screens, 12 columns on the medium sized screens,
                         12 columns on the small screens, 12 columns on the extra small sized screens -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                    <!-- navigation bar -->
                    <nav class="navbar new_nav navbar-expand-sm"> <!-- bg-dark navbar-dark -->
                        <!-- <a class="navbar-brand"><img src="images/bookshelf.png"></a> <!- company logo ->
                        <a class="navbar-brand" href="#">Aqua</a> <!-- name of the company -->
                        <!-- this is a collapsable navbar - when the user resizes the browser window, if the window is of a smaller size,
                             then the button is shown instead of the links -->
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" aria-controls="collapsibleNavbar" aria-    
    expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="collapsibleNavbar">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Home</a> <!-- a link on the navbar -->
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="search_page.jsp">Search</a> <!-- a link on the navbar ->
                                </li>
                                
                                <!-- drop down menu -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Books <!-- link on the navbar -->
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                      <a class="dropdown-item" href="search_page.jsp">Search Books</a> <!-- link on the submenu -->
                                      <!-- @@@@@@@@@@@@@@ <div class="dropdown-divider"></div> --><!-- divider -->
                                      <a class="dropdown-item" href="add_page.jsp">Add Book</a>
                                      <a class="dropdown-item" href="update_prev.jsp">Update Book</a>
                                      <a class="dropdown-item" href="delete_title.jsp">Delete Book</a>
                                    </div>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="#">About</a> <!-- a link on the navbar -->
                                </li>    
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Contact</a> <!-- a link on the navbar -->
                                </li>    
                            </ul>
                        </div> 
                        
                        <!-- <form class="form-inline my-2 my-lg-0"> -->
                        <!--     <a class="nav-link" href="#">Sign Up</a> <!-- a link on the navbar ->
                            <a class="nav-link" href="#">Contact1</a> <!-- a link on the navbar -->
      <!-- <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
      <!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
    <!-- </form> -->
                        <!-- </div> -->
                    </nav>
                    
                </div> <!-- class="col-lg-12 col-md-12 col-sm-12 col-xs-12 -->
            </div> <!-- end of class="row" --> 
        
            <div class="whitebckgr">
                <div class="col-lg-12 col-md-12">
                    &nbsp; &nbsp; <!-- adding some empty space -->
                </div>
            </div>