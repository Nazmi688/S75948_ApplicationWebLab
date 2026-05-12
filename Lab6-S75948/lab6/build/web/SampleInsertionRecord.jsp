<%-- 
    Document   : SampleInsertionRecord
    Created on : 12 May 2026, 2:05:42 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6- Task 1-Sample insertion from Sql to JSP!</h1>
        
        <%
            int result;
            Class.forName("com.mysql.jdbc.Driver");
            out.println("Step 1: MySQL driver loaded...");
            %>
            
            <% String myURL="jdbc:mysql://localhost/CSA3023";
            Connection myConnection = DriverManager.getConnection(myURL,"root","admin");
            out.println("Step 2: Database is connected...");
            %>
            <br>
            
            <%
                out.println("Step 3: prepared Statement created...1");
                String sInsertQry ="INSERT INTO FirstTable VALUES(?)";
                PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
                %>
                
                <br>
                <%
               out.println("Step 4: Perform insertion of record...!");
                String name ="Welcome to access MYSQL database with JSP.";
                myPS.setString(1,name);
               result = myPS.executeUpdate();
               if(result > 0){
            %>
            <br><!-- comment -->
            <%
        out.println("Step 5: Close database connection...!");

        out.println(" ");
        out.println("Database connection is closed...!");

        out.print("<p>" + "The record : (" + name 
                + ") is successfully created..!" + "</p>");
    }
    //Step 5: Close database connnection...!
    myConnection.close();
%>
                
    </body>
</html>
