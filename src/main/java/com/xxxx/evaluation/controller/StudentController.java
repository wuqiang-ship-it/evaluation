package com.xxxx.evaluation.controller;

import com.xxxx.evaluation.pojo.BaseResult;
import com.xxxx.evaluation.pojo.User;
import com.xxxx.evaluation.service.Imp.StudentServiceImp;
import com.xxxx.evaluation.utils.IPUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户
 *
 * @author wq
 * @since 1.0.0
 */
@Controller
public class StudentController {
	@Autowired
	private StudentServiceImp studentService;


	/**
	 * 页面跳转，首页
	 * @return
	 */
	@RequestMapping("/")
	public String index(HttpServletRequest request, HttpServletResponse response){
		ServletContext application = request.getServletContext();
		String start = (String) application.getAttribute("start");
		if (start == null){
			return "over";
		}
		String ip = IPUtils.getIpAddress(request);
		//判断该IP是否已经评教过了
		if(studentService.selectStudent(ip)){
			return "error";
		}
		//当前用户第一次进入该页面
		if(application.getAttribute(IPUtils.getIpAddress(request))==null){
			User user = new User();
			user.setIp(ip);
			application.setAttribute(IPUtils.getIpAddress(request),new User());
		}
		return "index";
	 }


	 /**
	 * 保存学生评教
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public BaseResult save(HttpServletRequest request){
		ServletContext application = request.getServletContext();
		User user= (User) application.getAttribute(IPUtils.getIpAddress(request));
		user.setFlag(true);
		if(studentService.saveStudent(user)){
			//保存成功，清空作用域
			application.setAttribute(IPUtils.getIpAddress(request),null);
			return BaseResult.success();
		}
		return BaseResult.error();
	}
	/**
	 * 页面跳转，首页
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public BaseResult update(String key, String value, HttpServletRequest request, HttpServletResponse response){
		if(StringUtils.isEmpty(key) || StringUtils.isEmpty(value)){
			return BaseResult.error();
		}
		ServletContext application = request.getServletContext();
		User user= (User) application.getAttribute(IPUtils.getIpAddress(request));
		Map<String,String> map =  user.getTopic();
		map.put(key, value);
		user.setIp(IPUtils.getIpAddress(request));
		user.setTopic(map);
		application.setAttribute(IPUtils.getIpAddress(request),user);
		return BaseResult.success();
	}

}
