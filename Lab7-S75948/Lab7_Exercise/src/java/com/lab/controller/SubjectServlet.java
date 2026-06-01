package com.lab.controller;

import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class SubjectServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        String matricNo =
                (String) session.getAttribute("matricNo");

        if (matricNo == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        SubjectDAO dao = new SubjectDAO();

        // ADD
        if ("add".equals(action)) {

            SubjectBean sb = new SubjectBean();

            sb.setMatricNo(matricNo);
            sb.setSubjectCode(request.getParameter("subjectCode"));
            sb.setSubjectName(request.getParameter("subjectName"));

            dao.addSubject(sb);

            response.sendRedirect(
                    request.getContextPath()
                    + "/SubjectServlet?action=view");
        }

        // VIEW
        else if ("view".equals(action)) {

            ArrayList<SubjectBean> list =
                    dao.getSubjects(matricNo);

            request.setAttribute("subjectList", list);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "/Subject/viewSubjects.jsp");

            rd.forward(request, response);
        }

        // EDIT
        else if ("edit".equals(action)) {

            int id =
                    Integer.parseInt(
                            request.getParameter("id"));

            SubjectBean sb =
                    dao.getSubjectById(id);

            request.setAttribute("subject", sb);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "/Subject/updateSubject.jsp");

            rd.forward(request, response);
        }

        // UPDATE
        else if ("update".equals(action)) {

            SubjectBean sb =
                    new SubjectBean();

            sb.setId(
                    Integer.parseInt(
                            request.getParameter("id")));

            sb.setSubjectCode(
                    request.getParameter("subjectCode"));

            sb.setSubjectName(
                    request.getParameter("subjectName"));

            dao.updateSubject(sb);

            response.sendRedirect(
                    request.getContextPath()
                    + "/SubjectServlet?action=view");
        }

        // DELETE
        else if ("delete".equals(action)) {

            int id =
                    Integer.parseInt(
                            request.getParameter("id"));

            dao.deleteSubject(id);

            response.sendRedirect(
                    request.getContextPath()
                    + "/SubjectServlet?action=view");
        }

        // DEFAULT
        else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/SubjectServlet?action=view");
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