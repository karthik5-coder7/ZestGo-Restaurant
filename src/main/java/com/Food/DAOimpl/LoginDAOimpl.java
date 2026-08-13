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

        String query = "SELECT * FROM register WHERE email=?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {

                    String dbPassword = rs.getString("password");

                    if (dbPassword != null
                            && BCrypt.checkpw(password, dbPassword)) {

                        user = new Login();

                        user.setRegister_id(rs.getInt("register_id"));
                        user.setName(rs.getString("name"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(dbPassword);
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("===== LOGIN ERROR =====");
            e.printStackTrace();
        }

        return user;
    }

    /*
     * This method is intentionally not annotated with @Override because
     * LoginDAO currently declares only validateUser().
     */
    public boolean changePassword(
            String email,
            String oldPassword,
            String newPassword) {

        String selectQuery =
                "SELECT password FROM register WHERE email=?";

        String updateQuery =
                "UPDATE register SET password=? WHERE email=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement selectPs = con.prepareStatement(selectQuery)) {

            selectPs.setString(1, email);

            String dbPassword;

            try (ResultSet rs = selectPs.executeQuery()) {
                if (!rs.next()) {
                    return false;
                }
                dbPassword = rs.getString("password");
            }

            if (dbPassword == null
                    || !BCrypt.checkpw(oldPassword, dbPassword)) {
                return false;
            }

            String hashedNewPassword =
                    BCrypt.hashpw(newPassword, BCrypt.gensalt(12));

            try (PreparedStatement updatePs =
                         con.prepareStatement(updateQuery)) {

                updatePs.setString(1, hashedNewPassword);
                updatePs.setString(2, email);

                return updatePs.executeUpdate() > 0;
            }

        } catch (Exception e) {
            System.out.println("===== CHANGE PASSWORD ERROR =====");
            e.printStackTrace();
            return false;
        }
    }
}
