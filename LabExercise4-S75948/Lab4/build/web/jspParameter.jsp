<%-- 
    Document   : jspParameter
    Created on : 21 Apr 2026, 3:22:43 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Using JSP Standard Action</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:include and jsp:param</h1>

            <%
                // Define the data to be passed
                String sCode = "CSE3023";
                String sSubject = "Web-based Application Development";
                String sCredit = "3(2+1)";
            %>

            <jsp:include page="subjectInfo.jsp" flush="true">
                <jsp:param name="code" value="<%= sCode %>" />
                <jsp:param name="subject" value="<%= sSubject %>" />
                <jsp:param name="credit" value="<%= sCredit %>" />
            </jsp:include>
            
        </div>
    </body>
</html>