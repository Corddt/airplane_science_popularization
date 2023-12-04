package com.zjf.dao;

import com.github.pagehelper.Page;
import com.zjf.domain.FeiJiLeiXing;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface FeiJiLeiXingMapper {
    @Select("select * from feijileixing")
    @Results(id = "feijileixingMap",value = {
            //id字段默认为false，表示不是主键
            //column表示数据库表字段，property表示实体类属性名。
            @Result(id = true,column = "leixingid",property = "leixingid"),
            @Result(column = "leixingmingcheng",property = "leixingmingcheng"),
            @Result(column = "miaoshu",property = "miaoshu")
    })
    Page<FeiJiLeiXing> selectFeiJiLeiXing();
}
