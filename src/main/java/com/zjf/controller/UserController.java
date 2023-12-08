package com.zjf.controller;

import com.zjf.domain.User;
import com.zjf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 名称:UserController
 * 描述:
 *
 * @version 1.0
 * @author:zjf
 * @datatime:2023-12-03 12:17
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request){
        try {
            User u=userService.login(user);
            if(u!=null){
                request.getSession().setAttribute("USER_SESSION",u);
                 return "redirect:/admin/main.jsp";
            }
            request.setAttribute("msg","用户名或密码错误");
            return  "forward:/admin/login.jsp";
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("msg","系统错误");
            return  "forward:/admin/login.jsp";
        }
    }

    @RequestMapping("/logout")
    public String logout( HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            //销毁Session
            session.invalidate();
            return  "forward:/admin/login.jsp";
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("msg","系统错误");
            return  "forward:/admin/login.jsp";
        }
    }
}
