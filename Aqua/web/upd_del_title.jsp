<%-- 
    Document   : upd_del_title
    Created on : 14-Mar-2019, 04:27:45
    Author     : Ingrid Farkas
    called from update_prev.jsp
--%>

<!-- upd_del_title.jsp - shows the form for entering the title, author, ISBN of the book whose inform. is updated ( or deleted ) -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="miscellaneous.AquaMethods"%>

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
        <script>
            // setCookie: creates cookie cname = value in the input field ;
            // input_id the id of the input field where the user entered the value ( which needs to be written to the cookie )
            // for ME : cname = input0 or input1,... inputid=username @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            function setCookie(cname, input_id) {
              //var d = new Date();
              //d.setTime(d.getTime() + (exdays*24*60*60*1000));
              //var expires = "expires=" + d.toGMTString();
              //document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";

              document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;"; // DELETING a cookie

              document.cookie = cname + "=" + document.getElementById(input_id).value + ";"; // creating a cookie
              cookie1 = document.cookie;
              // alert("cname=" + cname + "cvalue" + cvalue );
              document.getElementById("demo").innerHTML = cname + "=" + document.getElementById(input_id).value + ";" ; // document.getElementById(input_id).value

            }
            
            // setDefaults : sets the values of the cookies ( input0, input1, input2 ) to the default
            function setDefaults() {
                document.cookie = "input0" + "= "; // setting the VALUE of the cookie to EMPTY
                document.cookie = "input1" + "= "; // setting the VALUE of the cookie to EMPTY
                document.cookie = "input2" + "= "; // setting the VALUE of the cookie to EMPTY
            }
            
        </script>
        <%
            //HttpSession hSession1 = request.getSession(); // retrieve the session to which I am going to add variables
            HttpSession hSession2 = AquaMethods.returnSession(request);
            
            String source = (String)hSession2.getAttribute("source_name"); // on which page I am now
        %>
    </head>
    
    <title> <%= source %> </title>
    
    <body onload="setDefaults()">
        <%
            final String PAGE_NAME = "update_prev.jsp"; // page which is loaded now 
        %>
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
                                <% 
                                    out.print("<h3>" + source + "</h3>"); // source is Update Book ( for the Update ), or Delete Book ( for the Delete )                                  
                                %>
                               
                                <br/> 
                                <% if (source.equals("Update Book")) {
                                %>
                                    Please enter the information about the book
                                <% } else if (source.equals("Delete Book")) {
                                %>
                                    Please enter the information about the book
                                <%
                                   }
                                %>
                                
                                <br />
                                <br />
                                <% if (source.equals("Update Book")) {
                                %>
                                    <!-- after clicking on the button update_page.jsp is shown -->
                                    <form id="upd_del_book" action="update_page.jsp" method="post">
                                <%
                                   } else if (source.equals("Delete Book")) {
                                %>
                                       <!-- after clicking on the button DelServlet is shown -->
                                       <form id="upd_del_book" action="DelServlet" method="post">
                                <%
                                   }
                                %>
                                <div id="demo">Demo</div>
                                <%  
                                    
                                    String input0 = ""; // read the value which was before in the input field prev_title and show it again
                                    String input1 = ""; // read the value  in the input field prev_author and show it again
                                    String input2 = ""; // read the value which was before in the input field prev_isbn and show it again        
                                    
                                    if (AquaMethods.sessVarExists(hSession2, "input1")) { 
                                        String str1 = String.valueOf(hSession2.getAttribute("input1")); 
                                    }
                                    
                                    // IDEA : fill_in variable is set in SubscrServl.java - true if some of the input session variables were set,
                                    // and they need to be added to the form here - this true if the user BEFORE LOADED THIS PAGE and after that he entered
                                    // the email to subscribe ( in the footer ) and on the next page he clicked on Close
                                    if (AquaMethods.sessVarExists(hSession2, "fill_in")) { 
                                        String fill_in = String.valueOf(hSession2.getAttribute("fill_in")); 
                                        // session variable page_name is set below. It is used if the user clicks on the Subscribe button and after that on
                                        // the page subscrres_content if the user clicks on the Close button. then this page will be shown again
                                        if (AquaMethods.sessVarExists(hSession2, "page_name")) { 
                                            String page_name = String.valueOf(hSession2.getAttribute("page_name"));
                                            // if the user clicked on the Close button on the page subscrres_content and this page was shown before (page_name)
                                            // and if something is stored in session variables input 
                                            // then retrieve the session variable input0 ( to show it in the input field username 
                                            if ((page_name.equalsIgnoreCase(PAGE_NAME)) && (fill_in.equalsIgnoreCase("true"))) {
                                                if (AquaMethods.sessVarExists(hSession2, "input0")) {
                                                    input0 = String.valueOf(hSession2.getAttribute("input0")); // the value that was in this input field
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input1")) {
                                                    input1 = String.valueOf(hSession2.getAttribute("input1")); // the value that was in this input field
                                                } 
                                                if (AquaMethods.sessVarExists(hSession2, "input2")) {
                                                    input2 = String.valueOf(hSession2.getAttribute("input2")); // the value that was in this input field
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
                                    <!-- creating the input element for the title -->
                                    <div class="form-group">
                                        <label for="labtitle">Title:</label> <!-- title label -->
                                        <!-- filling in the title: required -->
                                        <input type="text" class="form-control form-control-sm" name="prev_title" id="prev_title" onchange="setCookie('input0','prev_title')" required value = "<%= input0 %>" > 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                                        
                                    <!-- creating the input element for the author -->
                                    <div class="form-group">
                                        <label for="labauthor">Author's Name:</label> <!-- author's name label -->
                                        <input type="text" class="form-control form-control-sm" name="prev_author" id="prev_author" onchange="setCookie('input1','prev_author')" value = "<%= input1 %>" >  
                                    </div>
                
                                    <!-- creating the input element for the ISBN -->
                                    <div class="form-group">
                                        <label for="labisbn">ISBN:</label> <!-- ISBN label -->
                                        <!-- input field for the ISBN: maximum 13 characters -->
                                        <input type="text" class="form-control form-control-sm" maxlength="13" name="prev_isbn" id="prev_isbn" onchange="setCookie('input2','prev_isbn')" value = "<%= input2 %>" > 
                                    </div>
                                    <div class="container">                                                                               

                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>
                                    
                                    <%
                                    if (source.equals("Delete Book")) {
                                    %>
                                        <!-- adding the Delete button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                        <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Delete</button>
                                    <% } else {
                                    %>
                                       <!-- adding the Next button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                       <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Next</button>
                                    <% }
                                    %>
                                    
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