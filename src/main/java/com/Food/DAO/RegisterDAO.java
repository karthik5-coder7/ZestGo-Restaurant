package com.Food.DAO;

import java.util.List;

import com.Food.Model.Register;

public interface RegisterDAO {

    int addUser(Register register);
    Register getUser(int RegisterId);
    void updateUser(Register register);
    void deleteUser (int RegisterId);
    List<Register> getAllUser();
    

}