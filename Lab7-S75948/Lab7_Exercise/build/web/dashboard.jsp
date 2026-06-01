<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String matricNo
            = (String) session.getAttribute("matricNo");

    if (matricNo == null) {

        response.sendRedirect(request.getContextPath()+"/login.html");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
    </head>

    <body>

        <h1>Student Dashboard</h1>

        <hr>

        <h3>

            Welcome <%= matricNo%>

        </h3>

        <hr>

        <a href="Subject/registerSubject.jsp">

            Register Subject

        </a>

        <br><br>

        <a href="<%=request.getContextPath()%>/SubjectServlet?action=view">
    View Subjects
</a>

    </body>
</html>