package com.zjf.dao;

import com.github.pagehelper.Page;
import com.zjf.domain.FeiJiXiangQing;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface FeiJiXiangQingMapper {

    @Select("SELECT * FROM feijixiangqing")
    @Results(id = "feijixiangqingMap", value = {
            @Result(id = true, column = "xiangqingid", property = "xiangqingid"),
            @Result(column = "leixingid", property = "leixingid"),
            @Result(column = "mingcheng", property = "mingcheng"),
            @Result(column = "jianjie", property = "jianjie"),
            @Result(column = "tupian", property = "tupian"),
            @Result(column = "zhizaoshang", property = "zhizaoshang"),
            @Result(column = "shiyongnianxian", property = "shiyongnianxian")
    })
    Page<FeiJiXiangQing> selectFeiJiXiangQing();

    @Select("SELECT * FROM feijixiangqing WHERE xiangqingid = #{id}")
    @ResultMap("feijixiangqingMap")
    FeiJiXiangQing findById(String id);

    @Insert("INSERT INTO feijixiangqing (leixingid, mingcheng, jianjie, tupian, zhizaoshang, shiyongnianxian) VALUES (#{leixingid}, #{mingcheng}, #{jianjie}, #{tupian}, #{zhizaoshang}, #{shiyongnianxian})")
    @Options(useGeneratedKeys = true, keyProperty = "xiangqingid")
    int addFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing);

    @Update("UPDATE feijixiangqing SET leixingid = #{leixingid}, mingcheng = #{mingcheng}, jianjie = #{jianjie}, tupian = #{tupian}, zhizaoshang = #{zhizaoshang}, shiyongnianxian = #{shiyongnianxian} WHERE xiangqingid = #{xiangqingid}")
    int editFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing);

    @Delete("DELETE FROM feijixiangqing WHERE xiangqingid = #{id}")
    int deleteFeiJiXiangQing(String id);

    @Select("<script>" +
            "SELECT * FROM feijixiangqing" +
            "<where>" +
            "<if test='mingcheng != null and mingcheng != \"\"'>" +
            "AND mingcheng LIKE CONCAT('%', #{mingcheng}, '%')" +
            "</if>" +
            "<if test='jianjie != null and jianjie != \"\"'>" +
            "AND jianjie LIKE CONCAT('%', #{jianjie}, '%')" +
            "</if>" +
            "</where>" +
            "</script>")
    @ResultMap("feijixiangqingMap")
    Page<FeiJiXiangQing> searchFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing);

    @Select("SELECT * FROM feijixiangqing")
    List<FeiJiXiangQing> selectAll();

}
