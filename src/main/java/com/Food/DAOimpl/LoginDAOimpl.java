package com.Food.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.Food.DAO.LoginDAO;
import com.Food.Model.Login;
import com.Food.utility.DBConnection;

public class LoginDAOimpl implements LoginDAO {

    @Override
    public Login validateUser(String email, String password) {

        Login user = null;

        String query =
                "SELECT * FROM register WHERE email=?";

        Connection connection = null;

        try {

            // Get database connection
            connection = DBConnection.getConnection();

            // IMPORTANT:
            // Check connection BEFORE using it
            if (connection == null) {

                System.out.println(
                        "LOGIN ERROR: Database connection is null"
                );

                return null;
            }

            System.out.println(
                    "LOGIN: Checking email = " + email
            );

            try (PreparedStatement pstmt =
                         connection.prepareStatement(query)) {

                pstmt.setString(1, email);

                try (ResultSet rs =
                             pstmt.executeQuery()) {

                    // User not found
                    if (!rs.next()) {

                        System.out.println(
                                "LOGIN: No user found for email = "
                                + email
                        );

                        return null;
                    }

                    String dbPassword =
                            rs.getString("password");

                    // Password missing in database
                    if (dbPassword == null ||
                            dbPassword.trim().isEmpty()) {

                        System.out.println(
                                "LOGIN ERROR: Password is empty in database"
                        );

                        return null;
                    }

                    boolean passwordMatched = false;

                    // =================================================
                    // BCrypt PASSWORD
                    // =================================================

                    if (dbPassword.startsWith("$2a$")
                            || dbPassword.startsWith("$2b$")
                            || dbPassword.startsWith("$2y$")) {

                        try {

                            passwordMatched =
                                    BCrypt.checkpw(
                                            password,
                                            dbPassword
                                    );

                        } catch (IllegalArgumentException e) {

                            System.out.println(
                                    "LOGIN ERROR: Invalid BCrypt password"
                            );

                            e.printStackTrace();

                            return null;
                        }

                    }

                    // =================================================
                    // OLD PLAIN TEXT PASSWORD
                    // =================================================

                    else {

                        passwordMatched =
                                password.equals(dbPassword);

                        /*
                         * If old plain-text password matches,
                         * upgrade it to BCrypt.
                         */

                        if (passwordMatched) {

                            String newHash =
                                    BCrypt.hashpw(
                                            password,
                                            BCrypt.gensalt(12)
                                    );

                            String updateQuery =
                                    "UPDATE register " +
                                    "SET password=? " +
                                    "WHERE register_id=?";

                            try (PreparedStatement updatePs =
                                         connection.prepareStatement(
                                                 updateQuery)) {

                                updatePs.setString(
                                        1,
                                        newHash
                                );

                                updatePs.setInt(
                                        2,
                                        rs.getInt("register_id")
                                );

                                updatePs.executeUpdate();

                                System.out.println(
                                        "LOGIN: Old password upgraded to BCrypt"
                                );
                            }
                        }
                    }

                    // =================================================
                    // LOGIN SUCCESS
                    // =================================================

                    if (passwordMatched) {

                        System.out.println(
                                "LOGIN: Password matched successfully"
                        );

                        user = new Login();

                        user.setRegister_id(
                                rs.getInt("register_id")
                        );

                        user.setName(
                                rs.getString("name")
                        );

                        user.setEmail(
                                rs.getString("email")
                        );

                        /*
                         * Store database password hash only if
                         * your Login model requires it.
                         */
                        user.setPassword(
                                dbPassword
                        );

                        System.out.println(
                                "LOGIN: User login successful"
                        );

                    } else {

                        System.out.println(
                                "LOGIN: Incorrect password"
                        );
                    }
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "===== LOGIN ERROR ====="
            );

            e.printStackTrace();

        } finally {

            // Close database connection
            if (connection != null) {

                try {

                    connection.close();

                } catch (Exception e) {

                    e.printStackTrace();
                }
            }
        }

        return user;
    }


    // =============================================================
    // CHANGE PASSWORD
    // =============================================================

    public boolean changePassword(
            String email,
            String oldPassword,
            String newPassword) {

        String selectQuery =
                "SELECT password FROM register WHERE email=?";

        String updateQuery =
                "UPDATE register SET password=? WHERE email=?";

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            // Check connection
            if (con == null) {

                System.out.println(
                        "CHANGE PASSWORD ERROR: Database connection is null"
                );

                return false;
            }

            // =====================================================
            // GET CURRENT PASSWORD
            // =====================================================

            try (PreparedStatement selectPs =
                         con.prepareStatement(selectQuery)) {

                selectPs.setString(1, email);

                String dbPassword;

                try (ResultSet rs =
                             selectPs.executeQuery()) {

                    if (!rs.next()) {

                        return false;
                    }

                    dbPassword =
                            rs.getString("password");
                }

                if (dbPassword == null ||
                        dbPassword.trim().isEmpty()) {

                    return false;
                }

                boolean oldPasswordCorrect;

                // =================================================
                // BCrypt PASSWORD
                // =================================================

                if (dbPassword.startsWith("$2a$")
                        || dbPassword.startsWith("$2b$")
                        || dbPassword.startsWith("$2y$")) {

                    oldPasswordCorrect =
                            BCrypt.checkpw(
                                    oldPassword,
                                    dbPassword
                            );

                }

                // =================================================
                // OLD PLAIN TEXT PASSWORD
                // =================================================

                else {

                    oldPasswordCorrect =
                            oldPassword.equals(dbPassword);
                }

                // Old password incorrect
                if (!oldPasswordCorrect) {

                    return false;
                }

                // =================================================
                // HASH NEW PASSWORD
                // =================================================

                String hashedNewPassword =
                        BCrypt.hashpw(
                                newPassword,
                                BCrypt.gensalt(12)
                        );

                // =================================================
                // UPDATE PASSWORD
                // =================================================

                try (PreparedStatement updatePs =
                             con.prepareStatement(updateQuery)) {

                    updatePs.setString(
                            1,
                            hashedNewPassword
                    );

                    updatePs.setString(
                            2,
                            email
                    );

                    return updatePs.executeUpdate() > 0;
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "===== CHANGE PASSWORD ERROR ====="
            );

            e.printStackTrace();

            return false;

        } finally {

            if (con != null) {

                try {

                    con.close();

                } catch (Exception e) {

                    e.printStackTrace();
                }
            }
        }
    }
}