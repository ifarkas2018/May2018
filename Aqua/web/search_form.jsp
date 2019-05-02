<%-- 
    Document   : search_form
    Created on : 18-Sep-2018, 01:33:11
    Author     : Ingrid Farkas
--%>
<!-- search_form.jsp - adds the form on the page Search Book -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Book</title>
        <!-- internal style sheet -->
        <style>
            .red_text {
                color:red; /* red text color */
            }
        </style>
    </head>
    
    <body>
        <!-- adding a new row to the Bootstrap grid; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <!-- the Bootstrap column takes 6 columns on the large desktops and 6 columns on the medium sized desktops -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="picture of books" title="picture of books"> 
                    </div>
                </div>
                       
                <!-- the Bootstrap column takes 5 columns on the large desktops and 5 columns on the medium sized desktops -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container">
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col"> <!-- adding a new column to the Bootstrap grid -->
                                &nbsp; &nbsp;
                                <br/>
                                <h3>Search</h3>
                                <br/> 
                                Wildcards:  
                                <!-- adding an unordered list with two list items -->
                                <ul>
                                    <li>_ - represents a single character</li>
                                    <li>% - represents a zero, single or multiple characters
                                </ul>
                                <!-- after clicking on the button searchDB.jsp is shown -->
                                <form action="searchDB.jsp" method="post">
                                    <div class="form-group">
                                        <label for="labtitle">Title:</label> <!-- title label -->
                                        <!-- filling in the title is required  -->
                                        <input type="text" class="form-control form-control-sm" name="title" id="title" required> 
                                        <label class="red_text">* Required Field</label>
                                    </div>
                                    <div class="form-group">
                                        <label for="labauthor">Author's Name:</label> <!-- author's name label -->
                                        <input type="text" class="form-control form-control-sm" name="author" id="author"> <!-- the input element for author -->
                                    </div>
                
                                    <div class="form-group">
                                        <label for="labisbn">ISBN:</label> <!-- ISBN label -->
                                        <input type="text" class="form-control form-control-sm" name="isbn" id="isbn"> <!-- the input element for ISBN -->
                                    </div>
                
                                    <div class="form-group">
                                        <label for="labisbn">Price Range:</label> <!-- price range label -->
                                        <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                        <select class="form-control form-control-sm" name="price_range"> 
                                            <option>All Prices</option>
                                            <option value="less5">Prices under £5</option> <!-- option shown in the drop down list -->
                                            <option value="betw5-10">Prices £5 - £10</option>
                                            <option value="betw10-20">Prices £10 - £20</option>
                                            <option value="betw20-30">Prices £20 - £30</option>
                                            <option value="betw30-50">Prices £30 - £50</option>
                                            <option value="above50">Prices Above £50</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="labsort">Sort by:</label>
                                        <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                        <select class="form-control form-control-sm" name="sortby" > 
                                            <option value="low">Price ( Low - High )</option> <!-- option shown in the drop down list -->
                                            <option value="high">Price ( High - Low )</option>
                                        </select>
                                    </div>
                
                                    <div class="form-group"> 
                                        <label for="labcategory">Category</label> <!-- category label -->
                                        <!-- creating a drop down list; form-control-sm is used for narrower control -->
                                        <select class="form-control form-control-sm" name="categ">
                                            <option>All Categories</option> <!-- option shown in the drop down list -->
                                            <option value="fict">Fiction &amp; Poetry</option>
                                            <option value="bus">Business</option>
                                            <option value="edu">Education</option>
                                            <option value="comp">Computing &amp; IT</option>
                                            <option value="child">Children's</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="labpublyear">Publication Year:</label> <!-- publication year label -->
                                        <input type="text" class="form-control form-control-sm" id="publ_year" name="publ_year"> <!-- the input element for the publication year -->
                                    </div>

                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>

                                    <!-- adding the Search button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                    <button type="submit" class="btn btn-info btn-sm">Search</button>
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
