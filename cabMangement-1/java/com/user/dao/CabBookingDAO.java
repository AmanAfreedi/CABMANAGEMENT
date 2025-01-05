package com.user.dao;

import com.user.model.Cab;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CabBookingDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String USER = "your_username";
    private static final String PASSWORD = "your_password";

    // Method to get database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Add a new cab to the database
    public boolean addCab(Cab cab) {
        String query = "INSERT INTO cabs (cab_number, driver_name, is_available) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, cab.cabId);
            statement.setString(2, cab.driverName);
            statement.setBoolean(3, cab.isAvailable);

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all available cabs from the database
    public List<Cab> getAvailableCabs() {
        List<Cab> availableCabs = new ArrayList<>();
        String query = "SELECT * FROM cabs WHERE is_available = TRUE";

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                String cabId = resultSet.getString("cab_number");
                String driverName = resultSet.getString("driver_name");
                boolean isAvailable = resultSet.getBoolean("is_available");

                Cab cab = new Cab(cabId, driverName);
                cab.isAvailable = isAvailable;
                availableCabs.add(cab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return availableCabs;
    }

    // Book a cab by marking it as unavailable
    public boolean bookCab(String cabId) {
        String query = "UPDATE cabs SET is_available = FALSE WHERE cab_number = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, cabId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Add a booking to the database
    public boolean addBooking(String userName, String destination, String cabId) {
        String query = "INSERT INTO bookings (user_name, destination, cab_id) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, userName);
            statement.setString(2, destination);
            statement.setString(3, cabId);

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

