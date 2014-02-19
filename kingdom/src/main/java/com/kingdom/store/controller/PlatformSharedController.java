package com.kingdom.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kingdom.store.pageModel.Client;
import com.kingdom.store.pageModel.Employee;

/**
 * 公告
 * @author sabrina
 *
 */
@Controller
@RequestMapping("shared")
public class PlatformSharedController {

	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryproductd")  
    public ModelAndView queryproductd(String WarehouseId){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("HomePage/OverEmployeeTip");  
        return mav;  
    }
	@RequestMapping("/queryproduct")
	@ResponseBody
	public String queryproduct(String WarehouseId) {
		return "1";
	}
	@RequestMapping("/GetProductStock")
	@ResponseBody
	public String getProductStock(String productId,String WarehouseId) {
		return "1";
	}
	@RequestMapping("/queryemployee")
	@ResponseBody
	public Employee queryemployee(String key) {
		Employee e=new Employee();
				
		return e;
	}
	@RequestMapping("/queryclient")
	@ResponseBody
	public Client queryclient(String key) {
		Client client=new Client();
				
		return client;
	}
	
}
