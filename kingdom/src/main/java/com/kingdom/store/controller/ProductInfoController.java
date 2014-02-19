package com.kingdom.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kingdom.store.pageModel.UITree;
import com.kingdom.store.service.ProductInfoService;

/**
 * 公告
 * @author sabrina
 *
 */
@Controller
@RequestMapping("ProductInfo")
public class ProductInfoController {

	private ProductInfoService productInfoService;
	
	public ProductInfoService getProductInfoService() {
		return productInfoService;
	}
	@Autowired
	public void setProductInfoService(ProductInfoService productInfoService) {
		this.productInfoService = productInfoService;
	}
	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/List")  
    public ModelAndView list(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductInfo/List");  
        return mav;  
    } 
	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/Add")  
    public ModelAndView add(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductInfo/Add");  
        return mav;  
    }
	@RequestMapping("/Import")  
    public ModelAndView importProductInfo(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductInfo/Import");  
        return mav;  
    }
	@RequestMapping("/Edit")  
    public ModelAndView edit(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductInfo/Edit");  
        return mav;  
    }
	@RequestMapping("/Copy")  
    public ModelAndView copy(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductInfo/Copy");  
        return mav;  
    }
	
	@RequestMapping("/GetClassTree")
	@ResponseBody
	public UITree getClassTree(String id) {
		UITree tree=productInfoService.getClassTree(id);
		return tree;
	}
	@RequestMapping("/Delete")
	@ResponseBody
	public String delete(String cids) {
		return "1";
	}
	@RequestMapping("/GetClassTreeByProduct")
	@ResponseBody
	public String getClassTreeByProduct(String id) {
		return "1";
	}
	
	@RequestMapping("/TQRecord")
	@ResponseBody
	public String tQRecord(String cids,String tqtype) {
		return "1";
	}
	
	@RequestMapping("/SetClassSort")  
	@ResponseBody
    public String setClassSort(String target,String source,String point){
		
        return "";  
    }
	@RequestMapping("/ProductWarehouseStoreList")  
    public ModelAndView productWarehouseStoreList(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductInfo/ProductWarehouseStoreList");  
        return mav;  
    }
	
}
