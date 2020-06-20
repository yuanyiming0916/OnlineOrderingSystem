package com.VO;

public class CartVO {
	private int id;
	private String name;
	private int dishId;
	private int amount;
	private String dishName;
	private double price;
	private String details;
	private String imagePath;// 图片路径

	public CartVO() {
		super();
	}

	public CartVO(int id, String name, int dishId, int amount, String dishName, double price, String details,
			String imagePath) {
		super();
		this.id = id;
		this.name = name;
		this.dishId = dishId;
		this.amount = amount;
		this.dishName = dishName;
		this.price = price;
		this.details = details;
		this.imagePath = imagePath;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDishId() {
		return dishId;
	}

	public void setDishId(int dishId) {
		this.dishId = dishId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "CartVO [id=" + id + ", name=" + name + ", dishId=" + dishId + ", amount=" + amount + ", dishName="
				+ dishName + ", price=" + price + ", details=" + details + ", imagePath=" + imagePath + "]";
	}

}
