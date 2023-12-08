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
    @Autowired(required = false)
    private UserMapper userMapper;
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }
}

