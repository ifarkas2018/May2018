<%-- 
    Document   : search_form
    Created on : 18-Sep-2018, 01:33:11
    Author     : Ingrid Farkas
--%>
<!-- search_form.jsp - adds the form on the page Search Book -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="miscellaneous.AquaMethods"%>

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
        <script>
            NUM_FIELDS = 7; // number of the input fields on the form
            INPUT_FIELDS = 12;  
            // setCookie: creates cookie inputI = value in the input field ; ( I - number 0..2 )
            function setCookie() {           
                var i;
                var inp_names = new Array('title', 'author', 'isbn', 'price_range', 'sortby', 'categ', 'publ_year'); // names of the input fields
                
                for ( i = 0; i < NUM_FIELDS; i++ ) {
                    document.cookie = "input" + i + "=" + document.getElementById(inp_names[i]).value + ";"; // creating a cookie
                } 
            }
            
            // setDefaults : sets the values of the cookies ( input0, input1, input12 ) to the default and
            // writes the content of every input field to the cookie
            function setDefaults() {   
                var i;
                for ( i = 0; i < INPUT_FIELDS; i++ ) {
                    document.cookie = "input" + i + "= "; // setting the VALUE of the cookie to EMPTY
                }
                setCookie(); // go through every input field and write its content to the cookie
            } 
        </script>    
    </head>
    
    <body onload="setDefaults()">
        
        <%
            final String PAGE_NAME = "search_page.jsp"; // page which is loaded now 
        %>
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
                                
                                <%  
                                    HttpSession hSession2 = AquaMethods.returnSession(request);
                                    String input0 = ""; // read the value which was before in the 1st input field and show it again
                                    String input1 = ""; // read the value  in the 2nd input field and show it again
                                    String input2 = ""; // read the value which was before in the 3rd input field and show it again        
                                    String input3 = ""; // read the value which was before in the 1st drop down list and show it again        
                                    String input4 = ""; // read the value which was before in the 2nd drop down list and show it again        
                                    String input5 = ""; // read the value which was before in the 3rd drop down list and show it again        
                                    String input6 = ""; // read the value which was before in the 4th input field and show it again        
                                    
                                    // IDEA : fill_in variable is set in SubscrServl.java - true if some of the input session variables were set,
                                    // and they need to be added to the form here - this is true if the user BEFORE LOADED THIS PAGE and after that he entered
                                    // the email to subscribe ( in the footer ) and on the next page he clicked on Close
                                    if (AquaMethods.sessVarExists(hSession2, "fill_in")) { 
                                        String fill_in = String.valueOf(hSession2.getAttribute("fill_in")); 
                                        // session variable page_name is set below. It is used if the user clicks on the Subscribe button and after that on
                                        // the page subscrres_content if the user clicks on the Close button. then this page will be shown again
                                        if (AquaMethods.sessVarExists(hSession2, "page_name")) { 
                                            String page_name = String.valueOf(hSession2.getAttribute("page_name"));
                                            // if the user clicked on the Close button on the page subscrres_content and this page was shown before (page_name)
                                            // and if something is stored in session variables input 
                                            // then retrieve the session variable input0 ( to show it in the 1st input field 
                                            if ((page_name.equalsIgnoreCase(PAGE_NAME)) && (fill_in.equalsIgnoreCase("true"))) {
                                                if (AquaMethods.sessVarExists(hSession2, "input0")) {
                                                    input0 = String.valueOf(hSession2.getAttribute("input0")); // the value that was in the 1st input field
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input1")) {
                                                    input1 = String.valueOf(hSession2.getAttribute("input1")); // the value that was in the 2nd input field
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input2")) {
                                                    input2 = String.valueOf(hSession2.getAttribute("input2")); // the value that was in the 3rd input field
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input3")) {
                                                    input3 = String.valueOf(hSession2.getAttribute("input3")); // the value that was in the 1st drop down list
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input4")) {
                                                    input4 = String.valueOf(hSession2.getAttribute("input4")); // the value that was in the 2nd drop down list
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input5")) {
                                                    input5 = String.valueOf(hSession2.getAttribute("input5")); // the value that was in the 3rd drop down list
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input6")) {
                                                    input6 = String.valueOf(hSession2.getAttribute("input6")); // the value that was in the 3rd drop down list
                                                } 
                                                
                                                
                                                //AquaMethods.setToEmptyInput(request, hSession2); // setToEmpty: set the session variable values to "" for the variables named input0, input1, ...
                                                //hSession2.setAttribute("page_name", ""); // reseting the sess. var. page_name
                                            } 
                                            //hSession1.setAttribute("page_name", ""); // reseting the sess. var. page_name
                                        }
                                        hSession2.setAttribute("fill_in", "false"); // the input fields don't need to be filled in
                                    } else {
                                        //AquaMethods.setToEmptyInput(request, hSession2 ); // setToEmpty: set the session variable values to "" for the variables named input0, input1, ...
                                    }
                                    // store on which page I am now in case the user clicks on subscribe button in the footer
                                    hSession2.setAttribute("page_name", PAGE_NAME);
                                    AquaMethods.setToEmptyInput(request, hSession2 ); // setToEmpty: set the session variable values to "" for the variables named input0, input1, ...
                                %>
                                
                                <!-- after clicking on the button searchDB.jsp is shown -->
                                <form action="searchDB.jsp" method="post">
                                    <div class="form-group">
                                        <label for="title">Title:</label> <!-- title label -->
                                        <!-- filling in the title is required  -->
                                        <input type="text" class="form-control form-control-sm" name="title" id="title" onchange="setCookie()" required value = "<%= input0 %>"> 
                                        <label class="red_text">* Required Field</label>
                                    </div>
                                    <div class="form-group">
                                        <label for="author">Author's Name:</label> <!-- author's name label -->
                                        <input type="text" class="form-control form-control-sm" name="author" id="author" onchange="setCookie()" value = "<%= input1 %>"> <!-- the input element for author -->
                                    </div>
                
                                    <div class="form-group">
                                        <label for="isbn">ISBN:</label> <!-- ISBN label -->
                                        <input type="text" class="form-control form-control-sm" name="isbn" id="isbn" maxlength="13" onchange="setCookie()" value = "<%= input2 %>"> <!-- the input element for ISBN -->
                                    </div>
                
                                    <div class="form-group">
                                        <label for="price_range">Price Range:</label> <!-- price range label -->
                                        <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                        <select class="form-control form-control-sm" name="price_range" id="price_range" onchange="setCookie()"> 
                                            <% if (input3.equalsIgnoreCase("all")){ %>
                                                <option value="all" selected>All Prices</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="all">All Prices</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("less5")){ %>
                                                <option value="less5" selected>Prices under £5</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="less5">Prices under £5</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("betw5-10")){ %>
                                                <option value="betw5-10" selected>Prices £5 - £10</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="betw5-10">Prices £5 - £10</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("betw10-20")){ %>
                                                <option value="betw10-20" selected>Prices £10 - £20</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="betw10-20">Prices £10 - £20</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("betw20-30")){ %>
                                                <option value="betw20-30" selected>Prices £20 - £30</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="betw20-30">Prices £20 - £30</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("betw30-50")){ %>
                                                <option value="betw30-50" selected>Prices £30 - £50</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="betw30-50">Prices £30 - £50</option>
                                            <% } %>
                                            
                                            <% if (input3.equalsIgnoreCase("above50")){ %>
                                                <option value="above50" selected>Prices Above £50</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="above50">Prices Above £50</option>
                                            <% } %>
                                            
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="sortby">Sort by:</label>
                                        <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                        <select class="form-control form-control-sm" name="sortby" id="sortby" onchange="setCookie()"> 
                                            <% if (input4.equalsIgnoreCase("low")){ %>
                                                <option value="low" selected>Price ( Low - High )</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="low">Price ( Low - High )</option>
                                            <% } %>
                                            
                                            <% if (input4.equalsIgnoreCase("high")){ %>
                                                <option value="high" selected>Price ( High - Low )</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="high">Price ( High - Low )</option>
                                            <% } %>
                                        </select>
                                    </div>
                
                                    <div class="form-group"> 
                                        <label for="categ">Category</label> <!-- category label -->
                                        <!-- creating a drop down list; form-control-sm is used for narrower control -->
                                        <select class="form-control form-control-sm" name="categ" id="categ" onchange="setCookie()">
                                            <% if (input5.equalsIgnoreCase("all")){ %>
                                                <option value="all" selected>All Categories</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="all">All Categories</option>
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("fict")){ %>
                                                <option value="fict" selected>Fiction &amp; Poetry</option> 
                                            <% } else { %>
                                                <option value="fict">Fiction &amp; Poetry</option>   
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("business")){ %>
                                                <option value="bus" selected>Business</option> 
                                            <% } else { %>
                                                <option value="bus">Business</option>      
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("edu")){ %>
                                                <option value="edu" selected>Education</option> 
                                            <% } else { %>
                                                <option value="edu">Education</option>   
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("comp")){ %>
                                                <option value="comp" selected>Computing &amp; IT</option> 
                                            <% } else { %>
                                                <option value="comp">Computing &amp; IT</option>  
                                            <% } %>
                                            
                                            <% if (input5.equalsIgnoreCase("child")){ %>
                                                <option value="child" selected>Children's</option> 
                                            <% } else { %>
                                                <option value="child">Children's</option>  
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="publ_year">Publication Year:</label> <!-- publication year label -->
                                        <input type="text" class="form-control form-control-sm" id="publ_year" name="publ_year" onchange="setCookie()" value = "<%= input6 %>"> <!-- the input element for the publication year -->
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
