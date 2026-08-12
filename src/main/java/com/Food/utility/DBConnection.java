package com.Food.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static final String URL =
	        "jdbc:mysql://mysql-51d7552-karthikmodemkondagalla-8c84.k.aivencloud.com:26509/food_delivery_application"
	        + "?sslMode=REQUIRED&serverTimezone=UTC";

    private static final String USERNAME =
            System.getenv().getOrDefault("DB_USERNAME", "avnadmin");

    private static final String PASSWORD =
            System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("===== DB CONNECTION TEST =====");
            System.out.println("DB USERNAME = " + USERNAME);
            System.out.println("DB PASSWORD SET = "
                    + (PASSWORD != null && !PASSWORD.isEmpty()));

            Connection con = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD
            );

            System.out.println("=================================");
            System.out.println("AIVEN DATABASE CONNECTED SUCCESSFULLY");
            System.out.println("=================================");

            return con;

        } catch (ClassNotFoundException e) {

            System.out.println("MYSQL JDBC DRIVER NOT FOUND");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("===== AIVEN DATABASE ERROR =====");
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Message: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }
}