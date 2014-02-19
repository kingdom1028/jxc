package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kingdom.store.pageModel.ReturnMessage;
import com.kingdom.store.service.SaleService;

/**
 * 公告
 * @author sabrina
 *
 */
@Controller
@RequestMapping("Sale")
public class SaleController {
	private SaleService saleService;
	
	public SaleService getSaleService() {
		return saleService;
	}
	@Autowired
	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}
	/**
	 * 销售历史
	 * @param IsPrint
	 * @param SaleId
	 * @param IsToList
	 * @return
	 */
	@RequestMapping("/List")  
    public ModelAndView list(String IsPrint,String SaleId,String IsToList){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("Sale/List");  
        return mav;  
    }
	/**
	 * 
	 * @param SaleId
	 * @return
	 */
	@RequestMapping("/Print")  
    public ModelAndView print(String SaleId){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("Sale/List");  
        return mav;  
    }
	@RequestMapping("/ValidateNo")
	@ResponseBody
	public String validateNo(String saleNo) {
		return "1";
	}
	@RequestMapping("/GetNegativeInventoryVal")
	@ResponseBody
	public String getNegativeInventoryVal() {
		return "1";
	}
	@RequestMapping("/GetClientAddress")
	@ResponseBody
	public ReturnMessage getClientAddress(String strClientId) {
		
		return saleService.getClientAddress(strClientId);
	}
	
	@RequestMapping("/Add")  
    public ModelAndView add(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("Sale/Add");  
        return mav;  
    }
	@RequestMapping("/Cdd")  
    public ModelAndView copy(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("Sale/Add");  
        return mav;  
    }
}
