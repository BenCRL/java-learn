package com.learn.bean;
import java.io.Serializable;
/**
 * 
 * JSON模型
 * 
 * 用户后台向前台返回的JSON对象
 * 
 * @author Ben.
 * 
 */
@SuppressWarnings("serial")
public class Json implements Serializable {
    private boolean success = true; // 状态标识
    private String  msg     = "";   // 返回信息
    private Object  obj     = null; // 返回对象

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
