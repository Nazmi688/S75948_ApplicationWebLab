<%-- 
    Document   : queryStudent
    Created on : 12 May 2026, 10:21:02 pm
    Author     : Nazmi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Records</title>
    
    <style>
        table {
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid #999;
            padding: 0.5rem;
            text-align: left;
        }

        th {
            background: gold;
        }
    </style>
</head>
<body>

<%
    // Use a Java scriptlet to create a simple structure of HTML table.
    out.print("<table>");
    out.print("<thead>");
    out.print("<tr>");
    out.print("<th>" + "ISBNNo" + "</th>");
    out.print("<th>" + "Author" + "</th>");
    out.print("<th>" + "Title" + "</th>");
    out.print("</tr>");
    out.print("</thead>");
    out.print("<tbody>");

    try {
        // Step 1: Load JDBC driver...
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Step 1: MySQL driver loaded...!");

        // Step 2: Establish the connection...
        String myURL = "jdbc:mysql://localhost/CSA3023";
        Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
        System.out.println("Step 2: Database is connected...!");

        // Step 3: Create a statement object...
        Statement myStatement = myConnection.createStatement();

        // Step 4: Perform retrieve record from Student's table... (R-Retrieve)
        String myQuery = "SELECT * FROM student";
        ResultSet myResulSet = myStatement.executeQuery(myQuery);

        // Fetch the record into HTML's table.
        while ( myResulSet.next() )
        {
            out.print("<tr>");
            out.print("<td width=\"20%\">" + myResulSet.getString(1) + "</td>");
            out.print("<td width=\"40%\">" + myResulSet.getString(2) + "</td>");
            out.print("<td width=\"40%\">" + myResulSet.getString(3) + "</td>");
            out.print("</tr>");
        }

        // Step 5: Close database connection...!
        System.out.println("Step 5: Close database connection...!");
        myConnection.close();
        System.out.println(" ");
        System.out.println("Database connection is closed...!");

    } catch (Exception e) {
        e.printStackTrace();
    }

    out.print("</tbody>");
    out.print("</table>");
%>

</body>
</html>