package com.xxxx.evaluation.service.Imp;

import com.alibaba.fastjson.JSONArray;
import com.xxxx.evaluation.pojo.User;
import com.xxxx.evaluation.service.StudentService;
import com.xxxx.evaluation.utils.JsonResourceUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.xxxx.evaluation.utils.JsonResourceUtils.getJsonObjFromResource;
@Service
public class StudentServiceImp implements StudentService {
    /*
    * 查找该学生有没有评教
    * */
    @Override
    public  boolean selectStudent(String IP){
        JSONArray jsonArray = getJsonObjFromResource("/static/AdConfig.json");
        List list = new ArrayList();
        for (int i=0;i<jsonArray.size();i++){

            if(IP.equals(jsonArray.getJSONObject(i).get("ip"))) {
                return true;
            };
        }
        return false;
    }
    /**
     * 保存学生评教
     *
     * */
    @Override
    public  boolean saveStudent(User user){
       return JsonResourceUtils.writeAppendFile("/static/AdConfig.json",user,getJsonObjFromResource("/static/AdConfig.json"));
    }
}
