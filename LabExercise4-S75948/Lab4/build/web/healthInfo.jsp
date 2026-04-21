<%-- 
    Document   : healthInfo.jsp
    Created on : 21 Apr 2026, 4:11:04 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>

<h2>BMI Categories Reference</h2>
<table border="1">
    <tr>
        <th>Category</th>
        <th>BMI Range</th>
    </tr>
    <%
        ArrayList<String[]> categories = new ArrayList<>();
        categories.add(new String[]{"Underweight", "Below 18.5"});
        categories.add(new String[]{"Normal", "18.5 - 25.0"});
        categories.add(new String[]{"Overweight", "Above 25.0"});

        for (String[] row : categories) {
    %>
    <tr>
        <td><%= row[0]%></td>
        <td><%= row[1]%></td>
    </tr>
    <% }%>
</table>

<%@ include file="footer.jsp" %>