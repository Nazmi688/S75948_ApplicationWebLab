<%@page import="java.util.ArrayList"%>

<%@ include file="header.jsp" %>

<h2>Member Directory</h2>

<%
ArrayList<String[]> members =
    (ArrayList<String[]>) application.getAttribute("members");
%>

<table border="1" cellpadding="10">
<tr>
    <th>No</th>
    <th>Name</th>
    <th>Matric No</th>
    <th>Club</th>
</tr>

<%
if (members != null && members.size() > 0) {
    for (int i = 0; i < members.size(); i++) {
%>
<tr>
    <td><%= i + 1 %></td>
    <td><%= members.get(i)[0] %></td>
    <td><%= members.get(i)[1] %></td>
    <td><%= members.get(i)[2] %></td>
</tr>
<%
    }
} else {
%>
<tr>
    <td colspan="4">No members registered yet</td>
</tr>
<%
}
%>

</table>

<%@ include file="footer.jsp" %>