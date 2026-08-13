package com.Food.utility;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnect {

    public static Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }
}
