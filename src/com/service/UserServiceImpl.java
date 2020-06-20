package com.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.controller.UserController;
import com.dao.UserDao;
import com.model.UserModel;

@Service
public class UserServiceImpl implements UserService {
	public static Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserDao userDao;

	@Override
	public int add(UserModel u) {
		return userDao.add(u);
	}

	@Override
	public int del(int id) {
		return userDao.del(id);
	}

	@Override
	public int update(UserModel u) {
		return userDao.update(u);
	}

	@Override
	public UserModel findById(int id) {
		return userDao.findById(id);
	}

	@Override
	public List<UserModel> findByNameOrAdminOrId(UserModel u) {
		return userDao.findByCondition(u);
	}

	@Override
	public List<UserModel> findAll() {
		return userDao.findAll();
	}

	/**
	 * 登录验证
	 */
	@Override
	public UserModel login(UserModel u) {
		logger.info(this.getClass().getName() + "." + Thread.currentThread().getStackTrace()[1].getMethodName());
		
		List<UserModel> um = userDao.findByCondition(u);
		if (um != null && um.size() > 0) {
			return um.get(0);
		}
		return null;
	}

}
