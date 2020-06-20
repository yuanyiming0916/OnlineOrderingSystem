package com.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.model.UserModel;
import com.service.UserService;

@Controller
@RequestMapping("UserController")
public class UserController {
	public static Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	/**
	 * 用户登录验证
	 * 
	 * @param name
	 * @param password
	 * @param session
	 * @param m
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void login(String name, String password, HttpSession session, Model m, HttpServletResponse response) {
		logger.info(this.getClass().getName() + "." + Thread.currentThread().getStackTrace()[1].getMethodName());

		// 用户登录验证
		UserModel um = new UserModel(name, password);
		UserModel u = userService.login(um);

		String msg = null;
		JsonObject jo = new JsonObject();

		if (u != null) {// 用户表有此用户进入
			// 保存session
			session.setAttribute("userSession", u);
			m.addAttribute("user", u);
		} else {
			msg = "-1";
		}

		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		// return "redirect:/login.jsp";// 无此用户则重定向至登录页
	}

	/**
	 * 点击注册
	 * 
	 * @param m
	 * @return 跳转至注册页
	 */
	@RequestMapping("add")
	public String add(Model m) {
		return "userAdd";
	}

	/**
	 * 用户注册
	 * 
	 * @param m
	 * @param u
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "doAdd", method = RequestMethod.POST)
	public void doAdd(Model m, UserModel u, HttpServletResponse response) {
		String msg = null;
		JsonObject jo = new JsonObject();

		u.setRole(1);
		u.setRegistrationTime(new Date());

		// 查找全部已注册用户
		List<UserModel> um = userService.findAll();
		for (int i = 0; i < um.size() - 1; i++) {
			if (u.getPhone().trim().equals(um.get(i).getPhone())) {// 手机号唯一，不可重复
				msg = "手机号已被注册";
				jo.addProperty("msg", msg);
				try {
					response.getWriter().write(jo.toString());
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
			if (u.getPassword().trim().equals(um.get(i).getPassword())) {// 密码唯一，不可重复
				msg = "密码已被注册";
				jo.addProperty("msg", msg);
				try {
					response.getWriter().write(jo.toString());
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
		}

		userService.add(u);

		// 向前台传json数据
		msg = "注册成功";
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 点击用户修改信息
	 * 
	 * @param m
	 * @param session
	 * @return 跳转至用户修改页
	 */
	@RequestMapping(value = "update")
	public String update(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		UserModel u = userService.findById(um.getId());
		m.addAttribute("user", u);

		return "userUpdate";
	}

	/**
	 * 用户修改信息
	 * 
	 * @param u
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "doUpdate", method = RequestMethod.POST)
	public void doUpdate(UserModel u, HttpServletResponse response, HttpSession session) {
		String msg = null;
		JsonObject jo = new JsonObject();

		UserModel userModel = (UserModel) session.getAttribute("userSession");

		// 查找全部已注册用户
		List<UserModel> um = userService.findAll();
		for (int i = 0; i < um.size() - 1; i++) {
			if (u.getPhone().trim().equals(um.get(i).getPhone())
					&& (!u.getPhone().trim().equals(userModel.getPhone()))) {// 手机号唯一，不可重复
				msg = "手机号已被注册";
				jo.addProperty("msg", msg);
				try {
					response.getWriter().write(jo.toString());
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
			if (u.getPassword().trim().equals(um.get(i).getPassword())
					&& (!u.getPassword().trim().equals(userModel.getPassword()))) {// 密码唯一，不可重复
				msg = "密码已被注册";
				jo.addProperty("msg", msg);
				try {
					response.getWriter().write(jo.toString());
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
			if (u.getEmail().trim() != null || u.getEmail().trim() != "") {// 邮箱非空进入
				if (u.getEmail().trim().equals(um.get(i).getEmail())
						&& (!u.getEmail().trim().equals(userModel.getEmail()))) {// 邮箱唯一，不可重复
					msg = "邮箱已被注册";
					jo.addProperty("msg", msg);
					try {
						response.getWriter().write(jo.toString());
					} catch (IOException e) {
						e.printStackTrace();
					}
					return;
				}
			}
		}

		// 修改信息
		userService.update(u);

		// 向前台传json数据
		msg = "修改成功";
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 用户注销
	 * 
	 * @param session
	 * @return 重定向至登录页
	 */
	@RequestMapping("del")
	public String del(HttpSession session) {
		UserModel um = (UserModel) session.getAttribute("userSession");
		userService.del(um.getId());

		// 销毁session
		session.invalidate();

		return "redirect:/login.jsp";
	}

	/**
	 * 点击退出
	 * 
	 * @param session
	 * @return 重定向至登录页
	 */
	@RequestMapping("remove")
	public String remove(HttpSession session) {
		// 销毁session
		session.invalidate();

		return "redirect:/login.jsp";
	}

}
