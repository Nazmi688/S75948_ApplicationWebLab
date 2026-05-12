<%-- 
    Document   : main
    Created on : 12 May 2026, 9:41:44 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
</head>
<body>

    <h2>Welcome to the System</h2>

    Username :
    <%= session.getAttribute("username") %>

    <br><br>

    First Name :
    <%= session.getAttribute("firstname") %>

    <br><br>

    Last Name :
    <%= session.getAttribute("lastname") %>

</body>
</html>