package com.Food.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class DBConnector {

    private static final String URL =
            "jdbc:mysql://localhost:3306/food_delivery_application";

    private static final String USERNAME = "root";
    private static final String PASSWORD = "karthik@405";
    
    private static final Scanner scan = new Scanner(System.in);
    
    private static final String INSERT_QUERY =
            "INSERT INTO register(name,email,address,password,role) VALUES(?,?,?,?,?)";
    

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD);

            System.out.println("Database Connected Successfully");

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL Driver Not Found");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("Database Connection Failed");
            e.printStackTrace();
        }

        return con;
    }
}