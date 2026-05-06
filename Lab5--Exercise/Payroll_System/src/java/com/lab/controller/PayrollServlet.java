/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.Employee;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet
/**
 *
 * @author Nazmi
 */
;

@WebServlet("/PayrollServlet")
public class PayrollServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Employee> list = new ArrayList<>();

        Employee e1 = new Employee();
        e1.setEmpId("E001");
        e1.setName("Ali");
        e1.setDepartment("IT");
        e1.setBasicSalary(3500);

        Employee e2 = new Employee();
        e2.setEmpId("E002");
        e2.setName("Siti");
        e2.setDepartment("HR");
        e2.setBasicSalary(2800);

        Employee e3 = new Employee();
        e3.setEmpId("E003");
        e3.setName("Ahmad");
        e3.setDepartment("Finance");
        e3.setBasicSalary(4000);

        Employee e4 = new Employee();
        e4.setEmpId("E004");
        e4.setName("Nur");
        e4.setDepartment("Marketing");
        e4.setBasicSalary(2500);

        Employee e5 = new Employee();
        e5.setEmpId("E005");
        e5.setName("John");
        e5.setDepartment("Sales");
        e5.setBasicSalary(3200);

        list.add(e1);
        list.add(e2);
        list.add(e3);
        list.add(e4);
        list.add(e5);

        request.setAttribute("employeeList", list);

        RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
        rd.forward(request, response);
    }
}