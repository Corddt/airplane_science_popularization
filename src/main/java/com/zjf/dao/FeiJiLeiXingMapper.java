package com.zjf.dao;

import com.github.pagehelper.Page;
import com.zjf.domain.FeiJiLeiXing;
import org.apache.ibatis.annotations.*;

public interface FeiJiLeiXingMapper {

    @Select("SELECT * FROM feijileixing")
    @Results(id = "feijileixingMap", value = {
            @Result(id = true, column = "leixingid", property = "leixingid"),
            @Result(column = "leixingmingcheng", property = "leixingmingcheng"),
            @Result(column = "miaoshu", property = "miaoshu")
    })
    Page<FeiJiLeiXing> selectFeiJiLeiXing();

    @Select("SELECT * FROM feijileixing WHERE leixingid = #{id}")
    @ResultMap("feijileixingMap")
    FeiJiLeiXing findById(String id);

    @Insert("INSERT INTO feijileixing (leixingmingcheng, miaoshu) VALUES (#{leixingmingcheng}, #{miaoshu})")
    @Options(useGeneratedKeys = true, keyProperty = "leixingid")
    int addFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing);

    @Update("UPDATE feijileixing SET leixingmingcheng = #{leixingmingcheng}, miaoshu = #{miaoshu} WHERE leixingid = #{leixingid}")
    int editFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing);

    @Delete("DELETE FROM feijileixing WHERE leixingid = #{id}")
    int deleteFeiJiLeiXing(String id);

    @Select("<script>" +
            "SELECT * FROM feijileixing" +
            "<where>" +
            "<if test='leixingmingcheng != null and leixingmingcheng != \"\"'>" +
            "AND leixingmingcheng LIKE CONCAT('%', #{leixingmingcheng}, '%')" +
            "</if>" +
            "</where>" +
            "</script>")
    @ResultMap("feijileixingMap")
    Page<FeiJiLeiXing> searchFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing);

}
