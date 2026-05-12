<%-- 
    Document   : doLogin
    Created on : 12 May 2026, 9:41:08 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try{

        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSA3023",
                "root",
                "admin"
        );

        String sql = "SELECT * FROM userprofile "
                   + "WHERE username=? AND password=?";

        ps = conn.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        rs = ps.executeQuery();

        if(rs.next()){

            session.setAttribute("username",
                    rs.getString("username"));

            session.setAttribute("firstname",
                    rs.getString("firstname"));

            session.setAttribute("lastname",
                    rs.getString("lastname"));

            response.sendRedirect("main.jsp");
        }
        else{

            response.sendRedirect("error.jsp");
        }

    }
    catch(Exception e){

        out.println("Error : " + e.getMessage());
    }
%>