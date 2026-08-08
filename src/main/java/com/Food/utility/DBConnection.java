package com.Food.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String URL =
		    "jdbc:mysql://host.docker.internal:3306/food_delivery_application?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "karthik@405";

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}