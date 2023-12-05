package com.zjf.controller;

import com.zjf.domain.FeiJiLeiXing;
import com.zjf.domain.FeiJiXiangQing;
import com.zjf.entity.PageResult;
import com.zjf.entity.Result;
import com.zjf.service.FeiJiLeiXingService;
import com.zjf.service.FeiJiXiangQingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    @Autowired(required = false)
    private FeiJiLeiXingService feiJiLeiXingService;

    @Autowired(required = false)
    private FeiJiXiangQingService feiJiXiangQingService;

    // 分页查询飞机类型
    @RequestMapping("/selectFeiJiLeiXing")
    public ModelAndView selectFeiJiLeiXing(Integer pageNum, Integer pageSize, HttpServletRequest request) {
        if (pageNum == null) pageNum = 1;
        if (pageSize == null) pageSize = 10;

        PageResult pageResult = feiJiLeiXingService.selectFeiJiLeiXing(pageNum, pageSize);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijileixing_web");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("gourl", request.getRequestURI());
        return modelAndView;
    }

    // 搜索飞机类型,模糊查询
    @RequestMapping("/searchFeiJiLeiXing")
    public ModelAndView searchFeiJiLeiXing(FeiJiLeiXing searchCriteria, Integer pageNum, Integer pageSize, HttpServletRequest request) {
        if (pageNum == null) pageNum = 1;
        if (pageSize == null) pageSize = 10;

        PageResult pageResult = feiJiLeiXingService.searchFeiJiLeiXing(searchCriteria, pageNum, pageSize);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijileixing_web");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("search", searchCriteria);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("gourl", request.getRequestURI());
        return modelAndView;
    }
    // 根据ID查询飞机类型
    @ResponseBody
    @RequestMapping("/findById")
    public Result<FeiJiLeiXing> findById(String id) {
        try {
            FeiJiLeiXing feiJiLeiXing = feiJiLeiXingService.findById(id);
            if (feiJiLeiXing == null) {
                return new Result<>(false, "查询失败！");
            }
            return new Result<>(true, "查询成功", feiJiLeiXing);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(false, "查询失败！");
        }
    }

    // 添加飞机类型
    @ResponseBody
    @RequestMapping("/addFeiJiLeiXing")
    public Result addFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing) {
        try {
            Integer count = feiJiLeiXingService.addFeiJiLeiXing(feiJiLeiXing);
            if (count != 1) {
                return new Result(false, "添加失败！");
            }
            return new Result(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "添加失败！");
        }
    }

    // 编辑飞机类型
    @ResponseBody
    @RequestMapping("/editFeiJiLeiXing")
    public Result editFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing) {
        try {
            Integer count = feiJiLeiXingService.editFeiJiLeiXing(feiJiLeiXing);
            if (count != 1) {
                return new Result(false, "编辑失败！");
            }
            return new Result(true, "编辑成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "编辑失败！");
        }
    }

    // 删除飞机类型
    @ResponseBody
    @RequestMapping("/deleteFeiJiLeiXing")
    public Result deleteFeiJiLeiXing(String id) {
        try {
            Integer count = feiJiLeiXingService.deleteFeiJiLeiXing(id);
            if (count != 1) {
                return new Result(false, "删除失败！");
            }
            return new Result(true, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除失败！");
        }
    }

    // 分页查询飞机详情
    @RequestMapping("/selectFeiJiXiangQing")
    public ModelAndView selectFeiJiXiangQing(Integer pageNum, Integer pageSize, HttpServletRequest request) {
        if (pageNum == null) pageNum = 1;
        if (pageSize == null) pageSize = 10;

        PageResult pageResult = feiJiXiangQingService.selectFeiJiXiangQing(pageNum, pageSize);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijixiangqing_web");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("gourl", request.getRequestURI());
        return modelAndView;
    }

    // 搜索飞机详情,模糊查询
    @RequestMapping("/searchFeiJiXiangQing")
    public ModelAndView searchFeiJiXiangQing(FeiJiXiangQing searchCriteria, Integer pageNum, Integer pageSize, HttpServletRequest request) {
        if (pageNum == null) pageNum = 1;
        if (pageSize == null) pageSize = 10;

        PageResult pageResult = feiJiXiangQingService.searchFeiJiXiangQing(searchCriteria, pageNum, pageSize);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijixiangqing_web");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("search", searchCriteria);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("gourl", request.getRequestURI());
        return modelAndView;
    }

    // 根据ID查询飞机详情
    @ResponseBody
    @RequestMapping("/findXiangQingById")
    public Result<FeiJiXiangQing> findXiangQingById(String id) {
        try {
            FeiJiXiangQing feiJiXiangQing = feiJiXiangQingService.findById(id);
            if (feiJiXiangQing == null) {
                return new Result<>(false, "查询失败！");
            }
            return new Result<>(true, "查询成功", feiJiXiangQing);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(false, "查询失败！");
        }
    }

    // 添加飞机详情
    @ResponseBody
    @RequestMapping("/addFeiJiXiangQing")
    public Result addFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing) {
        try {
            Integer count = feiJiXiangQingService.addFeiJiXiangQing(feiJiXiangQing);
            if (count != 1) {
                return new Result(false, "添加失败！");
            }
            return new Result(true, "添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "添加失败！");
        }
    }

    // 编辑飞机详情
    @ResponseBody
    @RequestMapping("/editFeiJiXiangQing")
    public Result editFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing) {
        try {
            Integer count = feiJiXiangQingService.editFeiJiXiangQing(feiJiXiangQing);
            if (count != 1) {
                return new Result(false, "编辑失败！");
            }
            return new Result(true, "编辑成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "编辑失败！");
        }
    }

    // 删除飞机详情
    @ResponseBody
    @RequestMapping("/deleteFeiJiXiangQing")
    public Result deleteFeiJiXiangQing(String id) {
        try {
            Integer count = feiJiXiangQingService.deleteFeiJiXiangQing(id);
            if (count != 1) {
                return new Result(false, "删除失败！");
            }
            return new Result(true, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除失败！");
        }
    }

    // 主页飞机展示
    @RequestMapping("/feijimainpage")
    public ModelAndView feijiMainPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijimain_web");
        return modelAndView;
    }

}