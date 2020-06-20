package com.model;

import java.util.Date;

public class OrderModel {
	private int id;
	private int userId;
	private int dishId;
	private String dishName;
	private double price;
	private int amount;
	private String remarks;
	private Date orderTime;
	private int accept;
	private Date acceptTime;
	private int status;
	private Date orderDelTime;
	
	public OrderModel() {
		super();
	}

	public OrderModel(int id, int userId, int dishId, String dishName, double price, int amount, String remarks,
			Date orderTime, int accept, Date acceptTime, int status, Date orderDelTime) {
		super();
		this.id = id;
		this.userId = userId;
		this.dishId = dishId;
		this.dishName = dishName;
		this.price = price;
		this.amount = amount;
		this.remarks = remarks;
		this.orderTime = orderTime;
		this.accept = accept;
		this.acceptTime = acceptTime;
		this.status = status;
		this.orderDelTime = orderDelTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public int getAccept() {
		return accept;
	}

	public void setAccept(int accept) {
		this.accept = accept;
	}

	public Date getAcceptTime() {
		return acceptTime;
	}

	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getOrderDelTime() {
		return orderDelTime;
	}

	public void setOrderDelTime(Date orderDelTime) {
		this.orderDelTime = orderDelTime;
	}

	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", userId=" + userId + ", dishId=" + dishId + ", dishName=" + dishName
				+ ", price=" + price + ", amount=" + amount + ", remarks=" + remarks + ", orderTime=" + orderTime
				+ ", accept=" + accept + ", acceptTime=" + acceptTime + ", status=" + status + ", orderDelTime="
				+ orderDelTime + "]";
	}

}
