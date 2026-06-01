package com.lab.controller;

import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UpdateServlet extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        User user = userDAO.selectUser(id);

        if (user != null) {

            String currentRole = user.getRoles();

            out.println("<h2>Update User</h2>");

            out.println("<form action='UpdateServlet' method='POST'>");

            out.println("<input type='hidden' name='id' value='"
                    + user.getId() + "'>");

            out.println("Username: <input type='text' name='username' value='"
                    + user.getUsername() + "' required><br><br>");

            out.println("Password: <input type='text' name='password' value='"
                    + user.getPassword() + "' required><br><br>");

            out.println("Role: <select name='roles'>");

            out.println("<option value='Admin' "
                    + (currentRole.equals("Admin") ? "selected" : "")
                    + ">Admin</option>");

            out.println("<option value='Staff' "
                    + (currentRole.equals("Staff") ? "selected" : "")
                    + ">Staff</option>");

            out.println("<option value='Student' "
                    + (currentRole.equals("Student") ? "selected" : "")
                    + ">Student</option>");

            out.println("</select><br><br>");

            out.println("<input type='submit' value='Update User'>");

            out.println("</form>");
        }
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        String roles =
                request.getParameter("roles");

        User user =
                new User(id, username, password, roles);

        userDAO.updateUser(user);

        response.sendRedirect("ViewServlet");
    }
}