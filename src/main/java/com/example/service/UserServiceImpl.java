package com.example.service;

import com.example.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author YuanQian
 */
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean login(String userName, String password) {
        return password.equals(userMapper.passwordByUserName(userName));
    }


}
