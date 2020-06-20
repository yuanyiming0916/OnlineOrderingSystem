package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MenuDao;
import com.model.MenuModel;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Override
	public int add(MenuModel m) {
		return menuDao.add(m);
	}

	@Override
	public int del(int id) {
		return menuDao.del(id);
	}

	@Override
	public int update_1(MenuModel m) {
		return menuDao.update_1(m);
	}

	@Override
	public int update(MenuModel m) {
		return menuDao.update(m);
	}

	@Override
	public MenuModel findById(int id) {
		return menuDao.findById(id);
	}

//	@Override
//	public MenuModel findByDishName(String dishName) {
//		return menuDao.findByDishName(dishName);
//	}

	@Override
	public List<MenuModel> findAll() {
		return menuDao.findAll();
	}

	@Override
	public List<MenuModel> findByCondition(MenuModel m) {
		return menuDao.findByCondition(m);
	}

	@Override
	public List<MenuModel> findHotDishes() {
		return menuDao.findHotDishes();
	}

	@Override
	public List<MenuModel> findColdDishes() {
		return menuDao.findColdDishes();
	}

	@Override
	public List<MenuModel> findSoup() {
		return menuDao.findSoup();
	}

	@Override
	public List<MenuModel> findFruit() {
		return menuDao.findFruit();
	}

	@Override
	public List<MenuModel> findDrink() {
		return menuDao.findDrink();
	}

	@Override
	public List<MenuModel> findFood() {
		return menuDao.findFood();
	}

}
