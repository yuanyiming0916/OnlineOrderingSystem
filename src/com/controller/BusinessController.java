package com.controller;

import java.io.IOException;
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

import com.VO.BusinessVO;
import com.google.gson.JsonObject;
import com.model.BusinessModel;
import com.model.OrderModel;
import com.model.UserModel;
import com.service.BusinessService;
import com.service.OrderService;

@Controller
@RequestMapping("BusinessController")
public class BusinessController {
	@Autowired
	private BusinessService businessService;
	@Autowired
	private OrderService orderService;

	/**
	 * 获取交易记录
	 * 
	 * @param m
	 * @param session
	 * @return 跳转至历史记录页面
	 */
	@RequestMapping("findByIdPlus")
	public String findByIdPlus(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 用户获取交易记录
		if (um.getRole() == 1) {
			List<BusinessVO> bv = businessService.findByIdPlus(um.getId());
			m.addAttribute("bv", bv);
		}
		// 商家获取交易记录
		if (um.getRole() == 2) {
			List<BusinessVO> bv = businessService.findAll_1();
			
			m.addAttribute("bv", bv);
		}

		return "businessList";
	}

	/**
	 * 商家点击接单
	 * 
	 * @param userId
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "update_receive/{userId}", method = RequestMethod.POST)
	public void update_receive(@PathVariable int userId, int[] dishId, HttpServletResponse response) {
		// 修改交易数据
		Date time = new Date();
		BusinessModel bm = new BusinessModel();
		bm.setUserId(userId);
		bm.setStatus(1);
		bm.setOrderReceiveTime(time);
		businessService.update(bm);

		// 批量修改订单数据
		OrderModel om = new OrderModel();
		for (int i = 0; i < dishId.length; i++) {
			om.setUserId(userId);
			om.setDishId(dishId[i]);
			om.setAccept(1);
			om.setAcceptTime(time);
			orderService.update(om);
		}

		// 向前台传json数据
		String msg = null;
		JsonObject jo = new JsonObject();
		msg = "已接单";
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 商家点击拒接
	 * 
	 * @param userId
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "update_refuse/{userId}", method = RequestMethod.POST)
	public void update_refuse(@PathVariable int userId, HttpServletResponse response) {
		// 交易数据
		BusinessModel bm = new BusinessModel();
		Date time = new Date();
		bm.setUserId(userId);
		bm.setStatus(-2);
		bm.setOrderRefuseTime(time);
		businessService.update(bm);

		// 向前台传json数据
		String msg = null;
		JsonObject jo = new JsonObject();
		msg = "已拒接";
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
