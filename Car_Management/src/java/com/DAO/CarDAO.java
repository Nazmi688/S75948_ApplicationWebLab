package com.DAO;

import com.Model.Car;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {

    private String jdbcURL ="jdbc:mysql://localhost:3306/carshop";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_CAR_SQL =
            "INSERT INTO CarPricelist(Brand,Model,Cyclinder,Price) VALUES(?,?,?,?)";

    private static final String SELECT_CAR_BY_ID =
            "SELECT * FROM CarPricelist WHERE Car_id=?";

    private static final String SELECT_ALL_CARS =
            "SELECT * FROM CarPricelist";

    private static final String DELETE_CAR_SQL =
            "DELETE FROM CarPricelist WHERE Car_id=?";

    private static final String UPDATE_CAR_SQL =
            "UPDATE CarPricelist SET Brand=?, Model=?, Cyclinder=?, Price=? WHERE Car_id=?";

    protected Connection getConnection() {

        Connection connection = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(
                    jdbcURL,
                    jdbcUsername,
                    jdbcPassword);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }

    public void insertCar(Car car) throws SQLException {

        try (Connection connection = getConnection();
                PreparedStatement statement
                = connection.prepareStatement(INSERT_CAR_SQL)) {

            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getCyclinder());
            statement.setDouble(4, car.getPrice());

            statement.executeUpdate();
        }
    }

    public Car selectCar(int id) {

        Car car = null;

        try (Connection connection = getConnection();
                PreparedStatement statement
                = connection.prepareStatement(SELECT_CAR_BY_ID)) {

            statement.setInt(1, id);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                int cyclinder = rs.getInt("Cyclinder");
                double price = rs.getDouble("Price");

                car = new Car(id, brand,
                        model, cyclinder, price);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return car;
    }

    public List<Car> selectAllCars() {

        List<Car> cars = new ArrayList<>();

        try (Connection connection = getConnection();
                PreparedStatement statement
                = connection.prepareStatement(SELECT_ALL_CARS)) {

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("Car_id");
                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                int cyclinder = rs.getInt("Cyclinder");
                double price = rs.getDouble("Price");

                cars.add(new Car(id, brand,
                        model, cyclinder, price));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cars;
    }

    public boolean updateCar(Car car)
            throws SQLException {

        boolean rowUpdated;

        try (Connection connection = getConnection();
                PreparedStatement statement
                = connection.prepareStatement(UPDATE_CAR_SQL)) {

            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getCyclinder());
            statement.setDouble(4, car.getPrice());
            statement.setInt(5, car.getCarId());

            rowUpdated = statement.executeUpdate() > 0;
        }

        return rowUpdated;
    }

    public boolean deleteCar(int id)
            throws SQLException {

        boolean rowDeleted;

        try (Connection connection = getConnection();
                PreparedStatement statement
                = connection.prepareStatement(DELETE_CAR_SQL)) {

            statement.setInt(1, id);

            rowDeleted = statement.executeUpdate() > 0;
        }

        return rowDeleted;
    }
}