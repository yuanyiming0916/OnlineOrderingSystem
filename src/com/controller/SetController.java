package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.UserModel;

@Controller
@RequestMapping("SetController")
public class SetController {
	/**
	 * 点击设置
	 * 
	 * @param m
	 * @param session
	 * @return 跳转至设置页面
	 */
	@RequestMapping("set")
	public String set(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		return "setList";
	}
}
