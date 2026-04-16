<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%@ include file="header.jsp" %>

<h2>Fee Calculator</h2>

<form method="post">
    Number of Activities:
    <input type="text" name="activities">
    <input type="submit" value="Calculate">
</form>

<%
String act = request.getParameter("activities");

if (act != null) {
    int activities = Integer.parseInt(act);
    double total = activities * 10.0;
%>

<h3>Total Fee: RM <%= String.format("%.2f", total) %></h3>

<%
}
%>

<%@ include file="footer.jsp" %>

</body>
</html>