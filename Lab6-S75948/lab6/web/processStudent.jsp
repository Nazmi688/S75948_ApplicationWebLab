<%-- 
    Document   : processStudent
    Created on : 12 May 2026, 9:49:20 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page errorPage="errorStudent.jsp" %>

<!-- Create an object for Student -->
<jsp:useBean id="myStudent" class="Lab6.com.Student" scope="request"/>

<!-- Assign data entry from page insertStudent.jsp page into Student's bean -->
<jsp:setProperty name="myStudent" property="*"/>

<%
    int result;

    try {
        //Step 1: Load JDBC driver...
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Step 1: MySQL driver loaded...!");

        //Step 2: Establish the connection...
        String myURL = "jdbc:mysql://localhost:3306/CSA3023";
        Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
        System.out.println("Step 2: Database is connected...!");

        //Step 3: Create a PreparedStatement object...
        System.out.println("Step 3: Prepared Statements created...!");

        //Prepared SQL Query as a String...
        String sInsertQry = "INSERT INTO Student(stuno, stuname, stuprogram) VALUES(?, ?, ?)";
        System.out.println("\tSQL Query: " + sInsertQry);

        //Call method preparedStatement
        PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

        //Assign each value to respective columns for Student's table...
        System.out.println("Step 4: Perform insertion of record...!");
        myPS.setString(1, myStudent.getStuno());
        myPS.setString(2, myStudent.getName());
        myPS.setString(3, myStudent.getProgram());

        //Execute query
        result = myPS.executeUpdate();

        if ( result > 0 )
        {
            System.out.println("\tRecord successfully added into Student's table...!");
            out.print("<p>" + "Record with student no " + myStudent.getStuno() + 
                      " successfully created..!" + "</p>");
            out.print("<p>" + "Details of record are; " + "</p>");
            out.print("<p>Student ID : " + myStudent.getStuno() + "</p>");
            out.print("<p>Name : " + myStudent.getName() + "</p>");
            out.print("<p>Program : " + myStudent.getProgram() + "</p>");
        }

        //Close database connection
        System.out.println("Step 5: Close database connection...!");
        myConnection.close();
        System.out.println(" ");
        System.out.println("Database connection is closed...!");

    } catch (Exception e) {
        out.println(e);
    }
%>