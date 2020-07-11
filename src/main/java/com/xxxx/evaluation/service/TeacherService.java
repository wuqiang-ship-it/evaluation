package com.xxxx.evaluation.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sun.javafx.geom.BaseBounds;
import com.xxxx.evaluation.pojo.BaseResult;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.pojo.User;

public interface TeacherService {
    JSONArray select();
    String password();
    JSONObject update(Teacher teacher);
    Boolean isFlag(Teacher teacher);

    /**
     * 把文件传为ex表格
     */
    JSONArray exc();
}
