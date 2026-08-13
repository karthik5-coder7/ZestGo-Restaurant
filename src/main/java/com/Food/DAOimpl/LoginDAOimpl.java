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

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement pstmt =
                     connection.prepareStatement(query)) {

            if (connection == null) {
                System.out.println("LOGIN ERROR: Database connection is null");
                return null;
            }

            System.out.println("LOGIN: Checking email = " + email);

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (!rs.next()) {

                    System.out.println(
                            "LOGIN: No user found for email = " + email
                    );

                    return null;
                }

                String dbPassword =
                        rs.getString("password");

                if (dbPassword == null ||
                        dbPassword.trim().isEmpty()) {

                    System.out.println(
                            "LOGIN ERROR: Password is empty in database"
                    );

                    return null;
                }

                boolean passwordMatched = false;

                /*
                 * New users:
                 * Password is stored using BCrypt.
                 */
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

                } else {

                    /*
                     * Compatibility for old users whose passwords
                     * were stored before BCrypt was added.
                     */
                    passwordMatched =
                            password.equals(dbPassword);

                    if (passwordMatched) {

                        /*
                         * Automatically convert old plain-text
                         * password to BCrypt.
                         */
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
                     * Don't expose the actual password.
                     * Store the database hash only if your
                     * Login model requires it.
                     */
                    user.setPassword(dbPassword);

                    System.out.println(
                            "LOGIN: User login successful"
                    );

                } else {

                    System.out.println(
                            "LOGIN: Incorrect password"
                    );
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "===== LOGIN ERROR ====="
            );

            e.printStackTrace();
        }

        return user;
    }


    public boolean changePassword(
            String email,
            String oldPassword,
            String newPassword) {

        String selectQuery =
                "SELECT password FROM register WHERE email=?";

        String updateQuery =
                "UPDATE register SET password=? WHERE email=?";

        try (Connection con =
                     DBConnection.getConnection();
             PreparedStatement selectPs =
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

            if (dbPassword == null) {
                return false;
            }

            boolean oldPasswordCorrect;

            if (dbPassword.startsWith("$2a$")
                    || dbPassword.startsWith("$2b$")
                    || dbPassword.startsWith("$2y$")) {

                oldPasswordCorrect =
                        BCrypt.checkpw(
                                oldPassword,
                                dbPassword
                        );

            } else {

                oldPasswordCorrect =
                        oldPassword.equals(dbPassword);
            }

            if (!oldPasswordCorrect) {
                return false;
            }

            String hashedNewPassword =
                    BCrypt.hashpw(
                            newPassword,
                            BCrypt.gensalt(12)
                    );

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

        } catch (Exception e) {

            System.out.println(
                    "===== CHANGE PASSWORD ERROR ====="
            );

            e.printStackTrace();

            return false;
        }
    }
}