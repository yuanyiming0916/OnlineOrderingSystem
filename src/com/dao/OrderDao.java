package com.dao;

import java.util.List;

import com.VO.OrderVO;
import com.model.OrderModel;
import com.model.UserModel;

public interface OrderDao extends BaseDao<OrderModel> {
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
