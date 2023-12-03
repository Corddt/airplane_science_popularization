package com.zjf.service.impl;

import com.zjf.dao.UserMapper;
import com.zjf.domain.User;
import com.zjf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

/**
 * 名称:UserServiceImpl
 * 描述:userservice的实现类
 *
 * @version 1.0
 * @author:zjf
 * @datatime:2023-12-03 15:12
 */
@Service
@Primary
public class UserServiceImpl  implements UserService {
    //注入userMapper
    @Autowired(required = false)
    private UserMapper userMapper;
    //通过User的用户账号和用户密码查询用户信息
    @Override
    public User login(User user) {
        System.out.println("这是user实现类的登录操作");
        return userMapper.login(user);
    }
}

