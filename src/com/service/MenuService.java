package com.service;

import java.util.List;

import com.model.MenuModel;

public interface MenuService {
	int add(MenuModel m);

	int del(int id);

	int update_1(MenuModel m);

	int update(MenuModel m);

	MenuModel findById(int id);

//	MenuModel findByDishName(String dishName);

	List<MenuModel> findAll();

	List<MenuModel> findByCondition(MenuModel m);

	List<MenuModel> findHotDishes();

	List<MenuModel> findColdDishes();

	List<MenuModel> findSoup();

	List<MenuModel> findFruit();

	List<MenuModel> findDrink();

	List<MenuModel> findFood();
}
