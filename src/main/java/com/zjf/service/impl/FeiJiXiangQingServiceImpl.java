package com.zjf.service.impl;

/**
 * 名称:FeiJiXiangQingServiceImpl
 * 描述:
 *
 * @version 1.0
 * @author:zjf
 * @datatime:2023-12-05 12:53
 */


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zjf.dao.FeiJiXiangQingMapper;
import com.zjf.domain.FeiJiXiangQing;
import com.zjf.entity.PageResult;
import com.zjf.service.FeiJiXiangQingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FeiJiXiangQingServiceImpl implements FeiJiXiangQingService {
    @Autowired(required = false)
    private FeiJiXiangQingMapper feiJiXiangQingMapper;

    @Override
    public PageResult selectFeiJiXiangQing(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Page<FeiJiXiangQing> page = feiJiXiangQingMapper.selectFeiJiXiangQing();
        return new PageResult(page.getTotal(), page.getResult());
    }

    @Override
    public FeiJiXiangQing findById(String id) {
        return feiJiXiangQingMapper.findById(id);
    }

    @Override
    public Integer addFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing) {
        return feiJiXiangQingMapper.addFeiJiXiangQing(feiJiXiangQing);
    }

    @Override
    public Integer editFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing) {
        return feiJiXiangQingMapper.editFeiJiXiangQing(feiJiXiangQing);
    }

    @Override
    public Integer deleteFeiJiXiangQing(String id) {
        return feiJiXiangQingMapper.deleteFeiJiXiangQing(id);
    }

    @Override
    public PageResult searchFeiJiXiangQing(FeiJiXiangQing searchCriteria, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Page<FeiJiXiangQing> page = feiJiXiangQingMapper.searchFeiJiXiangQing(searchCriteria);
        return new PageResult(page.getTotal(), page.getResult());
    }
}
