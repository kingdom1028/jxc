package com.kingdom.store.model;

/**
 * 商品
 * @author wangtg
 *
 */
public class TProduct {

	private String ClassSimple;//商品分类简写 只能输入字母或数字
	private String ProductForm;//规格 不能超过50个字符
	private String ProductClassId;//商品分类;
	private String ProductSalePriceStr;//参考销售价
	private String ProductCostPriceStr;//参考进货价
	private String LowSalePricePerStr;//最低售价
	
	private String HighSalePricePerStr;//最高售价(元)
	private String LowStockCountStr;//最低库存数量
	private String HighStockCountStr;//最高库存数量
	private String BarCode;//条形码
	private String ProductState;//商品状态
	private String ProductRemark;//备注
	private String ProductWarehouse;//
	private String ProductsSn;//
	private String productCode;//
	private String contactId;
	private String sobId;
	
	
}
