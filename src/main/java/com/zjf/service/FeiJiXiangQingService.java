package com.zjf.service;

import com.zjf.domain.FeiJiXiangQing;
import com.zjf.entity.PageResult;

public interface FeiJiXiangQingService {
    PageResult selectFeiJiXiangQing(Integer pageNum, Integer pageSize);
    FeiJiXiangQing findById(String id);
    Integer addFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing);
    Integer editFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing);
    Integer deleteFeiJiXiangQing(String id);
    PageResult searchFeiJiXiangQing(FeiJiXiangQing searchCriteria, Integer pageNum, Integer pageSize);
}
