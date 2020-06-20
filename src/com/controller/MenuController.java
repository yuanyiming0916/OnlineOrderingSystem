package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.VO.CartVO;
import com.google.gson.JsonObject;
import com.model.MenuModel;
import com.model.UserModel;
import com.service.CartService;
import com.service.MenuService;
import com.service.UserService;

@Controller
@RequestMapping("MenuController")
public class MenuController {
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;

	/**
	 * 查找全部商品
	 * 
	 * @param m
	 * @param session
	 * @return
	 */
	@RequestMapping("findAll_Manager")
	public String findAll_Manager(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找全部商品
		List<MenuModel> mm = menuService.findAll();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 查找热菜
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findHotDishes_Manager")
	public String findHotDishes_Manager(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找热菜
		List<MenuModel> mm = menuService.findHotDishes();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 查找冷菜
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findColdDishes_Manager")
	public String findColdDishes_Manager(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找冷菜
		List<MenuModel> mm = menuService.findColdDishes();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 查找羹汤
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findSoup_Manager")
	public String findSoup_Manager(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找羹汤
		List<MenuModel> mm = menuService.findSoup();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 查找水果
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findFruit_Manager")
	public String findFruit_Manager(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找水果
		List<MenuModel> mm = menuService.findFruit();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 查找酒水
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findDrink_Manager")
	public String findDrink_Manager(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找酒水
		List<MenuModel> mm = menuService.findDrink();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 查找主食
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findFood_Manager")
	public String findFood_Manager(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 查找主食
		List<MenuModel> mm = menuService.findFood();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 查找全部商品
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findAll")
	public String findAll(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		List<MenuModel> mm = menuService.findAll();
		List<CartVO> mm_cart = cartService.findByIdPlus(um.getId());

		for (int i = 0; i < mm.size(); i++) {
			for (int j = 0; j < mm_cart.size(); j++) {
				if (mm.get(i).getId() == mm_cart.get(j).getDishId()) {
					mm.get(i).setAmount(mm_cart.get(j).getAmount());
				}
			}
		}
		m.addAttribute("mm", mm);

		return "menuList";
	}

	/**
	 * 查找热菜
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findHotDishes")
	public String findHotDishes(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		List<MenuModel> mm = menuService.findHotDishes();
		List<CartVO> mm_cart = cartService.findByIdPlus(um.getId());

		for (int i = 0; i < mm.size(); i++) {
			for (int j = 0; j < mm_cart.size(); j++) {
				if (mm.get(i).getId() == mm_cart.get(j).getDishId()) {
					mm.get(i).setAmount(mm_cart.get(j).getAmount());
				}
			}
		}
		m.addAttribute("mm", mm);

		return "menuList";
	}

	/**
	 * 查找冷菜
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findColdDishes")
	public String findColdDishes(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		List<MenuModel> mm = menuService.findColdDishes();
		List<CartVO> mm_cart = cartService.findByIdPlus(um.getId());

		for (int i = 0; i < mm.size(); i++) {
			for (int j = 0; j < mm_cart.size(); j++) {
				if (mm.get(i).getId() == mm_cart.get(j).getDishId()) {
					mm.get(i).setAmount(mm_cart.get(j).getAmount());
				}
			}
		}
		m.addAttribute("mm", mm);

		return "menuList";
	}

	/**
	 * 查找羹汤
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findSoup")
	public String findSoup(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		List<MenuModel> mm = menuService.findSoup();
		List<CartVO> mm_cart = cartService.findByIdPlus(um.getId());

		for (int i = 0; i < mm.size(); i++) {
			for (int j = 0; j < mm_cart.size(); j++) {
				if (mm.get(i).getId() == mm_cart.get(j).getDishId()) {
					mm.get(i).setAmount(mm_cart.get(j).getAmount());
				}
			}
		}
		m.addAttribute("mm", mm);

		return "menuList";
	}

	/**
	 * 查找水果
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findFruit")
	public String findFruit(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		List<MenuModel> mm = menuService.findFruit();
		List<CartVO> mm_cart = cartService.findByIdPlus(um.getId());

		for (int i = 0; i < mm.size(); i++) {
			for (int j = 0; j < mm_cart.size(); j++) {
				if (mm.get(i).getId() == mm_cart.get(j).getDishId()) {
					mm.get(i).setAmount(mm_cart.get(j).getAmount());
				}
			}
		}
		m.addAttribute("mm", mm);
		return "menuList";
	}

	/**
	 * 查找酒水
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findDrink")
	public String findDrink(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		List<MenuModel> mm = menuService.findDrink();
		List<CartVO> mm_cart = cartService.findByIdPlus(um.getId());

		for (int i = 0; i < mm.size(); i++) {
			for (int j = 0; j < mm_cart.size(); j++) {
				if (mm.get(i).getId() == mm_cart.get(j).getDishId()) {
					mm.get(i).setAmount(mm_cart.get(j).getAmount());
				}
			}
		}
		m.addAttribute("mm", mm);

		return "menuList";
	}

	/**
	 * 查找主食
	 * 
	 * @param m
	 * @return
	 */
	@RequestMapping("findFood")
	public String findFood(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		List<MenuModel> mm = menuService.findFood();
		List<CartVO> mm_cart = cartService.findByIdPlus(um.getId());

		for (int i = 0; i < mm.size(); i++) {
			for (int j = 0; j < mm_cart.size(); j++) {
				if (mm.get(i).getId() == mm_cart.get(j).getDishId()) {
					mm.get(i).setAmount(mm_cart.get(j).getAmount());
				}
			}
		}
		m.addAttribute("mm", mm);

		return "menuList";
	}

	/**
	 * 点击商品上架
	 * 
	 * @param m
	 * @param session
	 * @return 跳转至商品新增页面
	 */
	@RequestMapping("add")
	public String add(Model m, HttpSession session) {
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);
		return "menuAdd";
	}

	/**
	 * 新增商品
	 * 
	 * @param m
	 * @param mm
	 * @param file
	 * @param request
	 * @param response
	 */
	// @ResponseBody
	@RequestMapping(value = "doAdd", method = RequestMethod.POST)
	public String doAdd(Model m, MenuModel mm, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) {
		System.err.println(mm);
		String fileName = null;
		if (file != null) {
			// 获取文件名
			String originalFileName = file.getOriginalFilename();
			// 获取文件名后缀
			String suffix = originalFileName.substring(originalFileName.lastIndexOf("."));
			// 重命名
			fileName = UUID.randomUUID().toString().replace("-", "") + suffix;
			// 获取路径
			String filePath = request.getSession().getServletContext().getRealPath("/") + "img";
			File saveFile = new File(filePath);
			try {
				// 保存图片
				file.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		Date date = new Date();
		mm.setImagePath(fileName);
		mm.setShelfTime(date);
		mm.setStatus(1);
		mm.setAmount(0);

		menuService.add(mm);

		return "setList";

//		// 向前台传json数据
//		String msg = "上传成功！";
//		JsonObject jo = new JsonObject();
//		jo.addProperty("msg", msg);
//		try {
//			response.getWriter().write(jo.toString());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	}

	/**
	 * 点击商品管理
	 * 
	 * @param m
	 * @param session
	 * @return 跳转至商品管理页
	 */
	@RequestMapping("menuManage")
	public String menuManage(Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		m.addAttribute("user", um);

		// 检索全部商品
		List<MenuModel> mm = menuService.findAll();
		m.addAttribute("mm", mm);

		return "menuManage";
	}

	/**
	 * 点击商品修改
	 * 
	 * @param id      商品id
	 * @param m
	 * @param session
	 * @return 跳转至商品修改页面
	 */
	@RequestMapping(value = "update/{id}")
	public String update(@PathVariable int id, Model m, HttpSession session) {
		// 获取用户信息
		UserModel um = (UserModel) session.getAttribute("userSession");
		UserModel u = userService.findById(um.getId());
		m.addAttribute("user", u);

		// 获取商品信息
		MenuModel mm = menuService.findById(id);
		m.addAttribute("mm", mm);

		return "menuUpdate";
	}

	/**
	 * 商品修改
	 * 
	 * @param mm
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("doUpdate")
	public void doUpdate(MenuModel mm, HttpServletResponse response) {
		menuService.update(mm);

		// 向前台传json数据
		String msg = "修改成功";
		JsonObject jo = new JsonObject();
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 商品管理页面点击删除
	 * 
	 * @param id
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "del/{id}")
	public void del(@PathVariable int id, HttpServletResponse response) {
		MenuModel mm = new MenuModel();
		Date dismountTime = new Date();

		mm.setId(id);
		mm.setDismountTime(dismountTime);
		mm.setStatus(0);

		menuService.update_1(mm);

		// 向前台传json数据
		String msg = "已删除";
		JsonObject jo = new JsonObject();
		jo.addProperty("msg", msg);
		try {
			response.getWriter().write(jo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
