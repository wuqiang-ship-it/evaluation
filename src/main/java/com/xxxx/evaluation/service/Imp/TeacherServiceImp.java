package com.xxxx.evaluation.service.Imp;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xxxx.evaluation.pojo.BaseResult;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.pojo.User;
import com.xxxx.evaluation.service.TeacherService;
import com.xxxx.evaluation.utils.JsonResourceUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.xxxx.evaluation.utils.JsonResourceUtils.getJsonObjFromResource;
import static com.xxxx.evaluation.utils.JsonResourceUtils.updateFile;

@Service
public class TeacherServiceImp implements TeacherService{

    @Override
    public JSONArray select() {
        return getJsonObjFromResource("/static/teacher.json");
    }

    @Override
    public String password() {
        return String.valueOf(getJsonObjFromResource("/static/Password.json").getJSONObject(0).get("password"));
    }

    @Override
    public JSONObject update(Teacher teacher,JSONArray jsonArray) {

        return JsonResourceUtils.writeNewWord(teacher,jsonArray);
    }

    /**
     * 上传数据生成ex表格
     * @return
     */
    @Override
    public JSONArray exc() {

        return getJsonObjFromResource("/static/AdConfig.json");
    }


}
