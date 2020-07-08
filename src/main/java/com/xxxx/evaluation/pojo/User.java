package com.xxxx.evaluation.pojo;

import java.util.HashMap;
import java.util.Map;

public class User {
    private String ip;
    private Map<String ,String> topic = new HashMap<>();
    private Boolean flag=false;

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Map<String, String> getTopic() {
        return topic;
    }

    public void setTopic(Map<String, String> topic) {
        this.topic = topic;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "User{" +
                "ip=" + ip +
                ", topic=" + topic +
                ", flag=" + flag +
                '}';
    }
}
