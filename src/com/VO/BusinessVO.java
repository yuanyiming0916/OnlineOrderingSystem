package com.VO;

import java.util.Date;

public class BusinessVO {
	private int userId;
	private String name;
	private Date scheduledTime;
	private int personCount;
	private double totalPrice;
	private double realPrice;
	private int isPay;
	private Date businessTime;
	private Date orderReceiveTime;
	private String dishName;
	private double price;
	private int amount;
	private String imagePath;

	public BusinessVO() {
		super();
	}

	public BusinessVO(int userId, String name, Date scheduledTime, int personCount, double totalPrice, double realPrice,
			int isPay, Date businessTime, Date orderReceiveTime, String dishName, double price, int amount,
			String imagePath) {
		super();
		this.userId = userId;
		this.name = name;
		this.scheduledTime = scheduledTime;
		this.personCount = personCount;
		this.totalPrice = totalPrice;
		this.realPrice = realPrice;
		this.isPay = isPay;
		this.businessTime = businessTime;
		this.orderReceiveTime = orderReceiveTime;
		this.dishName = dishName;
		this.price = price;
		this.amount = amount;
		this.imagePath = imagePath;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getScheduledTime() {
		return scheduledTime;
	}

	public void setScheduledTime(Date scheduledTime) {
		this.scheduledTime = scheduledTime;
	}

	public int getPersonCount() {
		return personCount;
	}

	public void setPersonCount(int personCount) {
		this.personCount = personCount;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public double getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(double realPrice) {
		this.realPrice = realPrice;
	}

	public int getIsPay() {
		return isPay;
	}

	public void setIsPay(int isPay) {
		this.isPay = isPay;
	}

	public Date getBusinessTime() {
		return businessTime;
	}

	public void setBusinessTime(Date businessTime) {
		this.businessTime = businessTime;
	}

	public Date getOrderReceiveTime() {
		return orderReceiveTime;
	}

	public void setOrderReceiveTime(Date orderReceiveTime) {
		this.orderReceiveTime = orderReceiveTime;
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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "BusinessVO [userId=" + userId + ", name=" + name + ", scheduledTime=" + scheduledTime + ", personCount="
				+ personCount + ", totalPrice=" + totalPrice + ", realPrice=" + realPrice + ", isPay=" + isPay
				+ ", businessTime=" + businessTime + ", orderReceiveTime=" + orderReceiveTime + ", dishName=" + dishName
				+ ", price=" + price + ", amount=" + amount + ", imagePath=" + imagePath + "]";
	}

}
