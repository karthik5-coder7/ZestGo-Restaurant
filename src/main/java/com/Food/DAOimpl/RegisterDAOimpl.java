package com.Food.DAOimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;

import com.Food.Model.Register;
import com.Food.utility.DBConnector;

public class RegisterDAOimpl {

    private static final String INSERT_QUERY =
            "INSERT INTO register(name,email,address,password,role) VALUES(?,?,?,?,?)";

    public int addUser(Register register) {

        try {
        	
        	  System.out.println("DAO Called");

            Connection con = DBConnector.getConnection();
            
            System.out.println("Connection = " + con);

            PreparedStatement pstmt =
                    con.prepareStatement(INSERT_QUERY);

            pstmt.setString(1, register.getName());
            pstmt.setString(2, register.getEmail());
            pstmt.setString(3, register.getAddress());
            pstmt.setString(4, register.getPassword());
            pstmt.setString(5, register.getRole());

            int result = pstmt.executeUpdate();

            System.out.println("Rows inserted = " + result);

            return result;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
}