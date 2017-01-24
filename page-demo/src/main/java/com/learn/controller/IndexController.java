package com.learn.controller;
import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.learn.service.UserSerivce;
/**
 * index重定向
 * 
 * @author Ben.
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {
    @Resource
    private UserSerivce userSerivce;

    @RequestMapping("/index")
    public String index(HttpServletResponse response) throws IOException {
        return "redirect:/index.jsp";
    }
}
