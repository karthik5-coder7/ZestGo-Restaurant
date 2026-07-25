package com.Food.DAO;

import com.Food.Model.Login;

public interface LoginDAO {

    Login validateUser(String email, String password);

}