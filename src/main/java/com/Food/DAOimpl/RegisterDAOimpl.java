package com.Food.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.Food.Model.Register;
import com.Food.utility.DBConnector;

public class RegisterDAOimpl {

    private static final String CHECK_EMAIL =
            "SELECT email FROM register WHERE email=?";

    private static final String INSERT_QUERY =
            "INSERT INTO register(name,email,address,password,role) "
            + "VALUES(?,?,?,?,?)";

    public int addUser(Register register) {

        System.out.println("=================================");
        System.out.println("REGISTER DAO STARTED");
        System.out.println("=================================");

        try (Connection con = DBConnector.getConnection()) {

            System.out.println("DB CONNECTION = " + con);

            // -------------------------------------------------
            // CHECK WHETHER EMAIL ALREADY EXISTS
            // -------------------------------------------------

            try (PreparedStatement checkPs =
                    con.prepareStatement(CHECK_EMAIL)) {

                checkPs.setString(1, register.getEmail());

                try (ResultSet rs = checkPs.executeQuery()) {

                    if (rs.next()) {

                        System.out.println(
                                "REGISTER FAILED: EMAIL ALREADY EXISTS"
                        );

                        return -1;
                    }
                }
            }

            // -------------------------------------------------
            // HASH PASSWORD ONCE
            // -------------------------------------------------

            String hashedPassword =
                    BCrypt.hashpw(
                            register.getPassword(),
                            BCrypt.gensalt(12)
                    );

            System.out.println(
                    "PASSWORD HASH CREATED = "
                    + (hashedPassword != null)
            );

            // -------------------------------------------------
            // INSERT USER
            // -------------------------------------------------

            try (PreparedStatement ps =
                    con.prepareStatement(INSERT_QUERY)) {

                ps.setString(
                        1,
                        register.getName()
                );

                ps.setString(
                        2,
                        register.getEmail()
                );

                ps.setString(
                        3,
                        register.getAddress()
                );

                ps.setString(
                        4,
                        hashedPassword
                );

                ps.setString(
                        5,
                        register.getRole()
                );

                int rows =
                        ps.executeUpdate();

                System.out.println(
                        "ROWS INSERTED = " + rows
                );

                if (rows == 1) {

                    System.out.println(
                            "REGISTER SUCCESS"
                    );

                    return 1;
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "================================="
            );

            System.out.println(
                    "REGISTER DATABASE ERROR"
            );

            System.out.println(
                    "================================="
            );

            e.printStackTrace();

            return 0;
        }

        return 0;
    }
}