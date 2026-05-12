<%-- 
    Document   : insertAuthor
    Created on : 12 May 2026, 3:20:49 pm
    Author     : Nazmi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Author Registration</title>
</head>
<body>

    <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>

    <h2>Author Registration</h2>

    <fieldset>
        <form action="processAuthor.jsp" method="post">

            Author No (E.g.: UKXXXXX):
            <input type="text" name="authno"><br><br>

            Name:
            <input type="text" name="name"><br><br>

            Address:
            <input type="text" name="address"><br><br>

            City:
            <input type="text" name="city"><br><br>

            State:
            <input type="text" name="state"><br><br>

            Zip:
            <input type="text" name="zip"><br><br>

            <input type="submit" value="Submit">
            <input type="reset" value="Cancel">

        </form>
    </fieldset>

</body>
</html>