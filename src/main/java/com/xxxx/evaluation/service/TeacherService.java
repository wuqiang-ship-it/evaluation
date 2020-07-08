package com.xxxx.evaluation.service;

import com.alibaba.fastjson.JSONArray;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.pojo.User;

public interface TeacherService {
    JSONArray select();
    String password();
    Boolean update(Teacher teacher);
    Boolean isFlag(Teacher teacher);
}
