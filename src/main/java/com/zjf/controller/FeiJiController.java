package com.zjf.controller;

import com.zjf.entity.PageResult;
import com.zjf.service.FeiJiLeiXingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 名称:FeiJiController
 * 描述:
 *
 * @version 1.0
 * @author:zjf
 * @datatime:2023-12-04 10:01
 */
@Controller
@RequestMapping("/feiji")
public class FeiJiController {
    //注入feijileixingservice对象
    @Autowired(required = false)
    private FeiJiLeiXingService feiJiLeiXingService;

    @RequestMapping("/feijileixing")
    public ModelAndView selectFeiJiLeiXing(){
        int pageNum = 1;
        int pageSize = 5;
        PageResult pageResult =
                feiJiLeiXingService.selectFeiJiLeiXing(pageNum,pageSize);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijileixing_web");
        modelAndView.addObject("pageResult",pageResult);
        return modelAndView;
    }
}
