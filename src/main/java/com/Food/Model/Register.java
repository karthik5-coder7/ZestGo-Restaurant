package com.Food.Model;

public class Register {

    private String name;
    private String email;
    private String address;
    private String password;
    private String role;

    // Default Constructor
    public Register() {
    }

    // Parameterized Constructor
    public Register(String name, String email, String address, String password, String role) {
        this.name = name;
        this.email = email;
        this.address = address;
        this.password = password;
        this.role = role;
    }

    // Getters and Setters

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Register [name=" + name +
               ", email=" + email +
               ", address=" + address +
               ", password=" + password +
               ", role=" + role + "]";
    }
}