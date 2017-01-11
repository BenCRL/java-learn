package com.learn.controller;
import java.awt.print.Paper;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * jquery.pager.js实现分页效果
 * @author Ben.
 *
 */
@Controller
@RequestMapping("/jqueryPager")
public class JqueryPagerController {
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Paper paper, ModelMap modelMap, HttpServletRequest request) {
        return "jqueryPager/index";
    }
}
