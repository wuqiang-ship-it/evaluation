package com.xxxx.evaluation.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xxxx.evaluation.pojo.BaseResult;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.service.TeacherService;
import com.xxxx.evaluation.utils.IPUtils;
import com.xxxx.evaluation.utils.Md5Util;
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
import java.util.Map;

import com.xxxx.evaluation.utils.JsonResourceUtils;
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
        System.out.println(IPUtils.getIpAddress(request));

         if(!(IPUtils.getIpAddress(request).equals("127.0.0.1")||IPUtils.getIpAddress(request).equals("0:0:0:0:0:0:0:1"))){
             return "login";
         }
         if (application.getAttribute("global")==null){
            return "login";
         }
        if (application.getAttribute("end")!=null){
            return "upexs";
        }
        return "admin";
    }
    @RequestMapping("/login")
    public String login1(HttpServletRequest request, HttpServletResponse response){
        ServletContext application = request.getServletContext();
        if (application.getAttribute("end")!=null){
            return "upexs";
        }
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
//        //新的教师登录，需要清空原来的学生评教信息
//        if(!JsonResourceUtils.emptyFile("static//AdConfig.json")){
//            return BaseResult.error();
//        }
        //如果密码不相等
        JSONObject jsonObject = JsonResourceUtils.getJsonObject("static/global.json");
        if (!Md5Util.MD5(password).equals(jsonObject.getString("password"))){
            return BaseResult.error();
        }
        application.setAttribute("global",jsonObject);
        Map<String,List> map = (Map<String, List>) jsonObject.get("classes");
        application.setAttribute("major",map.keySet());
        return BaseResult.success();
    }

    @RequestMapping("/start")
    @ResponseBody
    public BaseResult start(HttpServletRequest request, HttpServletResponse response,Teacher teacher){
        ServletContext application = request.getServletContext();
        if(!(IPUtils.getIpAddress(request).equals("127.0.0.1")||IPUtils.getIpAddress(request).equals("0:0:0:0:0:0:0:1"))){
            return BaseResult.error();
        }
        if (application.getAttribute("global")==null){
            return BaseResult.error();
        }
        //加入测评时间
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dateString = formatter.format(new Date());
            teacher.setCreateTime(dateString);
            teacher.setFlag(false);
         application.setAttribute("teacher",teacher);
         //标志，学生可以开始答题了
        application.setAttribute("start","start");
        return BaseResult.success();
    }
    @RequestMapping("/end")
    @ResponseBody
    public BaseResult end(HttpServletRequest request, HttpServletResponse response){
        ServletContext application = request.getServletContext();
        if(!(IPUtils.getIpAddress(request).equals("127.0.0.1")||IPUtils.getIpAddress(request).equals("0:0:0:0:0:0:0:1"))){
            return BaseResult.error();
        }
        if (application.getAttribute("global")==null){
            return BaseResult.error();
        }
        Teacher teacher = (Teacher) application.getAttribute("teacher");
        //清空作用域
        application.setAttribute("teacher",null);
        application.setAttribute("start",null);
        application.setAttribute("global",null);
        //生成专属json文件
        if(teacherService.update(teacher)!=null) {
            application.setAttribute("end","end");
            return BaseResult.success();
        }
        return BaseResult.error();
    }
    @RequestMapping("/linkage")
    @ResponseBody
    public BaseResult linkage(HttpServletRequest request, HttpServletResponse response,String major){
        BaseResult baseResult= BaseResult.success();
        ServletContext application = request.getServletContext();
        JSONObject jsonObject = (JSONObject) application.getAttribute("global");
        Map<String,List> map = (Map<String, List>) jsonObject.get("classes");
        if(map.get(major)==null){
            application.setAttribute("grades",null);
            return BaseResult.error();
        }else {
            application.setAttribute("grades",(JSONArray) map.get(major));
            System.out.println();
            baseResult.setList(map.get(major));
            return baseResult;
        }
    }

    @RequestMapping("upex")
    public String upex(){
        return "upex";
    }

    @RequestMapping("tree")
    @ResponseBody
    public JSONObject tree(){
        return JsonResourceUtils.getJsonObject("static/newWord.json");
    }
    @RequestMapping("upexs")
    public String upexs(){
        return "upexs";
    }
}
