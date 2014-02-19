package com.kingdom.store.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "T_Menu", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TMenu {

	private String oid;
	private String poid;
	private Integer id;
	private Integer pid;
	private String menuImg;
	private String menuName;
	private String tips;
	private Integer dispIndex;
	private Integer state;
	private String url;
	private Integer isLeaf;
	@Id
	@Column(name = "OID", nullable = false, length = 36)
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	@Column(name = "POID", nullable = false, length = 36)
	public String getPoid() {
		return poid;
	}
	public void setPoid(String poid) {
		this.poid = poid;
	}
	// Property accessors
	@Column(name = "ID", nullable = false, length = 10)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "MENU_IMG", nullable = false, length = 100)
	public String getMenuImg() {
		return menuImg;
	}
	
	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	@Column(name = "MENU_NAME", nullable = false, length = 100)
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	@Column(name = "TIPS", nullable = true, length = 100)
	public String getTips() {
		return tips;
	}
	public void setTips(String tips) {
		this.tips = tips;
	}
	@Column(name = "PID", nullable = false, length = 4)
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	@Column(name = "DISP_INDEX", nullable = false, length = 4)
	public Integer getDispIndex() {
		return dispIndex;
	}
	public void setDispIndex(Integer dispIndex) {
		this.dispIndex = dispIndex;
	}
	@Column(name = "STATE", nullable = false, length = 4)
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Column(name = "URL", nullable = true, length = 100)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Column(name = "IS_LEAF", nullable = false, length = 4)
	public Integer getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(Integer isLeaf) {
		this.isLeaf = isLeaf;
	}
	
	
}
