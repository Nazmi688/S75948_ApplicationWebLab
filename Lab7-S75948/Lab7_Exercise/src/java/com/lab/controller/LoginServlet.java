package com.lab.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String matricNo =
                request.getParameter("matricNo");

        String password =
                request.getParameter("password");

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/lab_7exercise",
                            "root",
                            "admin"
                    );

            String sql =
                    "SELECT * FROM students "
                    + "WHERE matric_no=? AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, matricNo);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "matricNo",
                        matricNo
                );

                response.sendRedirect(
                        "dashboard.jsp"
                );

            } else {

                response.getWriter().println(
                        "Login Failed"
                );
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }
}