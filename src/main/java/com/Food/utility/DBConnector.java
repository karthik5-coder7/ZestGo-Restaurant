package com.Food.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {

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

            Connection con = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD
            );

            System.out.println("AIVEN DATABASE CONNECTED SUCCESSFULLY");

            return con;

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL Driver Not Found");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("Database Connection Failed");
            e.printStackTrace();
        }

        return null;
    }
}