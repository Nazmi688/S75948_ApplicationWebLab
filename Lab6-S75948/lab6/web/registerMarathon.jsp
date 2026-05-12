<%-- 
    Document   : registerMarathon
    Created on : 12 May 2026, 10:44:51 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        <form action="processMarathon.jsp" method="post">
    <fieldset style="width: 50%;">
        <legend>Marathon Registration</legend>
        <table>
            <tr>
                <td>IC No</td>
                <td><input type="text" name="icno" placeholder="E.g.: 921110-10-2514"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" placeholder="Enter your name"></td>
            </tr>
            <tr>
                <td>Category</td>
                <td>
                    <select name="category">
                        <option value="5 KM">5 KM</option>
                        <option value="7 KM">7 KM</option>
                        <option value="10 KM">10 KM</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Cancel">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
    </body>
</html>
