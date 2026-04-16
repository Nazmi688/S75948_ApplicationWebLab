<%@page import="java.util.ArrayList"%>

<%@ include file="header.jsp" %>

<%
String name = request.getParameter("name");
String matric = request.getParameter("matric");
String club = request.getParameter("club");

ArrayList<String[]> members =
    (ArrayList<String[]>) application.getAttribute("members");

if (members == null) {
    members = new ArrayList<>();
}

if (name != null && matric != null && club != null) {
    members.add(new String[]{name, matric, club});
}

application.setAttribute("members", members);
%>

<h2>Registration Successful!</h2>

<p><b>Name:</b> <%= name %></p>
<p><b>Matric:</b> <%= matric %></p>
<p><b>Club:</b> <%= club %></p>

<br>
<a href="memberDirectory.jsp">Go to Member Directory</a>

<%@ include file="footer.jsp" %>