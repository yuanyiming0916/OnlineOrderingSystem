package com.dao;

import java.util.List;

import com.model.MenuModel;

public interface MenuDao extends BaseDao<MenuModel> {
	int update_1(MenuModel m);

	List<MenuModel> findHotDishes();

	List<MenuModel> findColdDishes();

	List<MenuModel> findSoup();

	List<MenuModel> findFruit();

	List<MenuModel> findDrink();

	List<MenuModel> findFood();

//	MenuModel findByDishName(String dishName);
}
