package com.xxxx.evaluation.pojo;

import com.xxxx.evaluation.enums.BaseResultEnum;

import java.io.Serializable;
import java.util.List;

/**
 * 公共保存状态返回对象
 */
public class BaseResult implements Serializable {
    // 状态编码
    private Integer code;
    // 状态描述
    private String message;
    // 分页对象(商品列表需要-pom.xml添加依赖)
    private List<Teacher> list;

    public List<Teacher> getList() {
        return list;
    }

    public void setList(List<Teacher> list) {
        this.list = list;
    }

    //成功返回的对象
    public static BaseResult success() {
        BaseResult result = new BaseResult();
        result.setCode(BaseResultEnum.SUCCESS.getCode());
        result.setMessage(BaseResultEnum.SUCCESS.getMessage());
        return result;
    }


    //失败返回的对象
    public static BaseResult error() {
        BaseResult result = new BaseResult();
        result.setCode(BaseResultEnum.ERROR.getCode());
        result.setMessage(BaseResultEnum.ERROR.getMessage());
        return result;
    }

    public BaseResult(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public BaseResult() {
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "BaseResult [code=" + code + ", message=" + message + "]";
    }
}
