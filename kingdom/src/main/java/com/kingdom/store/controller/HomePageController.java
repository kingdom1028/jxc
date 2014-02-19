package com.kingdom.store.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kingdom.store.pageModel.Online;
import com.kingdom.store.pageModel.ReturnObject;
import com.kingdom.store.pageModel.Sale;
import com.kingdom.store.pageModel.UITree;
import com.kingdom.store.service.PremService;
import com.kingdom.store.service.SaleService;

@Controller
@RequestMapping("HomePage")
public class HomePageController {

	private PremService premService;
	private SaleService saleService;
	private String userId;
	public PremService getPremService() {
		return premService;
	}
	@Autowired
	public void setPremService(PremService premService) {
		this.premService = premService;
	}
	
	public SaleService getSaleService() {
		return saleService;
	}
	@Autowired
	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}
	/**
	 * 商品名称组   商品ID组  仓库名称  业务类型（用来标识第一参数是仓库还是商品  0：仓库 1：商品）   仓库ID   商品单位
	 * @param ProductIds
	 * @param WarehouseId
	 * @param RowIds
	 * @param allowCount
	 * @param busiType
	 * @return
	 */
	@RequestMapping("/BillSNManage")  
    public ModelAndView billSNManage(String ProductIds,String WarehouseId,String RowIds,String allowCount,String busiType){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/BillSNManage");  
        return mav;  
    }
	@RequestMapping("/CheckPerm")
	@ResponseBody
	public ReturnObject checkPerm(String permCodeList,String resName) {
		System.out.println(permCodeList);
		System.out.println(resName);
		return premService.checkPerm(permCodeList,resName,userId);
	}
	/**
	 * 绑定
	 * @return
	 */
	@RequestMapping("/ConstraintBind")  
	@ResponseBody
    public String constraintBind(){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        return "";  
    }
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/GetClassTreeByProduct")
	@ResponseBody
	public UITree getClassTreeByProduct(String id) {
		UITree tree=new UITree();
		tree.setId("all");
		tree.setText("商品分类");
		tree.setChildren(new ArrayList<UITree>());
		return tree;
	}
	/**
	 * 验证库存
	 * @param productId
	 * @param warehouseId
	 * @return
	 */
	@RequestMapping("/GetProductStockCount")
	@ResponseBody
	public String getProductStockCount(String productId,String warehouseId) {
		return "1";
	}
	@RequestMapping("/SNManage")
	public ModelAndView sNManage(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("homePage/SNManage");  
	     return mav;  
	}
	@RequestMapping("/PrintReport")
	public ModelAndView printReport(HttpServletRequest request) {
		 ModelAndView mav = new ModelAndView("homePage/PrintReport");  
	     return mav;  
	}
	
	@RequestMapping("/ValidateProductNameRepeat")
	@ResponseBody
	public String validateProductNameRepeat(String ProductName,String ProductUnit,String ProductForm,String ProductId) {
		return "1";
	}
	
	/**
	 * 
	 * @param ClassId
	 * @param ProductId
	 * @return
	 */
	@RequestMapping("/GetPropertyList")  
	@ResponseBody
    public String getPropertyList(String ClassId,String ProductId){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        return "";  
    }
	
	
	@RequestMapping("/GetPropertyValueList")  
	@ResponseBody
    public String getPropertyValueList(String PropertyId,String ProductId){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        return "";  
    }
	/**
	 * 最近7日销售报表
	 * @return
	 */
	@RequestMapping("/GetSaleAmt")
	@ResponseBody
	public List<Sale> getSaleAmt() {
//		SaleAmt: 0
//		SaleDate: "/Date(1392048000000)/"
//		StrSaleAmt: "0.00"
//		StrSaleDate: "2014-02-11"
//		UserId: "18cb32bc-f5dd-4704-870b-26bbad60006e"
//		return "1";
		return saleService.getSaleAmt(userId);
	}
	/**
	 * true获取盘点中状态,false取开帐状态
	 * @param online
	 * @return 0.1.2
	 */
	@RequestMapping("/GetSOBState")
	@ResponseBody
	public String getSOBState(Online online) {
		return "1";
	} 
	@RequestMapping("/GetUserState")
	@ResponseBody
	public String getUserState(Online online) {
		return "1";
	} 
	@RequestMapping("/HXRC")
	@ResponseBody
	public String hXRC(String busiId, String busiType,String hxType) {
		return "1";
	} 
	/**
	 * 加载首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/Index")  
    public ModelAndView index(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/Index");  
        return mav;  
    }
	@RequestMapping("/JudgeOpenAllowCount")
	@ResponseBody
	public String judgeOpenAllowCount(Online online) {
		return "1";
	}
	/**
	 * 降级提醒
	 * @param request
	 * @return
	 */
	@RequestMapping("/JudgeUserTip")  
    public ModelAndView judgeUserTip(String judgeDate,String newCount,String oldCount){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/JudgeUserTip");  
        return mav;  
    }
	
	/**
	 * 登录已超时，请重新输入密码
	 * @param request
	 * @return
	 */
	@RequestMapping("/LoadByPwd")  
    public ModelAndView loadByPwd(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/LoadByPwd");  
        return mav;  
    } 
	/**
	 * 员工上限提醒
	 * @param allowEmp
	 * @param payUrl
	 * @param contactId
	 * @return
	 */
	@RequestMapping("/OverEmployeeTip")
	public ModelAndView overEmployeeTip(String allowEmp,String payUrl,String contactId) {
		// 创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面
		ModelAndView mav = new ModelAndView("homePage/OverEmployeeTip");
		return mav;
	} 
	
	@RequestMapping("/PDSN")  
	public ModelAndView pDSN(String ProductIds,String WarehouseId,String TakBillId,String TakId,String allowCount,String storeType){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/PDSN");  
        return mav;  
    } 
	@RequestMapping("/Preview")  
    public ModelAndView preview(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/preview");  
        return mav;  
    } 
	/**
	 * 选择商品修改选择的行
	 * @param isSingle
	 * @param BusiAction
	 * @param WarehouseId
	 * @return
	 */
	@RequestMapping("/SelectProducts")  
    public ModelAndView selectProducts(String isSingle,String BusiAction,String WarehouseId){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/SelectProducts");  
        return mav;  
    }
	/**
	 * 商品名称组   商品ID组  仓库名称  业务类型（用来标识第一参数是仓库还是商品  0：仓库 1：商品）   仓库ID   商品单位
	 * @param ProductIds
	 * @param WarehouseId
	 * @param RowIds
	 * @param allowCount
	 * @param busiType
	 * @return
	 */
	@RequestMapping("/SelectSN")  
    public ModelAndView selectSN(String ProductIds,String WarehouseId,String RowIds,String allowCount,String busiType){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/SelectSN");  
        return mav;  
    }
	@RequestMapping("/ShareAdd")  
    public ModelAndView shareAdd(String BusiAction){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/ShareAdd");  
        return mav;  
    }
	@RequestMapping("/SignOut")
	public ModelAndView signOut(HttpServletRequest request) {
		// 创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面
		ModelAndView mav = new ModelAndView("homePage/SignOut");
		return mav;
	}
	@RequestMapping("/Suggest")  
    public ModelAndView suggest(HttpServletRequest request){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/Suggest");  
        return mav;  
    }
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/ValideEmployee")  
	@ResponseBody
    public String valideEmployee(){  
        //创建模型跟视图，用于渲染页面。并且指定要返回的页面为home页面  
        ModelAndView mav = new ModelAndView("homePage/ValideEmployee");  
        return "";  
    }
	
}
