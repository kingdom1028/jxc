package com.kingdom.store.model;

public class TSysConfig {
	private Integer id;
	private String contactId;
	private String configName;
	private String configDesc;
	private String isAllowNegativeInventory;//允许负库存销售
	private String isAllowLookOtherList;//允许员工查看他人单据
	private String isCheckSalePrice;//销售时检查最低销售价
	private String isOpenBuyTaxRate;//启用进货税率支持
	private String openBuyTaxRateDefault;//默认进货税率
	private String isOpenSaleTaxRate;//启用销售税率支持
	private String openSaleTaxRateDefault;//默认销售税率
	private String isOpenProductNum;//启用商品序列
	private String isAutoMonthBalance;//自动月结存
	private Integer autoMonthBalanceDefault;//每月?号
	private String isAutoYearBalance;//自动年结存
	private Integer autoYearBalanceDefault;//1月?号
	private String zoneId;//时区
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContactId() {
		return contactId;
	}
	public void setContactId(String contactId) {
		this.contactId = contactId;
	}
	public String getConfigName() {
		return configName;
	}
	public void setConfigName(String configName) {
		this.configName = configName;
	}
	public String getConfigDesc() {
		return configDesc;
	}
	public void setConfigDesc(String configDesc) {
		this.configDesc = configDesc;
	}
	public String getIsAllowNegativeInventory() {
		return isAllowNegativeInventory;
	}
	public void setIsAllowNegativeInventory(String isAllowNegativeInventory) {
		this.isAllowNegativeInventory = isAllowNegativeInventory;
	}
	public String getIsAllowLookOtherList() {
		return isAllowLookOtherList;
	}
	public void setIsAllowLookOtherList(String isAllowLookOtherList) {
		this.isAllowLookOtherList = isAllowLookOtherList;
	}
	public String getIsCheckSalePrice() {
		return isCheckSalePrice;
	}
	public void setIsCheckSalePrice(String isCheckSalePrice) {
		this.isCheckSalePrice = isCheckSalePrice;
	}
	public String getIsOpenBuyTaxRate() {
		return isOpenBuyTaxRate;
	}
	public void setIsOpenBuyTaxRate(String isOpenBuyTaxRate) {
		this.isOpenBuyTaxRate = isOpenBuyTaxRate;
	}
	public String getOpenBuyTaxRateDefault() {
		return openBuyTaxRateDefault;
	}
	public void setOpenBuyTaxRateDefault(String openBuyTaxRateDefault) {
		this.openBuyTaxRateDefault = openBuyTaxRateDefault;
	}
	public String getIsOpenSaleTaxRate() {
		return isOpenSaleTaxRate;
	}
	public void setIsOpenSaleTaxRate(String isOpenSaleTaxRate) {
		this.isOpenSaleTaxRate = isOpenSaleTaxRate;
	}
	public String getOpenSaleTaxRateDefault() {
		return openSaleTaxRateDefault;
	}
	public void setOpenSaleTaxRateDefault(String openSaleTaxRateDefault) {
		this.openSaleTaxRateDefault = openSaleTaxRateDefault;
	}
	public String getIsOpenProductNum() {
		return isOpenProductNum;
	}
	public void setIsOpenProductNum(String isOpenProductNum) {
		this.isOpenProductNum = isOpenProductNum;
	}
	public String getIsAutoMonthBalance() {
		return isAutoMonthBalance;
	}
	public void setIsAutoMonthBalance(String isAutoMonthBalance) {
		this.isAutoMonthBalance = isAutoMonthBalance;
	}
	public Integer getAutoMonthBalanceDefault() {
		return autoMonthBalanceDefault;
	}
	public void setAutoMonthBalanceDefault(Integer autoMonthBalanceDefault) {
		this.autoMonthBalanceDefault = autoMonthBalanceDefault;
	}
	public String getIsAutoYearBalance() {
		return isAutoYearBalance;
	}
	public void setIsAutoYearBalance(String isAutoYearBalance) {
		this.isAutoYearBalance = isAutoYearBalance;
	}
	public Integer getAutoYearBalanceDefault() {
		return autoYearBalanceDefault;
	}
	public void setAutoYearBalanceDefault(Integer autoYearBalanceDefault) {
		this.autoYearBalanceDefault = autoYearBalanceDefault;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	
	
	
	
	
}
