<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<h2>Your BMI Result</h2>

<%
    String bmiStr = request.getParameter("bmiValue");
    String category = request.getParameter("category");

    double bmi = 0;

    if (bmiStr != null) {
        bmi = Double.parseDouble(bmiStr);
    }
%>

<p>Your BMI: <b><%= String.format("%.2f", bmi) %></b></p>
<p>Category: <b><%= category %></b></p>

<a href="bmiCalculator.jsp">Calculate Again</a>

<%@ include file="footer.jsp" %>