<%-- 
    Document   : payroll_view
    Created on : 6 May 2026, 2:07:45 pm
    Author     : Nazmi
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Payroll</title>
</head>
<body>

<h2>Employee Payroll</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Department</th>
        <th>Salary</th>
        <th>Status</th>
    </tr>

    <c:forEach var="emp" items="${employeeList}">
        <tr>
            <td>${emp.empId}</td>
            <td>${emp.name}</td>
            <td>${emp.department}</td>
            <td>${emp.basicSalary}</td>

            <td>
                <c:choose>
                    <c:when test="${emp.basicSalary >= 3000}">
                        Senior
                    </c:when>
                    <c:otherwise>
                        Junior
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>