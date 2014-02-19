package com.kingdom.store.model;
/**
 * 单位
 * @author wangtg
 *
 */
public class TUnitSetting {

	private String unitId;
	private String unitName;//单位名称
	private String unitRemark;//备注
	private String isDecimal;//是否允许小数	 
	public String getUnitId() {
		return unitId;
	}
	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getUnitRemark() {
		return unitRemark;
	}
	public void setUnitRemark(String unitRemark) {
		this.unitRemark = unitRemark;
	}
	public String getIsDecimal() {
		return isDecimal;
	}
	public void setIsDecimal(String isDecimal) {
		this.isDecimal = isDecimal;
	}
	
}
