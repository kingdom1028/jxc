package com.kingdom.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kingdom.store.pageModel.DataGrid;
import com.kingdom.store.pageModel.Online;
import com.kingdom.store.service.OnlineService;


@RequestMapping("/onlineController")
@Controller
public class OnlineController {

	private OnlineService onlineService;

	public OnlineService getOnlineService() {
		return onlineService;
	}

	@Autowired
	public void setOnlineService(OnlineService onlineService) {
		this.onlineService = onlineService;
	}

	@RequestMapping("/datagrid")
	@ResponseBody
	public DataGrid datagrid(Online online) {
		return onlineService.datagrid(online);
	}
	@RequestMapping("/datagrid2")
	@ResponseBody
	public DataGrid datagrid2(Online online) {
		return onlineService.datagrid(online);
	}
	@RequestMapping("LoginPhone")  
    public ModelAndView LoginPhone(){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("login");  
        return mav;  
    }  
}
