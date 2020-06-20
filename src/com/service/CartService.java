package com.service;

import java.util.List;

import com.VO.CartVO;
import com.model.CartModel;

public interface CartService {
	int add(CartModel c);

	int del(int id);

	int update(CartModel c);

	CartModel findById(int id);

	List<CartModel> findAll();

	List<CartModel> findByCondition(CartModel c);

	/**
	 * 查找购物车
	 * 
	 * @param id
	 * @return
	 */
	List<CartVO> findByIdPlus(int id);

	/**
	 * 查找购物车
	 * 
	 * @param c
	 * @return
	 */
	List<CartModel> findByUserIdAndDishId(CartModel c);

}
