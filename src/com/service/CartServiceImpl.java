package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.VO.CartVO;
import com.dao.CartDao;
import com.model.CartModel;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;

	@Override
	public int add(CartModel c) {
		return cartDao.add(c);
	}

	@Override
	public int del(int id) {
		return cartDao.del(id);
	}

	@Override
	public int update(CartModel c) {
		return cartDao.update(c);
	}

	@Override
	public CartModel findById(int id) {
		return cartDao.findById(id);
	}

	@Override
	public List<CartModel> findAll() {
		return cartDao.findAll();
	}

	@Override
	public List<CartModel> findByCondition(CartModel c) {
		return cartDao.findByCondition(c);
	}

	@Override
	public List<CartVO> findByIdPlus(int id) {
		return cartDao.findByIdPlus(id);
	}

	@Override
	public List<CartModel> findByUserIdAndDishId(CartModel c) {
		return cartDao.findByUserIdAndDishId(c);
	}

}
