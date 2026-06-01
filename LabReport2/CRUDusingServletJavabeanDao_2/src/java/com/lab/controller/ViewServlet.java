package com.lab.controller;

import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ViewServlet extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        List<User> listUser = userDAO.selectAllUsers();

        out.println("<h2>User List (Using DAO)</h2>");

        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Username</th>");
        out.println("<th>Password</th>");
        out.println("<th>Role</th>");
        out.println("<th>Action</th>");
        out.println("</tr>");

        for (User user : listUser) {

            out.println("<tr>");
            out.println("<td>" + user.getId() + "</td>");
            out.println("<td>" + user.getUsername() + "</td>");
            out.println("<td>" + user.getPassword() + "</td>");
            out.println("<td>" + user.getRoles() + "</td>");

            out.println("<td>");
            out.println("<a href='UpdateServlet?id="
                    + user.getId()
                    + "'>Edit</a> | ");

            out.println("<a href='DeleteServlet?id="
                    + user.getId()
                    + "'>Delete</a>");
            out.println("</td>");

            out.println("</tr>");
        }

        out.println("</table>");

        out.println("<br>");
        out.println("<a href='index.html'>Add New User</a>");
    }
}