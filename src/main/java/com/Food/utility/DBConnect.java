package com.Food.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection connection;

    public static Connection getConnection() {

        try {

            if (connection == null || connection.isClosed()) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/foodapp";
                String username = "root";
                String password = "karthik@405";

                connection = DriverManager.getConnection(
                        url,
                        username,
                        password
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}