package com.xxxx.evaluation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String index(){
		return "index";
	}

}
