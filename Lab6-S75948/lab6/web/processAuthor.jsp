<%-- 
    Document   : processAuthor
    Created on : 12 May 2026, 3:32:00 pm
    Author     : Nazmi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<jsp:useBean id="myAuthor" class="Lab6.com.Author" scope="request"/>
<jsp:setProperty name="myAuthor" property="*"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Author</title>
</head>

<body>

<h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>

<%
    int result = 0;

    try {

        Class.forName("com.mysql.jdbc.Driver");

        String myURL = "jdbc:mysql://localhost:3306/CSA3023";

        Connection myConnection =
                DriverManager.getConnection(myURL, "root", "admin");

        String sInsertQry =
            "INSERT INTO Author(authno, name, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement myPS =
                myConnection.prepareStatement(sInsertQry);

        myPS.setString(1, myAuthor.getAuthno());
        myPS.setString(2, myAuthor.getName());
        myPS.setString(3, myAuthor.getAddress());
        myPS.setString(4, myAuthor.getCity());
        myPS.setString(5, myAuthor.getState());
        myPS.setString(6, myAuthor.getZip());

        result = myPS.executeUpdate();

        if(result > 0)
        {
%>

            <h3>Record successfully added into Author table!</h3>

            <p>
                Record with author no
                <b><%= myAuthor.getAuthno() %></b>
                successfully created!
            </p>

            <p>Name : <%= myAuthor.getName() %></p>
            <p>Address : <%= myAuthor.getAddress() %></p>
            <p>City : <%= myAuthor.getCity() %></p>
            <p>State : <%= myAuthor.getState() %></p>
            <p>Zip : <%= myAuthor.getZip() %></p>

<%
        }

        myPS.close();
        myConnection.close();

    }
    catch(Exception e)
    {
        out.println("Error : " + e.getMessage());
    }
%>

</body>
</html>