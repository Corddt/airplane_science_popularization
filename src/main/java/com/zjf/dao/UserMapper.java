package com.zjf.dao;

import com.zjf.domain.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

/**
 * 名称:UserMapper
 * 描述:dao层用户接口
 *
 * @version 1.0
 * @author:zjf
 * @datatime:2023-12-03 15:08
 */
public interface UserMapper{
    @Select("select * from user where user_email=#{email} AND user_password=#{password} AND user_status!='1'")
    @Results(id = "userMap",value = {
            //id字段默认为false，表示不是主键
            //column表示数据库表字段，property表示实体类属性名。
            @Result(id = true,column = "user_id",property = "id"),
            @Result(column = "user_name",property = "name"),
            @Result(column = "user_password",property = "password"),
            @Result(column = "user_email",property = "email"),
            @Result(column = "user_role",property = "role"),
            @Result(column = "user_status",property = "status")
    })
    User login(User user);
}

