package com.kingdom.store.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/LoginPhone")
public class LoginController {
	@RequestMapping("LoginPhone")  
    public ModelAndView LoginPhone(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
		HttpSession session=request.getSession();
		if(session.getAttribute("user")!=null){
			 ModelAndView mav = new ModelAndView("HomePage/Welcome");  
		        return mav;  
		}else{
			
			Enumeration<String> em=request.getParameterNames();
			while(em.hasMoreElements()){
				System.out.println(em.nextElement());
			}
			session.setAttribute("user","dsdd");
			ModelAndView mav = new ModelAndView("login");  
			return mav;  
		}
    }  
	@RequestMapping(value="/hello",method=RequestMethod.GET)
	public ModelAndView hello(HttpServletRequest request){
		String  s = request.getParameter("oo");
		System.out.println("-----------------------:"+s);
		String message = "Hello, Spring 3.0! 你好！";
		Map <String, String> mymap = new HashMap(); 
		mymap.put("a1", "ab11");
		mymap.put("a2", "ab22");
		//return new ModelAndView("hello", "message", message);
		return new ModelAndView("hello",mymap);
	}
}
