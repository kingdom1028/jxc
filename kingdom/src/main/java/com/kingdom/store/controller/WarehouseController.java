package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 公告
 * @author sabrina
 *
 */
@Controller
@RequestMapping("Warehouse")
public class WarehouseController {

	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/List")  
    public ModelAndView list(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("Warehouse/List");  
        return mav;  
    }
	@RequestMapping("/Add")  
    public ModelAndView add(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("Warehouse/Add");  
        return mav;  
    }
	@RequestMapping("/Edit")  
    public ModelAndView edit(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("Warehouse/Edit");  
        return mav;  
    }
	@RequestMapping("/TQRecord")
	@ResponseBody
	public String tQRecord(String cids,String tqtype) {
		return "1";
	}
	@RequestMapping("/Delete")  
	@ResponseBody
    public String delete(String cids){  
        return "";  
    }
}
