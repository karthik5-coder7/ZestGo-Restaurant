package com.Food.Model;

import java.sql.Timestamp;

public class Order {

    private int orderId;
    private String customerName;
    private String mobile;
    private String address;
    private String paymentMethod;
    private double totalAmount;
    private int restaurantId;
    private String restaurantName;
    private Timestamp orderDate;

    public Order() {
    }

    public Order(int orderId, String customerName,
            String mobile, String address,
            String paymentMethod,
            double totalAmount,
            int restaurantId,
            String restaurantName,
            Timestamp orderDate) {

        this.orderId = orderId;
        this.customerName = customerName;
        this.mobile = mobile;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.totalAmount = totalAmount;
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.orderDate = orderDate;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
}