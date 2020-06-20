package com.model;

import java.util.Date;

public class MenuModel {
	private int id;
	private String dishName;
	private double price;
	private String details;
	private int amount;
	private int type;
	private String imagePath;
	private Date shelfTime;
	private Date dismountTime;
	private int status;

	public MenuModel() {
		super();
	}

	public MenuModel(int id, String dishName, double price, String details, int amount, int type, String imagePath,
			Date shelfTime, Date dismountTime, int status) {
		super();
		this.id = id;
		this.dishName = dishName;
		this.price = price;
		this.details = details;
		this.amount = amount;
		this.type = type;
		this.imagePath = imagePath;
		this.shelfTime = shelfTime;
		this.dismountTime = dismountTime;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Date getShelfTime() {
		return shelfTime;
	}

	public void setShelfTime(Date shelfTime) {
		this.shelfTime = shelfTime;
	}

	public Date getDismountTime() {
		return dismountTime;
	}

	public void setDismountTime(Date dismountTime) {
		this.dismountTime = dismountTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MenuModel [id=" + id + ", dishName=" + dishName + ", price=" + price + ", details=" + details
				+ ", amount=" + amount + ", type=" + type + ", imagePath=" + imagePath + ", shelfTime=" + shelfTime
				+ ", dismountTime=" + dismountTime + ", status=" + status + "]";
	}

}
