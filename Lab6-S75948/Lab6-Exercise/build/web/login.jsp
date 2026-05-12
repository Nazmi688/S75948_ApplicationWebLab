<%-- 
    Document   : login
    Created on : 12 May 2026, 9:38:57 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
</head>
<body>

    <h2>Login Form</h2>

    <form action="doLogin.jsp" method="post">

        Username :
        <input type="text" name="username" required>
        <br><br>

        Password :
        <input type="password" name="password" required>
        <br><br>

        <input type="submit" value="Login">

    </form>

</body>
</html>