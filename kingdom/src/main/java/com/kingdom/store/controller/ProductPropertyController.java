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
@RequestMapping("ProductProperty")
public class ProductPropertyController {

	/**
	 * 新增属性页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/Add")  
    public ModelAndView add(String ParentClassId){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductProperty//Add");  
        return mav;  
    }
	/**
	 * 新增属性值
	 * @param request
	 * @return
	 */
	@RequestMapping("/Delete")  
	@ResponseBody
    public String delete(String cids){  
        return "";  
    }
	/**
	 * 删除属性分类
	 * @param cids
	 * @return
	 */
	@RequestMapping("/DeleteClass")  
	@ResponseBody
    public String deleteClass(String cids){  
        return "";  
    }
	
	/**
	 * 新增属性
	 * @param request
	 * @return
	 */
	@RequestMapping("/DoSaveProperty")  
	@ResponseBody
    public String doSaveProperty(HttpServletRequest request){  
        return "";  
    }
	@RequestMapping("/SaveClass")  
	@ResponseBody
    public String saveClass(String id,String text,String parentId){  
        return "";  
    }
	
	/**
	 * 新增属性值
	 * @param request
	 * @return
	 */
	@RequestMapping("/DoSavePropertyValue")  
	@ResponseBody
    public String doSavePropertyValue(HttpServletRequest request){  
        return "";  
    }
	/**
	 * 公告列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/Index")  
    public ModelAndView index(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductProperty/Index");  
        return mav;  
    }
	
	@RequestMapping("/PropertyValueAdd")  
    public ModelAndView propertyValueAdd(String PropertyId){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("ProductProperty/PropertyValueAdd");  
        return mav;  
    }
	/**
	 * 删除属性值
	 * @param cids
	 * @return
	 */
	@RequestMapping("/PropertyValueDelete")  
	@ResponseBody
    public String propertyValueDelete(String cids){  
        return "";  
    }
	
	
}
