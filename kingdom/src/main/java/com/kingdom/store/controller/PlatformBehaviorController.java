package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("behavior")
public class PlatformBehaviorController {

	/**
	 * 记录访问情况
	 * @param request
	 * @return
	 */
	@RequestMapping("log")
	@ResponseBody
	public String log(String control,String action,String url,String source) {
		System.out.println(control);
		System.out.println(action);
		System.out.println(url);
		System.out.println(source);
		return "1";
	}
}
