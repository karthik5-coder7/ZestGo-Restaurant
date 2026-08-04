package com.Food.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String URL =
		    "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12834510?useSSL=false&serverTimezone=UTC";

		private static final String USERNAME = "sql12834510";
		private static final String PASSWORD = "JGPRyZQthn";
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