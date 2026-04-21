<%-- 
    Document   : processBmi
    Created on : 21 Apr 2026, 4:06:28 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String weightStr = request.getParameter("weight");
    String heightStr = request.getParameter("height");

    double bmi = 0;
    String category = "";

    try {
        if (weightStr == null || heightStr == null ||
            weightStr.isEmpty() || heightStr.isEmpty()) {

            response.sendRedirect("bmiCalculator.jsp");
            return;
        }

        double weight = Double.parseDouble(weightStr);
        double height = Double.parseDouble(heightStr);

        if (height <= 0) {
            response.sendRedirect("bmiCalculator.jsp");
            return;
        }

        // BMI calculation
        bmi = weight / (height * height);

        if (bmi < 18.5) category = "Underweight";
        else if (bmi <= 25) category = "Normal";
        else category = "Overweight";

    } catch (Exception e) {
        response.sendRedirect("bmiCalculator.jsp");
        return;
    }
%>

<jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmiValue" value="<%= String.valueOf(bmi) %>" />
    <jsp:param name="category" value="<%= category %>" />
</jsp:forward>