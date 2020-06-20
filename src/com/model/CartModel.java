package com.model;

import java.util.Date;

public class CartModel {
	private int id;
	private int userId;
	private int dishId;
	private String dishName;
	private int amount;
	private Date time;
	private int status;

	public CartModel() {
		super();
	}

	public CartModel(int id, int userId, int dishId, String dishName, int amount, Date time, int status) {
		super();
		this.id = id;
		this.userId = userId;
		this.dishId = dishId;
		this.dishName = dishName;
		this.amount = amount;
		this.time = time;
		this.status = status;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CartModel [id=" + id + ", userId=" + userId + ", dishId=" + dishId + ", dishName=" + dishName
				+ ", amount=" + amount + ", time=" + time + ", status=" + status + "]";
	}

}
