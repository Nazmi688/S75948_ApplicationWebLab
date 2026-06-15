package com.WEB;

import com.DAO.CarDAO;
import com.Model.Car;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class CarServlet extends HttpServlet {

    private CarDAO carDAO;

    public void init() {
        carDAO = new CarDAO();
    }

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try {

            switch (action) {

                case "/new":
                    showNewForm(request, response);
                    break;

                case "/insert":
                    insertCar(request, response);
                    break;

                case "/delete":
                    deleteCar(request, response);
                    break;

                case "/edit":
                    showEditForm(request, response);
                    break;

                case "/update":
                    updateCar(request, response);
                    break;

                default:
                    listCar(request, response);
                    break;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCar(
            HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        List<Car> listCar =
                carDAO.selectAllCars();

        request.setAttribute(
                "listCar",
                listCar);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("CarList.jsp");

        dispatcher.forward(request, response);
    }

    private void showNewForm(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("CarForm.jsp");

        dispatcher.forward(request, response);
    }

    private void showEditForm(
            HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException,
            ServletException,
            IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        Car existingCar =
                carDAO.selectCar(id);

        request.setAttribute(
                "car",
                existingCar);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("CarForm.jsp");

        dispatcher.forward(request, response);
    }

    private void insertCar(
            HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException {

        String brand =
                request.getParameter("brand");

        String model =
                request.getParameter("model");

        int cyclinder =
                Integer.parseInt(
                        request.getParameter("cyclinder"));

        double price =
                Double.parseDouble(
                        request.getParameter("price"));

        Car newCar =
                new Car(
                        brand,
                        model,
                        cyclinder,
                        price);

        carDAO.insertCar(newCar);

        response.sendRedirect("list");
    }

    private void updateCar(
            HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        String brand =
                request.getParameter("brand");

        String model =
                request.getParameter("model");

        int cyclinder =
                Integer.parseInt(
                        request.getParameter("cyclinder"));

        double price =
                Double.parseDouble(
                        request.getParameter("price"));

        Car car =
                new Car(id,
                        brand,
                        model,
                        cyclinder,
                        price);

        carDAO.updateCar(car);

        response.sendRedirect("list");
    }

    private void deleteCar(
            HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        carDAO.deleteCar(id);

        response.sendRedirect("list");
    }
}