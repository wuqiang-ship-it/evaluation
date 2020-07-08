package com.xxxx.evaluation.controller;

import com.xxxx.evaluation.utils.IPUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Controller
public class UserController {

	@RequestMapping("/admin")
	public String login(){
		return "admin";
	}
	/**
	 * 页面跳转，首页
	 * @return
	 */
	@RequestMapping("/")
	public String index(HttpServletRequest request, HttpServletResponse response){
		ServletContext application = request.getServletContext();
		application.setAttribute("ip",IPUtils.getIpAddress(request));
		return "index";
	}

}
