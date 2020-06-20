package com.service;

import java.util.List;

import com.VO.OrderVO;
import com.model.OrderModel;
import com.model.UserModel;

public interface OrderService {
	int add(OrderModel o);

	int del(int id);

	int update(OrderModel o);

	OrderModel findById(int id);

	List<OrderModel> findAll();

	List<OrderModel> findByCondition(OrderModel o);

	/**
	 * 检索用户订单
	 * 
	 * @return
	 */
	List<OrderVO> findByIdPlus(int id);

	/**
	 * 检索全部下单的用户
	 * 
	 * @return
	 */
	List<UserModel> findAllOrder();

	/**
	 * 检索用户订单
	 * 
	 * @return
	 */
	List<UserModel> findAllOrder_1(int id);

	/**
	 * 检索订单（用户下单）
	 */
	List<OrderModel> findAll(int userId);
}
