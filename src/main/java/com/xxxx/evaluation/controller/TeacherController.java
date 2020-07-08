package com.xxxx.evaluation.controller;

import com.xxxx.evaluation.pojo.BaseResult;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.service.TeacherService;
import com.xxxx.evaluation.utils.IPUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 教师
 *
 * @author wq
 * @since 1.0.0
 */
@Controller
public class TeacherController {
    @Autowired
    TeacherService teacherService;
    @RequestMapping("/admin")
    public String admin(HttpServletRequest request, HttpServletResponse response){
        ServletContext application = request.getServletContext();
         Teacher teacher= (Teacher) application.getAttribute("teacher"+IPUtils.getIpAddress(request));
         if (teacher==null){
            return "login";
         }
         if(application.getAttribute("teachers")==null){
             application.setAttribute("teachers",teacherService.select());
         }
        System.out.println(teacherService.select());
        return "admin";
    }
    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response,String password){
        ServletContext application = request.getServletContext();
        if(password==null){
            return "login";
        }
        if(password.equals(teacherService.password())){
            Teacher teacher = new Teacher();
            application.setAttribute("teacher"+IPUtils.getIpAddress(request),teacher);
        }else {
            return "login";
        }

        return "admin";
    }
    @RequestMapping("/start")
    public String start(HttpServletRequest request, HttpServletResponse response,Teacher teacher2){
        ServletContext application = request.getServletContext();
        Teacher teacher= (Teacher)  application.getAttribute("teacher"+IPUtils.getIpAddress(request));
        //非法拦截
        if (teacher==null){
            return "login";
        }
        //如果没有该名老师或者已经测评完毕
        if (teacherService.isFlag(teacher2)||teacherService.isFlag(teacher2)==null){
            return "over";
        }
        //加入测评时间
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dateString = formatter.format(new Date());
            teacher2.setCreateTime(dateString);
            teacher2.setFlag(false);
         application.setAttribute("teacher"+IPUtils.getIpAddress(request),teacher2);
         //标志，学生可以开始答题了
        application.setAttribute("start","start");
        return "admin";
    }
    @RequestMapping("/end")
    @ResponseBody
    public BaseResult end(HttpServletRequest request, HttpServletResponse response){
        ServletContext application = request.getServletContext();
        Teacher teacher= (Teacher)  application.getAttribute("teacher"+IPUtils.getIpAddress(request));
        if (teacher==null){
            return BaseResult.error();
        }
        teacher.setFlag(true);
        if(teacherService.update(teacher)) {
            //清空作用域
            application.setAttribute("teacher"+IPUtils.getIpAddress(request),null);
            application.setAttribute("start",null);
            return BaseResult.success();
        }
        return BaseResult.error();
    }
}
