<%-- 
    Document   : errorStudent
    Created on : 12 May 2026, 9:55:13 pm
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
        <form id="errorFrm" action="insertStudent.jsp" method="post">
            <h1>Lab 9 - Task 1 - Perform creating and retrieving records via JSP page</h1>
            <p>Error occurred when inserting record...!</p>
            <p><jsp:expression> exception.getMessage() </jsp:expression></p>
            <br>
        </form>
    </body>
</html>