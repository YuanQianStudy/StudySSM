package com.example.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 这是一个拦截器类，拦截所有地址为/Book开头的请求
 *
 * @author YuanQian
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * preHandle执行在所拦截的方法之前，在每次访问各种图书功能时，都会先执行此方法
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("user");
        /*判定session中是否有用户信息*/
        /*如果没有用户信息则跳转到登录界面，并提示当前未登录*/
        if (user == null) {
            request.setAttribute("err", "当前未登录");
            request.getRequestDispatcher("/").forward(request, response);
            return false;
        }
        /*如果有用户信息则放行，正常执行原请求*/
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
