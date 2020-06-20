package com.dao;

import java.util.List;

import com.VO.CartVO;
import com.model.CartModel;

public interface CartDao extends BaseDao<CartModel> {
	/**
	 * 查找购物车
	 * 
	 * @param id 用户id
	 * @return
	 */
	List<CartVO> findByIdPlus(int id);

	/**
	 * 查找购物车
	 * 
	 * @param c 用户id,商品id
	 * @return
	 */
	List<CartModel> findByUserIdAndDishId(CartModel c);

}
