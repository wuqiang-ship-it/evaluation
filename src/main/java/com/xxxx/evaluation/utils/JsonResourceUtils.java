package com.xxxx.evaluation.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xxxx.evaluation.pojo.Table;
import com.xxxx.evaluation.pojo.Teacher;
import com.xxxx.evaluation.pojo.User;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringEscapeUtils;

import java.io.*;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

public class JsonResourceUtils {
    private JsonResourceUtils() {

    }
    public static JSONObject getJsonObject(String filePath){
        JSONObject jsonObject=new JSONObject();
        Resource resource = new Resource();
        String fileName = filePath.replace("file:/","");
        System.out.println(fileName);
        InputStream inputStream =new Resource().getClass().getResourceAsStream(filePath);
        System.out.println(new Resource().getClass().getResourceAsStream(fileName));
        try {
                Reader  inputStreamReader= new InputStreamReader( inputStream,"UTF-8");
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
                String content = new String();
                   String s;
                   while((s = bufferedReader.readLine())!=null){
                       content += s;
                   }
                jsonObject = JSON.parseObject(content);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return jsonObject;

    }

    //filename 为文件名字 如 “/json/app_version_info.json”
    public static JSONArray getJsonObjFromResource(String filePath) {
        JSONArray jsonArray = null;
        Resource resource = new Resource();
        String  fileName = filePath.replace("file:/","");
        InputStream inputStream =new Resource().getClass().getResourceAsStream(fileName);
        System.out.println(new Resource().getClass().getResourceAsStream(fileName));
        try {
            Reader inputStreamReader= new InputStreamReader(inputStream,"UTF-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            String content = new String();
            String s;
            while((s = bufferedReader.readLine())!=null){
                content += s;
            }
                jsonArray = JSON.parseArray(content);


        } catch (Exception e) {
            e.printStackTrace();

        }
        return jsonArray;
    }

    public static boolean writeAppendFile(String filePath,User user,JSONArray jsonArray) {
        Resource resource = new Resource();

        filePath = filePath.replace("file:/","");

        InputStream inputStream =new Resource().getClass().getResourceAsStream(filePath);

        try {
            System.out.println(inputStream);
            OutputStream outputStream = new DataOutputStream(new FileOutputStream(String.valueOf(inputStream)));
            OutputStreamWriter writer = new OutputStreamWriter(outputStream,"utf-8");
            System.out.println(outputStream);
            BufferedWriter bw = new BufferedWriter(writer);
            jsonArray.add(user);
            System.out.println("StudentArray---"+jsonArray);
            bw.write(jsonArray.toString());
            bw.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return false;
    }
    public static boolean updateFile(String filePath,List list){
        Resource resource = new Resource();
        filePath = filePath.replace("file:/","");
        InputStream inputStream =new Resource().getClass().getResourceAsStream(filePath);
        try {
            OutputStreamWriter writer = new OutputStreamWriter(parse(inputStream),"utf-8");
            BufferedWriter bw = new BufferedWriter(writer);
            JSONArray array= JSONArray.parseArray(JSON.toJSONString(list));
            bw.write(array.toString());
            bw.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {

        }
        return false;
    }
    public static int out(JSONArray jsonArray,Integer g,int k){
        int num=0;
        for (int i=0;i<jsonArray.size();i++){
            Map<String,Object> map = (Map<String, Object>) jsonArray.getJSONObject(i).get("topic");
            String str= (String) map.get(String.valueOf(k));
            if (str!=null && (!str.isEmpty()) && Integer.parseInt(str)==g){
                num++;
            }

        }
        return num;
    }
    public static JSONArray outLeving(JSONArray jsonArray){
        JSONArray jsonArray1 = new JSONArray();
        for (int i=0;i<jsonArray.size();i++){
            Map<String,Object> map = (Map<String, Object>) jsonArray.getJSONObject(i).get("topic");
            jsonArray1.add(map.get("leving"));
        }
        return jsonArray1;
    }

    public static JSONObject writeNewWord(Teacher teacher,JSONArray jsonArray){
//            JSONArray jsonArray = getJsonObjFromResource("/static/AdConfig.json");
            List list=new ArrayList();
            String[] stat={"讲课老师是否有激情,能否传递正能量?","你是否充分掌握授课目标?","讲师讲解重点问题是否突出?","讲师是否能用简单易懂的语言讲解知识点?","讲师授课逻辑是否清晰?","讲师是否具有案例分析能力,引导学生参与?","讲师授课速度是否得当?","教师内容是否准备充分?","课上是否有充分的练习时间?","课下是否有充足的时间联系?","讲师对待学员是否礼貌,有亲和力?","讲师能否对学员做到有效监督?","请教老师问题是否能得到耐心,有效解答?","讲师解决问题是否举一反三,做到有效拓展?","讲师能否做到针对一些共性问题统一讲解?","讲师能否做到认真负责,关注学生?","课堂笔记是否及时整理并发送给你?","讲师是否仪容端庄,举止大方?","讲师能否做到不经常串课旷课?","你是否喜欢这位老师?"};

            for (int i=0;i<20;i++){
                Table table = new Table();
                table.setId(i+1);
                table.setName(stat[i]);
            table.setFive(out(jsonArray,5,i+1));
            table.setFour(out(jsonArray,4,i+1));
            table.setThree(out(jsonArray,3,i+1));
            table.setTwo(out(jsonArray,2,i+1));
            table.setOne(out(jsonArray,1,i+1));
            float num=(float)(Math.round(table.getFive()*5+table.getFour()*4+table.getThree()*3+table.getTwo()*2+table.getOne())*100/jsonArray.size())/100;//如果要求精确4位就*10000然后/10000
            table.setAvg(num);
            list.add(table);
        }

        Map<String,Object> hashmap =new HashMap<>();
        Map<String,Object> map =new HashMap<>();
        JSONArray array = JSONArray.parseArray(JSONObject.toJSONString(list));
        map.put("status",200);
        map.put("message","");
        map.put("total",jsonArray.size());
        map.put("name",teacher.getName());
        map.put("CreateTime",teacher.getCreateTime());
        map.put("grade",teacher.getGrade());
        map.put("major",teacher.getMajor());
        hashmap.put("leving",outLeving(jsonArray));
        hashmap.put("item",array);
        map.put("rows",hashmap);
        String json=JSON.toJSONString(map);
        System.out.println(json);
        return (JSONObject) JSONObject.parse(json);
    }
    //inputStream转outputStream
    public static ByteArrayOutputStream parse(InputStream in) throws Exception
    {
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        int ch;
        while ((ch = in.read()) != -1) {
            swapStream.write(ch);
        }
        return swapStream;
    }
}
