package com.learn.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.learn.bean.Pager;
import com.learn.form.UserForm;
import com.learn.service.UserSerivce;
/**
 * bootstrap-paginator.js实现ajax分页效果
 * 
 * @author Ben.
 *
 */
@Controller
@RequestMapping("/bootstrap-paginator")
public class BootstrapPaginatorController {
    @Resource
    private UserSerivce userSerivce;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(UserForm userForm, Pager pager, ModelMap modelMap, HttpServletRequest request) {
        return "bootstrap-paginator/index";
    }
    
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(UserForm userForm, Pager pager, ModelMap modelMap, HttpServletRequest request) {
        pager = this.userSerivce.findList(userForm, pager);
        return "bootstrap-paginator/index";
    }
    
}
