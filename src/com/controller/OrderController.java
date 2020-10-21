package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.VO.OrderVO;
import com.google.gson.JsonObject;
import com.model.BusinessModel;
import com.model.CartModel;
import com.model.OrderModel;
import com.model.UserModel;
import com.service.BusinessService;
import com.service.CartService;
import com.service.OrderService;

@Controller
@RequestMapping("OrderController")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private BusinessService businessService;
	@Autowired
	private CartService cartService;

	/**
	 * 检索所有用户的全部订单
	 * 
	 * @param m
	 * @param session
	 * @return 跳转至订单列表页面
	 */
	@RequestMapping("findAll")
	public String findByIdPlus(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 检索全部下单的用户
		if(um.getRole()==2) {
			List<UserModel> userModel = orderService.findAllOrder();
			m.addAttribute("userModel", userModel);
		}
		if(um.getRole()==1) {
			List<UserModel> userModel = orderService.findAllOrder_1(um.getId());
			m.addAttribute("userModel", userModel);
		}

		return "orderList";
	}

	/**
	 * 订单页面点击查看订单
	 * 
	 * @param id
	 * @param m
	 * @param session
	 * @return
	 */
	@RequestMapping("findById/{id}")
	public String findById(@PathVariable int id, Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 检索用户订单
		List<OrderVO> om = orderService.findByIdPlus(id);
		m.addAttribute("om", om);

		// 检索交易信息
		BusinessModel bm = businessService.findById(id);
		m.addAttribute("bm", bm);

		return "orderListUser";
	}

	/**
	 * 购物车页面点击下单
	 * 
	 * @param dishName
	 * @param price
	 * @param amount
	 * @param dishId
	 * @param bm
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public void add(String[] dishName, float[] price, int[] amount, int[] dishId, BusinessModel bm,
			HttpServletResponse response) {
		Date time = new Date();

		// 批量插入订单数据
		OrderModel om = new OrderModel();
		for (int i = 0; i < amount.length; i++) {
			om.setUserId(bm.getUserId());
			om.setDishId(dishId[i]);
			om.setDishName(dishName[i]);
			om.setPrice(price[i]);
			om.setAmount(amount[i]);
			om.setAccept(0);
			om.setStatus(0);
			om.setOrderTime(time);
			orderService.add(om);
		}

		// 批量修改购物车数据
		CartModel cm = new CartModel();
		cm.setUserId(bm.getUserId());
		for (int i = 0; i < dishId.length; i++) {
			cm.setUserId(bm.getUserId());
			cm.setDishId(dishId[i]);
			List<CartModel> c = cartService.findByUserIdAndDishId(cm);
			cm.setAmount(c.get(0).getAmount());
			cm.setTime(time);
			cm.setStatus(1);
			cartService.update(cm);
		}

		// 交易数据
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String st = sdf.format(Long.parseLong(String.valueOf(bm.getScheduledTime())));
		bm.setIsPay(0);
		bm.setOrderTime(time);
		bm.setScheduledTime(st);
		bm.setStatus(0);
		businessService.add(bm);

		// 向前台传json数据
		String msg = null;
		JsonObject jo = new JsonObject();
		msg = "下单成功";
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 购物车页面点击退单
	 * 
	 * @param dishId
	 * @param response
	 * @param session
	 */
	@ResponseBody
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void update(int[] dishId, HttpServletResponse response, HttpSession session) {
		UserModel um = (UserModel) session.getAttribute("userSession");
		Date time = new Date();

		// 批量修改订单数据
		OrderModel om = new OrderModel();
		for (int i = 0; i < dishId.length; i++) {
			om.setUserId(um.getId());
			om.setDishId(dishId[i]);
			om.setStatus(-1);
			om.setOrderDelTime(time);
			orderService.update(om);
		}

		// 修改交易数据
		BusinessModel bm = new BusinessModel();
		bm.setUserId(um.getId());
		bm.setStatus(-1);
		bm.setOrderDelTime(time);
		businessService.update(bm);

		// 向前台传json数据
		String msg = null;
		JsonObject jo = new JsonObject();
		msg = "退单成功";
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
