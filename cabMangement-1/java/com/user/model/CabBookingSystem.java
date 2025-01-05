package com.user.model;

import com.user.dao.CabBookingDAO;
import java.util.List;
import java.util.Scanner;

public class CabBookingSystem {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        CabBookingDAO cabBookingDAO = new CabBookingDAO();

        while (true) {
            System.out.println("Welcome to the Cab Booking System");
            System.out.println("1. View Available Cabs");
            System.out.println("2. Book a Cab");
            System.out.println("3. Exit");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // consume newline

            if (choice == 1) {
                viewAvailableCabs(cabBookingDAO);
            } else if (choice == 2) {
                bookCab(cabBookingDAO, scanner);
            } else if (choice == 3) {
                System.out.println("Thank you for using the Cab Booking System.");
                break;
            } else {
                System.out.println("Invalid choice. Please try again.");
            }
        }
        scanner.close();
    }

    static void viewAvailableCabs(CabBookingDAO cabBookingDAO) {
        List<Cab> availableCabs = cabBookingDAO.getAvailableCabs();
        if (availableCabs.isEmpty()) {
            System.out.println("No available cabs at the moment.");
        } else {
            System.out.println("Available Cabs:");
            for (Cab cab : availableCabs) {
                System.out.println("Cab ID: " + cab.cabId + ", Driver: " + cab.driverName);
            }
        }
    }

    static void bookCab(CabBookingDAO cabBookingDAO, Scanner scanner) {
        System.out.print("Enter your name: ");
        String userName = scanner.nextLine();
        System.out.print("Enter your destination: ");
        String destination = scanner.nextLine();

        // Find an available cab to book
        List<Cab> availableCabs = cabBookingDAO.getAvailableCabs();
        if (!availableCabs.isEmpty()) {
            Cab cab = availableCabs.get(0); // Book the first available cab
            cabBookingDAO.bookCab(cab.cabId);
            cabBookingDAO.addBooking(userName, destination, cab.cabId);
            System.out.println("Cab booked successfully! Cab ID: " + cab.cabId + ", Driver: " + cab.driverName);
        } else {
            System.out.println("No cabs available at the moment.");
        }
    }
}

