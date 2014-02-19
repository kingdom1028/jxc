package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("SysConfig")
public class SysConfigController {

	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/Config")  
    public ModelAndView config(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("SysConfig/Config");  
        return mav;  
    } 
}
