package com.zjf.service;

import com.zjf.domain.FeiJiLeiXing;
import com.zjf.entity.PageResult;

public interface FeiJiLeiXingService {
    PageResult selectFeiJiLeiXing(Integer pageNum, Integer pageSize);
    FeiJiLeiXing findById(String id);
    Integer addFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing);
    Integer editFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing);
    Integer deleteFeiJiLeiXing(String id);

    PageResult searchFeiJiLeiXing(FeiJiLeiXing searchCriteria, Integer pageNum, Integer pageSize);
}