package com.kingdom.store.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * Tonline entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "T_ONLINE", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TOnline implements java.io.Serializable {

	// Fields

	private String id;
	private String loginName;
	private String ip;
	private Date loginDatetime;

	// Constructors

	/** default constructor */
	public TOnline() {
	}

	/** full constructor */
	public TOnline(String id, String loginName, String ip, Date loginDatetime) {
		this.id = id;
		this.loginName = loginName;
		this.ip = ip;
		this.loginDatetime = loginDatetime;
	}

	// Property accessors
	@Id
	@Column(name = "ID", nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "LOGIN_NAME", nullable = false, length = 100)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "IP", nullable = false, length = 50)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LOGIN_DATETIME", nullable = false, length = 7)
	public Date getLoginDatetime() {
		return this.loginDatetime;
	}

	public void setLoginDatetime(Date loginDatetime) {
		this.loginDatetime = loginDatetime;
	}

}