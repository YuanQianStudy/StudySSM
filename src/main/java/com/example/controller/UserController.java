package com.example.controller;

import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author YuanQian
 */
@Controller
public class UserController {


    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用于处理ajax发来的异步登录请求
     *
     * @param userName 用户名
     * @param password 密码
     * @return 返回值以响应体的方式发生回前端页面
     */
    @RequestMapping("/ajaxLogin")
    @ResponseBody
    public String ajaxLogin(String userName, String password, HttpSession session) {
        /*判断用户名是否正确
         * 正确返回“登录成功”
         * 错误返回“err”*/
        if (userService.login(userName, password)) {
            session.setAttribute("user", userName);
            return "登录成功";
        } else {
            return "err";
        }
    }

    /**
     * 退出登录
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
        //从session中移除用户信息
        session.removeAttribute("user");
        //将注销信息返回到前端页面
        model.addAttribute("err", "您已成功注销");
        return "login";
    }
}
