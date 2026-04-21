<%-- 
    Document   : bmiCalculator
    Created on : 21 Apr 2026, 4:04:18 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h2>BMI Calculator</h2>
<form action="processBmi.jsp" method="post">
    Weight (kg): <input type="number" step="0.1" name="weight" required><br><br>
    Height (m): <input type="number" step="0.01" name="height" required><br><br>
    <input type="submit" value="Calculate BMI">
</form>
<%@ include file="footer.jsp" %>
