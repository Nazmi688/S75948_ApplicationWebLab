<%-- 
    Document   : processCalculateCarLoan.jsp
    Created on : 14 Apr 2026, 3:41:54 PM
    Author     : MP2-4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
         
        <fieldset>
           
    <%
    //define variables..
        String Amount = null;
        String period = null;
        //use request.getParameter() method to retrieve data from the form in memberRegister.jsp
        Amount = request.getParameter("Amount");
        period = request.getParameter("period");
    %>
    <!-- display the output-->
    <h1>Details of car loan</h1>
    <p>This is your details:</p>
    <p>LoanRequest: <%= Amount%></p>
    <p>Period of payment : <%= period %></p>

    </fieldset>
    </body>
</html>
