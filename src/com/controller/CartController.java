package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.VO.CartVO;
import com.model.CartModel;
import com.model.MenuModel;
import com.model.UserModel;
import com.service.CartService;
import com.service.MenuService;

@Controller
@RequestMapping("CartController")
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private MenuService menuService;

	/**
	 * 查找用户购物车
	 * 
	 * @param m
	 * @param session
	 * @return 跳转至购物车页面
	 */
	@RequestMapping("findByIdPlus")
	public String findfindByIdPlusById(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找用户购物车
		List<CartVO> cv = cartService.findByIdPlus(um.getId());
		m.addAttribute("cv", cv);

		return "cartList";
	}

	/**
	 * 购物车商品减少
	 * 
	 * @param dishId
	 * @param session
	 */
	@ResponseBody
	@RequestMapping("reduce/{dishId}")
	public void reduce(@PathVariable int dishId, HttpSession session) {
		UserModel um = (UserModel) session.getAttribute("userSession");

		CartModel c = new CartModel();
		c.setUserId(um.getId());
		c.setDishId(dishId);

		// 查找用户具体商品的购物车
		List<CartModel> cm = cartService.findByUserIdAndDishId(c);
		if (cm.get(0).getAmount() > 0) {// 购物车某商品的数量>0
			int amount = cm.get(0).getAmount() - 1;
			c.setAmount(amount);
			c.setTime(new Date());
			c.setStatus(cm.get(0).getStatus());
			cartService.update(c);
		}
	}

	/**
	 * 购物车商品增加
	 * 
	 * @param dishId
	 * @param session
	 */
	@ResponseBody
	@RequestMapping("increase/{dishId}")
	public void increase(@PathVariable int dishId, HttpSession session) {
		UserModel um = (UserModel) session.getAttribute("userSession");
		CartModel c = new CartModel();

		c.setUserId(um.getId());
		c.setDishId(dishId);
		c.setTime(new Date());

		List<CartModel> cm = cartService.findByUserIdAndDishId(c);
		if (cm.size() == 0) {// 购物车无此商品则新增
			MenuModel mm = menuService.findById(dishId);
			c.setDishName(mm.getDishName());
			c.setAmount(1);
			c.setStatus(0);
			cartService.add(c);
		} else {// 购物车有次商品则修改数量
			int amount = cm.get(0).getAmount() + 1;
			c.setAmount(amount);
			c.setStatus(cm.get(0).getStatus());
			cartService.update(c);
		}
	}
}
