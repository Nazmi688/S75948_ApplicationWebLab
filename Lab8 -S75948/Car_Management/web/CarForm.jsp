<%-- 
    Document   : CarForm
    Created on : 2 Jun 2026, 4:07:34 pm
    Author     : Nazmi
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Car Form</title>
    </head>

    <body>

    <c:if test="${car != null}">
        <form action="update" method="post">
            <input type="hidden"
                   name="id"
                   value="${car.carId}">
            </c:if>

            <c:if test="${car == null}">
                <form action="insert" method="post">
            </c:if>

            Brand:
            <input type="text"
                   name="brand"
                   value="${car.brand}">
            <br><br>

            Model:
            <input type="text"
                   name="model"
                   value="${car.model}">
            <br><br>

            Cyclinder:
            <input type="number"
                   name="cyclinder"
                   value="${car.cyclinder}">
            <br><br>

            Price:
            <input type="number"
                   step="0.01"
                   name="price"
                   value="${car.price}">
            <br><br>

            <button type="submit">
                Save
            </button>

        </form>

    </body>
</html>