<%-- 
    Document   : registerSubject
    Created on : 19 May 2026, 11:20:18?pm
    Author     : Nazmi
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Subject</title>
</head>

<body>

<h2>Register Subject</h2>

<form action="<%=request.getContextPath()%>/SubjectServlet?action=add"
      method="post">

    Subject Code:
    <input type="text" name="subjectCode" required>

    <br><br>

    Subject Name:
    <input type="text" name="subjectName" required>

    <br><br>

    <input type="submit" value="Register">

</form>

<br>

<a href="<%=request.getContextPath()%>/SubjectServlet?action=view">
    View Subjects
</a>

</body>
</html>