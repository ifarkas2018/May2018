<%-- 
    Document   : add_form.jsp
    Created on : 08-Nov-2018, 13:02:11
    Author     : Ingrid Farkas
--%>
<!-- add_form.jsp - adds the form on the page Add Book -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Page</title>
        <!-- internal style sheet -->
        <style>
            .text_color {
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
                                <h3>Add a Book</h3>
                                <br/> 
                                <!-- after clicking on the button AddServlet is shown -->
                                <form id="add_book" action="AddServlet" method="post">
                                    <!-- creating the input element for the title -->
                                    <div class="form-group">
                                        <label for="labtitle">Title:</label> <!-- title label -->
                                        <!-- filling in the title is required -->
                                        <input type="text" class="form-control form-control-sm" name="title" id="title" required> 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                                        
                                    <!-- creating the input element for the author -->
                                    <div class="form-group">
                                        <label for="labauthor">Author's Name:</label> <!-- author's name label -->
                                        <!-- filling in the author is required -->
                                        <input type="text" class="form-control form-control-sm" name="author" id="author" required> 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                
                                    <!-- creating the input element for the ISBN -->
                                    <div class="form-group">
                                        <label for="labisbn">ISBN:</label> <!-- ISBN label -->
                                        <input type="text" class="form-control form-control-sm" maxlength="13" name="isbn" id="isbn"> 
                                    </div>
                                        
                                    <!-- creating the input element for price -->
                                    <div class="form-group">
                                        <label for="labprice">Price:</label> <!-- Price label -->
                                        <input type="text" class="form-control form-control-sm" name="price" id="price"> 
                                    </div>
                                        
                                    <!-- creating the input element for number of pages -->
                                    <div class="form-group">
                                        <label for="labpages">Pages:</label> <!-- Pages label -->
                                        <input type="text" class="form-control form-control-sm" name="pages" id="pages"> 
                                    </div>
                                        
                                    <!-- creating the drop down list for the Category -->
                                    <div class="form-group"> 
                                        <label for="labcategory">Category</label> <!-- category label -->
                                        <!-- creating a drop down list; form-control-sm is used for narrower control -->
                                        <select class="form-control form-control-sm" name="category" id="category">
                                            <option>All Categories</option> <!-- options shown in the drop down list -->
                                            <option>Fiction &amp; Poetry</option>
                                            <option>Business</option>
                                            <option>Education</option>
                                            <option>Computing &amp; IT</option>
                                            <option>Children's</option>
                                        </select>
                                    </div>
                                        
                                    <!-- creating the textarea for the book description -->
                                    <div class="form-group">
                                        <label for="labdescr">Description:</label> <!-- Description label --> 
                                        <textarea class="form-control" name="descr" id="descr" rows="4"></textarea>
                                    </div>
                                        
                                    <!-- creating the input element for the publisher -->
                                    <div class="form-group">
                                        <label for="labpubl">Publisher</label> <!-- publisher label -->
                                        <!-- filling in the publisher is required -->
                                        <input type="text" class="form-control form-control-sm" name="publisher" id="publisher" required> 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                                        
                                    <!-- creating the input element for the city of the publisher -->
                                    <div class="form-group">
                                        <label for="labpublcity">City ( Publisher )</label> <!-- label of the city of the publisher -->
                                        <input type="text" class="form-control form-control-sm" name="publ_city" id="publ_city"> 
                                    </div>
                                        
                                    <!-- creating the input element for year the book got published -->
                                    <div class="form-group">
                                        <label for="labpublyr">Publication Year</label> <!-- the label the book got published -->
                                        <input type="text" class="form-control form-control-sm" name="yrpublished" id="yrpublished"> 
                                    </div> 
                                        
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>
                                        
                                    <!-- adding the Search button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                    <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Add</button>
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

