package com.Food.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.Food.DAO.LoginDAO;
import com.Food.Model.Login;
import com.Food.utility.DBConnection;

public class LoginDAOimpl implements LoginDAO {

    private Connection connection;

    public LoginDAOimpl() {
        connection = DBConnection.getConnection();
    }

    @Override
    public Login validateUser(String email, String password) {

        Login user = null;

        String query = "SELECT * FROM register WHERE email=?";

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(query);

            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                String dbPassword =
                        rs.getString("password");

                if (BCrypt.checkpw(password, dbPassword)) {

                    user = new Login();

                    user.setRegister_id(rs.getInt("register_id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(dbPassword);

                    // Comment these lines if columns don't exist
                    // user.setPhone(rs.getString("phone"));
                    // user.setAddress(rs.getString("address"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    
    
    public boolean changePassword(
            String email,
            String oldPassword,
            String newPassword)
    {
        String query =
                "UPDATE login " +
                "SET password=? " +
                "WHERE email=? " +
                "AND password=?";

        try
        {
            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.setString(3, oldPassword);

            int rows =
                    ps.executeUpdate();

            return rows > 0;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return false;
    }
    
}