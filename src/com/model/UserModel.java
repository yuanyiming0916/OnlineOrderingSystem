package com.model;

import java.util.Date;

public class UserModel {
	private int id;
	private String name;
	private String password;
	private String phone;
	private int role;
	private String sex;
	private String birthday;
	private String address;
	private String email;
	private Date registrationTime;// 注册时间

	public UserModel() {
		super();
	}

	public UserModel(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}

	public UserModel(int id, String name, String password, String phone, int role, String sex, String birthday,
			String address, String email, Date registrationTime) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.role = role;
		this.sex = sex;
		this.birthday = birthday;
		this.address = address;
		this.email = email;
		this.registrationTime = registrationTime;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(Date registrationTime) {
		this.registrationTime = registrationTime;
	}

	@Override
	public String toString() {
		return "UserModel [id=" + id + ", name=" + name + ", password=" + password + ", phone=" + phone + ", role="
				+ role + ", sex=" + sex + ", birthday=" + birthday + ", address=" + address + ", email=" + email
				+ ", registrationTime=" + registrationTime + "]";
	}

}
