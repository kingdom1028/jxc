package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 客户
 * @author sabrina
 *
 */
@Controller
@RequestMapping("ClientInfo")
public class ClientInfoController {

	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/List")  
    public ModelAndView list(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ClientInfo/List");  
        return mav;  
    }
	@RequestMapping("/Delete")
	@ResponseBody
	public String delete(String cids) {
		return "1";
	}
	@RequestMapping("/Export")  
    public ModelAndView export(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ClientInfo/List");  
        return mav;  
    }
	@RequestMapping("/ExportTemplet")  
    public ModelAndView exportTemplet(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ClientInfo/List");  
        return mav;  
    }
	@RequestMapping("/Import")  
    public ModelAndView importClinet(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ClientInfo/List");  
        return mav;  
    }
	
	
}
