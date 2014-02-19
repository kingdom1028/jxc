package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kingdom.store.pageModel.Online;
/**
 * 新手上路
 * @author sabrina
 *
 */
@Controller
@RequestMapping("NewStart")
public class NewStartController {

	@ResponseBody
	@RequestMapping("/GetSOBState")
	public String GetSOBState(Online online) {
		return "1";
	}
	/**
	 * 新手首页，基本的引导页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/BasicInformation")
	public ModelAndView basicInformation(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("newStart/basicInformation");  
	     return mav;  
	}
	/**
	 * 新手首页，基本的引导页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/BeginAccount")
	public ModelAndView beginAccount(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("newStart/beginAccount");  
	     return mav;  
	}
	/**
	 * 新手首页，基本的引导页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/OpenAccount")
	public ModelAndView openAccount(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("newStart/openAccount");  
	     return mav;  
	}
	/**
	 * 新手首页，基本的引导页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/BuildDocument")
	public ModelAndView buildDocument(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("newStart/buildDocument");  
	     return mav;  
	}
	/**
	 * 新手首页，基本的引导页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/CheckAccount")
	public ModelAndView checkAccount(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("newStart/checkAccount");  
	     return mav;  
	}
	/**
	 * 新手首页，基本的引导页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/Analyse")
	public ModelAndView analyse(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("newStart/analyse");  
	     return mav;  
	}
	
	
}
