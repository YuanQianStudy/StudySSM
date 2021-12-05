package com.example.dao;

/**
 * @author YuanQian
 */
public interface UserMapper {

    /**
     * 根据用户名查询密码
     *
     * @param userName 用户名
     * @return 密码
     */
    String passwordByUserName(String userName);
}
