package com.lab.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;

@WebServlet("/ViewProductServlet")
public class ViewProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> list = productDAO.selectAllProducts();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<body>");

        out.println("<h2>Product List</h2>");
        out.println("<a href='index.html'>Add Product</a><br><br>");

        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Category</th>");
        out.println("<th>Price</th>");
        out.println("<th>Quantity</th>");
        out.println("<th>Action</th>");
        out.println("</tr>");

        for (Product p : list) {

            out.println("<tr>");

            out.println("<td>" + p.getId() + "</td>");
            out.println("<td>" + p.getName() + "</td>");
            out.println("<td>" + p.getCategory() + "</td>");
            out.println("<td>" + p.getPrice() + "</td>");
            out.println("<td>" + p.getQuantity() + "</td>");

            out.println("<td>");
            out.println("<a href='DeleteProductServlet?id="
                    + p.getId()
                    + "'>Delete</a> | ");

            out.println("<a href='UpdateProductServlet?id="
                    + p.getId()
                    + "'>Edit</a>");
            out.println("</td>");

            out.println("</tr>");
        }

        out.println("</table>");
        out.println("</body>");
        out.println("</html>");
    }
}