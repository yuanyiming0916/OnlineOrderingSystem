package com.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 验证码
 *
 */
@Controller
@RequestMapping("CaptchaController")
public class CaptchaController {
	private static Random random = new Random();

	/**
	 * 获取4位随机数
	 * 
	 * @return
	 */
//	private String getRandomString() {
//		String rs = "";
//		for (int i = 0; i < 4; i++) {
//			rs += randChar();
//		}
//		return rs;
//	}

	/**
	 * 生成一个随机字符
	 * 
	 * @return
	 */
//	public char randChar() {
//		int t = (int) (Math.random() * 62);
//		char c;
//		if (t < 10) {
//			c = (char) (t + '0');
//		} else if (t < 36) {
//			c = (char) (t - 10 + 'A');
//		} else {
//			c = (char) (t - 36 + 'a');
//		}
//		return c;
//	}

	/**
	 * 获取随机数颜色
	 * 
	 * @return
	 */
	private static Color getRandomColor() {
		return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}

	/**
	 * 返回某颜色的反色
	 * 
	 * @param c
	 * @return
	 */
	private static Color getReverseColor(Color c) {
		return new Color(255 - c.getRed(), 255 - c.getGreen(), 255 - c.getBlue());
	}

	/**
	 * 生成验证码
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("outputCaptcha")
	public void outputCaptcha(HttpServletResponse response, String rad, String captcha) throws IOException {
		// 设置页面不缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		String randomString = captcha;

		int width = 100;
		int height = 34;

		// 生成验证码图象
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = bi.createGraphics();
		for (int i = 0; i < randomString.length(); i++) {
			Color color = getRandomColor();
			Color reverse = getReverseColor(color);
			g.setColor(color); // 设置字体颜色
			g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 24)); // 设置字体样式
			g.fillRect(0, 0, width, height);
			g.setColor(reverse);
			g.drawString(randomString, 18, 25);
		}

		// 随机生成干扰点
		for (int i = 0, n = random.nextInt(80); i < n; i++) {
			g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
		}

		// 随机产生干扰线
		for (int i = 0; i < 5; i++) {
			g.setColor(getRandomColor());
			final int x = random.nextInt(width - 1); // 保证画在边框之内
			final int y = random.nextInt(height - 1);
			final int xl = random.nextInt(width);
			final int yl = random.nextInt(height);
			g.drawLine(x, y, x + xl, y + yl);
		}

		g.dispose(); // 图像生效
		ImageIO.write(bi, "JPEG", response.getOutputStream()); // 输出图片到页面
	}

}