package com.xxxx.evaluation.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xxxx.evaluation.pojo.User;
import org.apache.commons.io.FileUtils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class JsonResourceUtils {
    private JsonResourceUtils() {

    }

    //filename 为文件名字 如 “/json/app_version_info.json”
    public static JSONArray getJsonObjFromResource(String filename) {
        JSONArray jsonArray = null;
        URL l1 =
                Thread.currentThread().
                        getContextClassLoader().
                        getResource(filename);

        String path=String.valueOf(l1);
        //去除file:/的前缀
        path = path.replace("file:/","");

        try {
            File file = new File(path);
            if (file.exists()) {
                String content = FileUtils.readFileToString(file, "UTF-8");
                jsonArray = JSON.parseArray(content);

            }else {
                System.out.println("空");
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return jsonArray;
    }

    public static void main(String[] args) {
//        System.out.println(getJsonObjFromResource("static/AdConfig.json"));
        User user = new User();
        user.setIp("119.168.168.257");
        user.setFlag(true);
        Map<String, String> map = new HashMap<>();
        map.put("1","A");
        map.put("2","B");
        map.put("3","C");
        user.setTopic(map);
        //1.1 将User对象转成json
        Object obj = JSONArray.toJSON(user);
        String json = obj.toString();
        System.out.println("将User对象转成json:" + json);
        JSONArray jsonArray = getJsonObjFromResource("static/AdConfig.json");
        System.out.println(jsonArray);
        System.out.println(writeAppendFile("static/AdConfig.json",user,jsonArray));
    }

    public static boolean writeAppendFile(String filePath,User user,JSONArray jsonArray) {
        URL l1 =Thread.currentThread().
                getContextClassLoader().
                getResource(filePath);

        String path=String.valueOf(l1);
        //去除file:/的前缀
        path = path.replace("file:/","");

        try {
            FileWriter writer = new FileWriter(path);
            BufferedWriter bw = new BufferedWriter(writer);
            jsonArray.add(user);
            System.out.println(jsonArray);
            bw.write(jsonArray.toString());
            bw.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }finally {

        }
        return false;
    }
}
