<%@page import="com.lab.bean.SubjectBean"%>

<%
    SubjectBean sb
            = (SubjectBean) request.getAttribute("subject");
%>
<%@page import="com.lab.bean.SubjectBean"%>


<!DOCTYPE html>
<html>
<head>
    <title>Update Subject</title>
</head>

<body>

<h2>Update Subject</h2>

<form action="<%=request.getContextPath()%>/SubjectServlet?action=update"
      method="post">

    <input type="hidden"
           name="id"
           value="<%=sb.getId()%>">

    Subject Code:

    <input type="text"
           name="subjectCode"
           value="<%=sb.getSubjectCode()%>">

    <br><br>

    Subject Name:

    <input type="text"
           name="subjectName"
           value="<%=sb.getSubjectName()%>">

    <br><br>

    <input type="submit"
           value="Update">

</form>

</body>
</html>