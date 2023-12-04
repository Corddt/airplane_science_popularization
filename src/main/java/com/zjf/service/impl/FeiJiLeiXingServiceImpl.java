package com.zjf.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zjf.dao.FeiJiLeiXingMapper;
import com.zjf.domain.FeiJiLeiXing;
import com.zjf.entity.PageResult;
import com.zjf.service.FeiJiLeiXingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 名称:FeiJiLeiXingServiceImpl
 * 描述:
 *
 * @version 1.0
 * @author:zjf
 * @datatime:2023-12-04 09:56
 */
@Service
@Transactional
public class FeiJiLeiXingServiceImpl implements FeiJiLeiXingService {
    @Autowired(required = false)
    private FeiJiLeiXingMapper feiJiLeiXingMapper;

    @Override
    public PageResult selectFeiJiLeiXing(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Page<FeiJiLeiXing> page = feiJiLeiXingMapper.selectFeiJiLeiXing();
        return new PageResult(page.getTotal(), page.getResult());
    }

    @Override
    public FeiJiLeiXing findById(String id) {
        return feiJiLeiXingMapper.findById(id);
    }

    @Override
    public Integer addFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing) {
        return feiJiLeiXingMapper.addFeiJiLeiXing(feiJiLeiXing);
    }

    @Override
    public Integer editFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing) {
        return feiJiLeiXingMapper.editFeiJiLeiXing(feiJiLeiXing);
    }

    @Override
    public Integer deleteFeiJiLeiXing(String id) {
        return feiJiLeiXingMapper.deleteFeiJiLeiXing(id);
    }

    @Override
    public PageResult searchFeiJiLeiXing(FeiJiLeiXing searchCriteria, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Page<FeiJiLeiXing> page = feiJiLeiXingMapper.searchFeiJiLeiXing(searchCriteria);
        return new PageResult(page.getTotal(), page.getResult());
    }
}