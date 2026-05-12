<%-- 
    Document   : processUser
    Created on : 12 May 2026, 9:39:56 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Process User</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");

    Connection conn = null;
    PreparedStatement ps = null;

    try {

        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSA3023",
                "root",
                "admin"
        );

        String sql = "INSERT INTO userprofile VALUES (?, ?, ?, ?)";

        ps = conn.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, firstname);
        ps.setString(4, lastname);

        int result = ps.executeUpdate();

        if(result > 0){
            out.println("<h3>User registered successfully!</h3>");
            out.println("<a href='login.jsp'>Login Here</a>");
        }
        else{
            out.println("Registration failed.");
        }

    }
    catch(Exception e){
        out.println("Error : " + e.getMessage());
    }
    finally{

        if(ps != null)
            ps.close();

        if(conn != null)
            conn.close();
    }
%>

</body>
</html>