package com.xxxx.evaluation.service;

import com.xxxx.evaluation.pojo.User;

public interface StudentService {
    boolean selectStudent(String IP);
    boolean saveStudent(User user);
}
