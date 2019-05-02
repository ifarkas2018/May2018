/*
 * author: Ingrid Farkas
 * project: Aqua Bookstore
 * AquaMethods.java : methods used more then once
 */
package miscellaneous;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class AquaMethods {
    // private static HttpSession hSession;
    
    
    public static HttpSession returnSession( HttpServletRequest request ){
        HttpSession hSession = request.getSession(); // retrieve the session ( to which I am going to add and read variables )
        return hSession;
    }
    
    //public static HttpSession getSession(HttpServletRequest request){
        //return hSession;
    //}
    
    // sessVarExists: returns whether the session var. named name exists in the hSession
    public static boolean sessVarExists(HttpSession hSession, String name){ 
        boolean attr_found = false; // is the atribute named name one of variables in the session
        String attrName = ""; // the name of the attribute in the session
        Enumeration enumAttr; // enumeration of variable names added to the session
        enumAttr = hSession.getAttributeNames(); // the names of the session variables 
        while ((enumAttr.hasMoreElements()) && (!attr_found)) { // while the Enumeration has more el.
            attrName = String.valueOf(enumAttr.nextElement()); // read the next element
            if (attrName.equals(name)) {
                attr_found = true; // attribute with the name emp_adr was found
            }
        }
        return attr_found;
    }
    
    // setToEmptyInput: set the session variable values to "" for the variables named input0, input1, ...
    public static void setToEmptyInput(HttpServletRequest request, HttpSession hSession){
        String attrName = ""; // the name of the attribute in the session
        Enumeration enumAttr; // enumeration of variable names added to the session
        //HttpSession hSession = request.getSession(); // retrieve the session 
        enumAttr = hSession.getAttributeNames(); // the names of the session variables 
        while ((enumAttr.hasMoreElements())) { // while the Enumeration has more el.
            attrName = String.valueOf(enumAttr.nextElement()); // read the next element
            if (attrName.startsWith("input")) {
                //hSession.setAttribute(attrName, ""); // attribute with the name emp_adr was found
                hSession.removeAttribute(attrName);
            }
        }
    }
    
    // setToEmpty: set the session variable values to "" 
    
    public static void setToEmpty(HttpServletRequest request, HttpSession hSession){
        String attrName = ""; // the name of the attribute in the session
        Enumeration enumAttr; // enumeration of variable names added to the session
        //HttpSession hSession = returnSession(request); // retrieve the session 
        enumAttr = hSession.getAttributeNames(); // the names of the session variables 
        while ((enumAttr.hasMoreElements())) { // while the Enumeration has more el.
            attrName = String.valueOf(enumAttr.nextElement()); // read the next element
            //if (attrName.startsWith("input")) {
                hSession.removeAttribute(attrName); // attribute with the name emp_adr was found
            //}
        }
       
    }
    
}
