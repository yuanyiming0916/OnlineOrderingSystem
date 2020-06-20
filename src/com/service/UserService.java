package com.service;

import java.util.List;

import com.model.UserModel;

public interface UserService {
	int add(UserModel u);

	int del(int id);

	int update(UserModel u);

	UserModel findById(int id);

	List<UserModel> findByNameOrAdminOrId(UserModel u);

	List<UserModel> findAll();

	/**
	 * 登录验证
	 * 
	 * @param u
	 * @return
	 */
	UserModel login(UserModel u);
}
