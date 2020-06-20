package com.VO;

import java.util.Date;

public class OrderVO {
	private int userId;
	private String name;
	private int dishId;
	private String dishName;
	private double price;
	private int amount;
	private String remarks;
	private Date orderTime;
	private String imagePath;

	public OrderVO() {
		super();
	}

	public OrderVO(int userId, String name, int dishId, String dishName, double price, int amount, String remarks,
			Date orderTime, String imagePath) {
		super();
		this.userId = userId;
		this.name = name;
		this.dishId = dishId;
		this.dishName = dishName;
		this.price = price;
		this.amount = amount;
		this.remarks = remarks;
		this.orderTime = orderTime;
		this.imagePath = imagePath;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public int getDishId() {
		return dishId;
	}

	public void setDishId(int dishId) {
		this.dishId = dishId;
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "OrderVO [userId=" + userId + ", name=" + name + ", dishId=" + dishId + ", dishName=" + dishName
				+ ", price=" + price + ", amount=" + amount + ", remarks=" + remarks + ", orderTime=" + orderTime
				+ ", imagePath=" + imagePath + "]";
	}

}
