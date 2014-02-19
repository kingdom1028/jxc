package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 公告
 * @author sabrina
 *
 */
@Controller
@RequestMapping("QueryProductSN")
public class QueryProductSNController {

	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/List")  
    public ModelAndView list(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("HomePage/OverEmployeeTip");  
        return mav;  
    } 
}