package com.xxxx.evaluation.pojo;

import java.util.Date;

public class Teacher {
    private String name;//测评老师
    private String createTime;//测评时间
    private String major;//专业
    private String grade;//班级
    private Boolean flag;//是否测评完毕

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "name='" + name + '\'' +
                ", createTime=" + createTime +
                ", major='" + major + '\'' +
                ", grade='" + grade + '\'' +
                ", flag=" + flag +
                '}';
    }
}
