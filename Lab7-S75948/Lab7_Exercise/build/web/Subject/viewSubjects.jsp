<%@page import="java.util.ArrayList"%>
<%@page import="com.lab.bean.SubjectBean"%>

<%
ArrayList<SubjectBean> list =
        (ArrayList<SubjectBean>)
        request.getAttribute("subjectList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Subjects</title>
</head>

<body>

<h2>Subject List</h2>

<a href="<%=request.getContextPath()%>/Subject/registerSubject.jsp">
    Add Subject
</a>

<br><br>

<table border="1">

<tr>
    <th>ID</th>
    <th>Code</th>
    <th>Name</th>
    <th>Action</th>
</tr>

<%
for(SubjectBean sb : list){
%>

<tr>

    <td><%=sb.getId()%></td>
    <td><%=sb.getSubjectCode()%></td>
    <td><%=sb.getSubjectName()%></td>

    <td>

        <a href="<%=request.getContextPath()%>/SubjectServlet?action=edit&id=<%=sb.getId()%>">
            Edit
        </a>

        |

        <a href="<%=request.getContextPath()%>/SubjectServlet?action=delete&id=<%=sb.getId()%>"
           onclick="return confirm('Delete this subject?');">
            Delete
        </a>

    </td>

</tr>

<%
}
%>

</table>

</body>
</html>