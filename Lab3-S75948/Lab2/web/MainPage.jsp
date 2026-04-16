<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Main Page</title>
    </head>
    <body>
        
        <%@include file="headerPage.jsp" %>

        <h1>Using JSP Include directive</h1>
        
        <h4 style="color: red">
            Java Server Page (JSP) is a technology for controlling the content or appearance of Web pages through the use of servlets, small programs that are specified in the Web page and run on the Web server to modify the Web page before it is sent to the user who requested it
        </h4>

        <%@include file="footerPage.jsp" %>

    </body>
</html>