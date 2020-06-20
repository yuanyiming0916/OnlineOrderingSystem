package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.VO.OrderVO;
import com.dao.OrderDao;
import com.model.OrderModel;
import com.model.UserModel;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;

	@Override
	public int add(OrderModel o) {
		return orderDao.add(o);
	}

	@Override
	public int del(int id) {
		return orderDao.del(id);
	}

	@Override
	public int update(OrderModel o) {
		return orderDao.update(o);
	}

	@Override
	public OrderModel findById(int id) {
		return orderDao.findById(id);
	}

	@Override
	public List<OrderModel> findAll() {
		return orderDao.findAll();
	}

	@Override
	public List<OrderModel> findByCondition(OrderModel o) {
		return orderDao.findByCondition(o);
	}

	/**
	 * 检索用户详细订单
	 */
	@Override
	public List<OrderVO> findByIdPlus(int id) {
		return orderDao.findByIdPlus(id);
	}

	/**
	 * 检索全部用户订单
	 */
	@Override
	public List<UserModel> findAllOrder() {
		return orderDao.findAllOrder();
	}

	/**
	 * 检索用户详细订单
	 */
	@Override
	public List<OrderModel> findAll(int userId) {
		return orderDao.findAll(userId);
	}

	/**
	 * 检索用户订单
	 */
	@Override
	public List<UserModel> findAllOrder_1(int id) {
		return orderDao.findAllOrder_1(id);
	}

}
