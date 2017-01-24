package com.learn.controller;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * index重定向
 * 
 * @author Ben.
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {
    @RequestMapping("/index")
    public String index(HttpServletResponse response) throws IOException {
        return "redirect:/index.jsp";
    }
}
