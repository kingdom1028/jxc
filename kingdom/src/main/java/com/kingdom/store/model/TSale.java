package com.kingdom.store.model;

import java.util.Date;


public class TSale {
	private Integer saleAmt;
	private Date saleDate;
	private String strSaleAmt;
	private String strSaleDate;
	private String userId;
	public Integer getSaleAmt() {
		return saleAmt;
	}
	public void setSaleAmt(Integer saleAmt) {
		this.saleAmt = saleAmt;
	}
	public Date getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}
	public String getStrSaleAmt() {
		return strSaleAmt;
	}
	public void setStrSaleAmt(String strSaleAmt) {
		this.strSaleAmt = strSaleAmt;
	}
	public String getStrSaleDate() {
		return strSaleDate;
	}
	public void setStrSaleDate(String strSaleDate) {
		this.strSaleDate = strSaleDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
