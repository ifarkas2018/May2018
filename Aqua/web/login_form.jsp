<%-- 
    Document   : login_page.jsp
    Created on : 31-Mar-2019, 21:19:51
    Author     : user
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="miscellaneous.AquaMethods"%>

<!-- login.jsp - shows the form for entering the username, password -->
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
        <script>
            // setCookie: creates cookie cname = value in the input field ;
            // input_id the id of the input field where the user entered the value ( which needs to be written to the cookie )
            function setCookie(cname, input_id) {
                document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;"; // deleting a cookie
                document.cookie = cname + "=" + document.getElementById(input_id).value + ";"; // creating a cookie
                // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                // cookie1 = document.cookie;
                // document.getElementById("demo").innerHTML = cname + "=" + document.getElementById(input_id).value + ";" ; // document.getElementById(input_id).value

            }

  // @@@@@@@@@@@@@@ DELETE THIS
  function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

// @@@@@@@@@@@@@@ DELETE THIS
function checkCookie() {
  var user=getCookie("username");
  if (user != "") {
    alert("Welcome again " + user);
  } else {
     user = prompt("Please enter your name:","");
     if (user != "" && user != null) {
       setCookie("username", user, 30);
     }
  }
}
        </script>    
    </head>
    
    <title>Login</title>
    <body>
        <%
            final String PAGE_NAME = "login_page.jsp"; // page which is loaded now 
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
                                <h3>Login</h3> <!-- title on the web page -->
                                <br/> 
                                
                                <form id="login" action="LoginServlet" method="post">
                                <!-- creating the input element for the username -->
                                <div id="demo">Demo</div>
                                    <div class="form-group">
                                        <label for="username">Username:</label> <!-- username label -->
                                        <%  //HttpSession hSession = request.getSession(); // retrieve the session to which I am going to add variables
                                            HttpSession hSession = AquaMethods.returnSession(request);
                                            /*
                                            if ( AquaMethods.sessVarExists(hSession, "fill_in")) {  
                                                // set the value of fill_in to DEFAULT ( whether there are some session var. which contain values 
                                                // of the input fields that need later to be filled in )
                                                hSession.setAttribute("fill_in","false");  
                                            }
                                            if ( AquaMethods.sessVarExists(hSession, "page_name")) { 
                                                // set the value of the page_name to DEFAULT
                                                // page_name - name of the page where the user was just before he entered the email. 
                                                hSession.setAttribute("page_name", ""); 
                                            }
                                            */
                                            String input0 = ""; // read the value which was before in the input field username to show it again
                                            // IDEA : fill_in variable is set in SubscrServl.java - true if some of the input session variables were set,
                                            // and they need to be added to the form here - this true if the user BEFORE LOADED THIS PAGE and after that he entered
                                            // the email to subscribe ( in the footer ) and on the next page he clicked on Close
                                            if (AquaMethods.sessVarExists(hSession, "fill_in")) { 
                                                String fill_in = String.valueOf(hSession.getAttribute("fill_in")); 
                                                // session variable page_name is set below. It is used if the user clicks on the Subscribe button and after that on
                                                // the page subscrres_content if the user clicks on the Close button then this page will be shown again
                                                if (AquaMethods.sessVarExists(hSession, "page_name")) { 
                                                    String page_name = String.valueOf(hSession.getAttribute("page_name"));
                                                    // if the user clicked on the Close button on the page subscrres_content and this page was shown before (page_name)
                                                    // and if something is stored in session variables input 
                                                    // then retrieve the session variable input0 ( to show it in the input field username 
                                                    if ((page_name.equalsIgnoreCase(PAGE_NAME)) && (fill_in.equalsIgnoreCase("true"))) {
                                                        if (AquaMethods.sessVarExists(hSession, "input0")) {
                                                            input0 = String.valueOf(hSession.getAttribute("input0")); // the value that was in this input field
                                                        } 
                                                        AquaMethods.setToEmptyInput(request, hSession); // setToEmpty: set the session variable values to "" for the variables named input0, input1, ...
                                                        //hSession.setAttribute("page_name", ""); // reseting the sess. var. page_name
                                                    }
                                                    //hSession.setAttribute("page_name", ""); // reseting the sess. var. page_name
                                                }
                                                hSession.setAttribute("fill_in", "false"); // the input fields don't need to be filled in
                                            } 
                                            
                                            // store on which page I am now in case the user clicks on subscribe button in the footer
                                            hSession.setAttribute("page_name", PAGE_NAME);
                                        %>
                                        
                                        <!-- filling in the username: required -->
                                        <input type="text" class="form-control form-control-sm" name="username" id="username" onchange="setCookie('input0','username')" required value = "<%= input0 %>" > 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                                        
                                    <!-- creating the input element for the password -->
                                    <div class="form-group">
                                        <label for="passw">Password:</label> <!-- password name label -->
                                        <!-- filling in the passw: required -->
                                        <input type="password" class="form-control form-control-sm" name="passw" id="passw" required> 
                                        <label class="text_color">* Required Field</label>
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
