package com.Food.Model;

public class Login {

    private int register_id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String address;

    public Login() {
    }

    public Login(int register_id, String name, String email,
                String password, String phone, String address) {
        this.register_id = register_id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }

    public int getRegister_id() {
        return register_id;
    }

    public void setRegister_id(int userId) {
        this.register_id = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}