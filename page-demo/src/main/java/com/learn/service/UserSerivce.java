package com.learn.service;
import com.learn.bean.BootstrapTable;
import com.learn.bean.Pager;
import com.learn.form.UserForm;
public interface UserSerivce {
    /**
     * 查询用户信息
     * @param userForm 用户信息 - 表单基础数据
     * @param pager 分页信息
     * @return
     */
    Pager findList(UserForm userForm, Pager pager);

    /**
     * 查询用户信息
     * @param userForm 用户信息 - 表单基础数据
     * @param pager 分页信息
     * @return
     */
    BootstrapTable bootstrapTable(UserForm userForm, Pager pager);
}
