package com.example.service;

/**
 * @author YuanQian
 */
public interface UserService {

    /**
     * 判断用户名和密码是否正确
     *
     * @param userName 用户名
     * @param password 密码
     * @return 是否正确
     */
    boolean login(String userName, String password);
}
