package com.xxxx.evaluation.controller;

import com.alibaba.fastjson.JSONArray;
import com.xxxx.evaluation.pojo.BaseResult;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.service.TeacherService;
import com.xxxx.evaluation.utils.IPUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.xxxx.evaluation.utils.JsonResourceUtils.getJsonObjFromResource;

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
        return "admin";
    }
    @RequestMapping("/login")
    public String login1(){
        return  "login";
    }
    @RequestMapping("/login1")
    @ResponseBody
    public BaseResult login(HttpServletRequest request, HttpServletResponse response,String password){
        ServletContext application = request.getServletContext();
        System.out.println(password);
        if(password==null){
            return BaseResult.error();
        }
        System.out.println(String.valueOf(getJsonObjFromResource("static/Password.json").getJSONObject(0).get("password")));

        if(password.equals(teacherService.password())){
            Teacher teacher = new Teacher();
            application.setAttribute("teacher"+IPUtils.getIpAddress(request),teacher);
        }else {
            return BaseResult.error();
        }
        if(application.getAttribute("teachers")==null){
            application.setAttribute("teachers",teacherService.select());
            JSONArray jsonArray = teacherService.select();
                List<String> teacher= new ArrayList<>();
            for (int i=0;i<jsonArray.size();i++){
                String grade = (String) jsonArray.getJSONObject(i).get("grade");
                teacher.add(grade);
            }
            application.setAttribute("teacher",teacher);
            System.out.println(teacher);
        }

        return BaseResult.success();
    }

    @RequestMapping("/start")
    @ResponseBody
    public BaseResult start(HttpServletRequest request, HttpServletResponse response,Teacher teacher2){
        ServletContext application = request.getServletContext();
        Teacher teacher= (Teacher)  application.getAttribute("teacher"+IPUtils.getIpAddress(request));
        //非法拦截
        if (teacher==null){
            return BaseResult.error();
        }
        //如果没有该名老师或者已经测评完毕
        if (teacherService.isFlag(teacher2)||teacherService.isFlag(teacher2)==null){
            return BaseResult.error();
        }
        //加入测评时间
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dateString = formatter.format(new Date());
            teacher2.setCreateTime(dateString);
            teacher2.setFlag(false);
         application.setAttribute("teacher"+IPUtils.getIpAddress(request),teacher2);
         //标志，学生可以开始答题了
        application.setAttribute("start","start");
        return BaseResult.success();
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
    @RequestMapping("/linkage")
    @ResponseBody
    public BaseResult linkage(HttpServletRequest request, HttpServletResponse response,String grade){
        BaseResult baseResult = new BaseResult();
        if (StringUtils.isEmpty(grade)){
            baseResult.setCode(402);
            baseResult.setMessage("请选择班级");
            return baseResult.error();
        }
        ServletContext application = request.getServletContext();
        JSONArray jsonArray = (JSONArray) application.getAttribute("teachers");
        if (CollectionUtils.isEmpty(jsonArray)){
            baseResult.setCode(400);
            baseResult.setMessage("系统出错了");
            return baseResult.error();
        }
        List<Teacher> t=null;
        for (int i=0;i<jsonArray.size();i++){
           if(grade.equals(jsonArray.getJSONObject(i).get("grade"))) {
               baseResult.setCode(200);
               baseResult.setMessage(jsonArray.getJSONObject(i).toString());
               return baseResult;
           }
        }
        baseResult.setCode(401);
        baseResult.setMessage("没有查到该班级");
        return baseResult.error();
    }
}
