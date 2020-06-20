package com.model;

import java.util.Date;

public class BusinessModel {
	private int id;
	private int userId;
	private int personCount;
	private double totalPrice;
	private double realPrice;
	private int isPay;
	private Date orderTime;
	private String scheduledTime;
	private Date businessTime;
	private int status;
	private Date orderDelTime;
	private Date orderReceiveTime;
	private Date orderRefuseTime;

	public BusinessModel() {
		super();
	}

	public BusinessModel(int id, int userId, int personCount, double totalPrice, double realPrice, int isPay,
			Date orderTime, String scheduledTime, Date businessTime, int status, Date orderDelTime,
			Date orderReceiveTime, Date orderRefuseTime) {
		super();
		this.id = id;
		this.userId = userId;
		this.personCount = personCount;
		this.totalPrice = totalPrice;
		this.realPrice = realPrice;
		this.isPay = isPay;
		this.orderTime = orderTime;
		this.scheduledTime = scheduledTime;
		this.businessTime = businessTime;
		this.status = status;
		this.orderDelTime = orderDelTime;
		this.orderReceiveTime = orderReceiveTime;
		this.orderRefuseTime = orderRefuseTime;
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

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getScheduledTime() {
		return scheduledTime;
	}

	public void setScheduledTime(String scheduledTime) {
		this.scheduledTime = scheduledTime;
	}

	public Date getBusinessTime() {
		return businessTime;
	}

	public void setBusinessTime(Date businessTime) {
		this.businessTime = businessTime;
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

	public Date getOrderReceiveTime() {
		return orderReceiveTime;
	}

	public void setOrderReceiveTime(Date orderReceiveTime) {
		this.orderReceiveTime = orderReceiveTime;
	}

	public Date getOrderRefuseTime() {
		return orderRefuseTime;
	}

	public void setOrderRefuseTime(Date orderRefuseTime) {
		this.orderRefuseTime = orderRefuseTime;
	}

	@Override
	public String toString() {
		return "BusinessModel [id=" + id + ", userId=" + userId + ", personCount=" + personCount + ", totalPrice="
				+ totalPrice + ", realPrice=" + realPrice + ", isPay=" + isPay + ", orderTime=" + orderTime
				+ ", scheduledTime=" + scheduledTime + ", businessTime=" + businessTime + ", status=" + status
				+ ", orderDelTime=" + orderDelTime + ", orderReceiveTime=" + orderReceiveTime + ", orderRefuseTime="
				+ orderRefuseTime + "]";
	}

}
