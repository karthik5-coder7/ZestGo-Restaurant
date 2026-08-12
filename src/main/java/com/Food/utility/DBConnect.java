package com.Food.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection connection;

    private static final String URL =
            "jdbc:mysql://mysql-51d7552-karthikmodemkondagalla-8c84k.aivencloud.com:26509/defaultdb"
            + "?sslMode=REQUIRED&serverTimezone=UTC";

    private static final String USERNAME =
            System.getenv().getOrDefault("DB_USERNAME", "avnadmin");

    private static final String PASSWORD =
            System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        try {

            if (connection == null || connection.isClosed()) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                connection = DriverManager.getConnection(
                        URL,
                        USERNAME,
                        PASSWORD
                );

                System.out.println("AIVEN DATABASE CONNECTED SUCCESSFULLY");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}
