package com.Food.Model;

public class User {

    private int restaurantID;
    private String name;
    private String cuisineType;
    private String deliveryTime;
    private String address;
    private int adminUserID;
    private float rating; 
    private String isActive;
    private String imagePath;
	private int price;

    public User() {
    }

    public User(int restaurantID, String name, String cuisineType,
                      String deliveryTime, String address,
                      int adminUserID, float rating,
                      String isActive, String imagePath, int price) {

        this.restaurantID = restaurantID;
        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.adminUserID = adminUserID;
        this.rating = rating;
        this.isActive = isActive;
        this.imagePath = imagePath;
        this.price = price;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAdminUserID() {
        return adminUserID;
    }

    public void setAdminUserID(int adminUserID) {
        this.adminUserID = adminUserID;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    
    
    public int getPrice() {
        return price;
    }

    public void setPrice(int d) {
        this.price = d;
    }

    @Override
    public String toString() {
        return "Restaurant [restaurantID=" + restaurantID +
               ", name=" + name +
               ", cuisineType=" + cuisineType +
               ", deliveryTime=" + deliveryTime +
               ", address=" + address +
               ", adminUserID=" + adminUserID +
               ", rating=" + rating +
               ", isActive=" + isActive +
               ", imagePath=" + imagePath + 
               ", Price=" + price + "]";
    }
}