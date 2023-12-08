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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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
        if (pageNum == null || pageNum < 1) pageNum = 1;
        if (pageSize == null || pageSize < 1) pageSize = 10;
        PageResult pageResult = feiJiLeiXingService.selectFeiJiLeiXing(pageNum, pageSize);
        long total = pageResult.getTotal(); // 总记录数
        long totalPages = (total + pageSize - 1) / pageSize; // 计算总页数

        // 确保pageNum不大于总页数
        pageNum = Math.toIntExact(Math.min(pageNum, totalPages));

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijileixing_web");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("totalPages", totalPages); // 添加总页数
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

    @RequestMapping("/addFeiJiLeiXing")
    public String addFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing, HttpServletRequest request) {
        try {
            Integer count = feiJiLeiXingService.addFeiJiLeiXing(feiJiLeiXing);
            if (count != 1) {
                request.getSession().setAttribute("message", "添加失败！");
            } else {
                request.getSession().setAttribute("message", "添加成功！");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("message", "添加失败！");
        }
        return "redirect:/feiji/selectFeiJiLeiXing";
    }

    @RequestMapping("/editFeiJiLeiXing")
    public String editFeiJiLeiXing(FeiJiLeiXing feiJiLeiXing, HttpServletRequest request) {
        try {
            Integer count = feiJiLeiXingService.editFeiJiLeiXing(feiJiLeiXing);
            if (count != 1) {
                request.getSession().setAttribute("message", "编辑失败！");
            } else {
                request.getSession().setAttribute("message", "编辑成功！");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("message", "编辑失败！");
        }
        return "redirect:/feiji/selectFeiJiLeiXing";
    }


    // 跳转到添加飞机类型的页面
    @RequestMapping("/addFeiJiLeiXingPage")
    public String addFeiJiLeiXingPage() {
        return "add_feijileixing"; // 跳转到 add_feijileixing.jsp 页面
    }

    // 跳转到编辑飞机类型的页面
    @RequestMapping("/editFeiJiLeiXingPage")
    public ModelAndView editFeiJiLeiXingPage(@RequestParam("leixingid") String leixingid) {
        FeiJiLeiXing feiJiLeiXing = feiJiLeiXingService.findById(leixingid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("FeiJiLeiXing", feiJiLeiXing);
        modelAndView.setViewName("edit_feijileixing"); // 跳转到 edit_feijileixing.jsp 页面
        return modelAndView;
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
        if (pageNum == null || pageNum < 1) pageNum = 1;
        if (pageSize == null || pageSize < 1) pageSize = 10;

        PageResult pageResult = feiJiXiangQingService.selectFeiJiXiangQing(pageNum, pageSize);
        long total = pageResult.getTotal();
        long totalPages = (total + pageSize - 1) / pageSize;


        pageNum = Math.toIntExact(Math.min(pageNum, totalPages));

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("feijixiangqing_web");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("totalPages", totalPages);
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

    //添加飞机详情
    @RequestMapping("/addFeiJiXiangQing")
    public String addFeiJiXiangQing(FeiJiXiangQing feiJiXiangqing, HttpServletRequest request) {
        try {
            Integer count = feiJiXiangQingService.addFeiJiXiangQing(feiJiXiangqing);
            if (count != 1) {
                request.getSession().setAttribute("message", "添加失败！");
            } else {
                request.getSession().setAttribute("message", "添加成功！");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("message", "添加失败！");
        }
        return "redirect:/feiji/selectFeiJiXiangQing";
    }

    // 编辑飞机详情
    @RequestMapping("/editFeiJiXiangQing")
    public String editFeiJiXiangQing(FeiJiXiangQing feiJiXiangQing, HttpServletRequest request) {
        try {
            Integer count = feiJiXiangQingService.editFeiJiXiangQing(feiJiXiangQing);
            if (count != 1) {
                request.getSession().setAttribute("message", "编辑失败！");
            } else {
                request.getSession().setAttribute("message", "编辑成功！");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("message", "编辑失败！");
        }
        return "redirect:/feiji/selectFeiJiXiangQing";
    }

    // 添加飞机详情的页面
    @RequestMapping("/addFeiJiXiangQingPage")
    public ModelAndView addFeiJiXiangQingPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("add_feijixiangqing");
        return modelAndView;
    }

    @RequestMapping("/editFeiJiXiangQingPage")
    public ModelAndView editFeiJiXiangQingPage(@RequestParam("id") String id) {
        FeiJiXiangQing feijixiangqing = feiJiXiangQingService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("FeiJiXiangQing", feijixiangqing);
        modelAndView.setViewName("edit_feijixiangqing");
        return modelAndView;
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

    @RequestMapping("/feijixiangqingList")
    public ModelAndView feijiXiangQingList() {
        List<FeiJiXiangQing> feijixiangqingList = feiJiXiangQingService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("feijixiangqingList", feijixiangqingList);
        modelAndView.setViewName("feijixiangqing_list");
        return modelAndView;
    }

    @RequestMapping("/feijixiangqingDetail")
    public ModelAndView feijiXiangQingDetail(@RequestParam("id") String id) {
        FeiJiXiangQing feijixiangqing = feiJiXiangQingService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("feijixiangqing", feijixiangqing);
        modelAndView.setViewName("feijixiangqing_detail");
        return modelAndView;
    }


}