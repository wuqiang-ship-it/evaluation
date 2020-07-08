package com.xxxx.evaluation.service.Imp;

import com.alibaba.fastjson.JSONArray;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.service.TeacherService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.xxxx.evaluation.utils.JsonResourceUtils.getJsonObjFromResource;
import static com.xxxx.evaluation.utils.JsonResourceUtils.updateFile;

@Service
public class TeacherServiceImp implements TeacherService{

    @Override
    public JSONArray select() {
        return getJsonObjFromResource("static/teacher.json");
    }

    @Override
    public String password() {
        return String.valueOf(getJsonObjFromResource("static/Password.json").getJSONObject(0).get("password"));
    }

    @Override
    public Boolean update(Teacher teacher) {
        JSONArray jsonArray = getJsonObjFromResource("static/teacher.json");
        List list = new ArrayList();
        for (int i=0;i<jsonArray.size();i++){
            if(teacher.getName().equals(jsonArray.getJSONObject(i).get("name"))) {
                list.add(teacher);
            }else {
                list.add(jsonArray.getJSONObject(i));
            }
        }
        System.out.println(list);
        return updateFile("static/teacher.json",list);
    }
    @Override
    public Boolean isFlag(Teacher teacher) {
        JSONArray jsonArray = getJsonObjFromResource("static/teacher.json");
        List list = new ArrayList();
        for (int i=0;i<jsonArray.size();i++){
            if(teacher.getName().equals(jsonArray.getJSONObject(i).get("name"))) {
              return (Boolean)jsonArray.getJSONObject(i).get("flag");
            }
        }
        return null;
    }
}
