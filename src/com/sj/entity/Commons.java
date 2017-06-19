package com.sj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Commons entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "commons", catalog = "sj")
public class Commons implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer entityId;
	private Integer comType;
	private String comContext;
	private String comTime;
	private String userAccount;

	// Constructors

	/** default constructor */
	public Commons() {
	}

	/** full constructor */
	public Commons(Integer entityId, Integer comType, String comContext,
			String comTime, String userAccount) {
		this.entityId = entityId;
		this.comType = comType;
		this.comContext = comContext;
		this.comTime = comTime;
		this.userAccount = userAccount;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "entity_id")
	public Integer getEntityId() {
		return this.entityId;
	}

	public void setEntityId(Integer entityId) {
		this.entityId = entityId;
	}

	@Column(name = "com_type")
	public Integer getComType() {
		return this.comType;
	}

	public void setComType(Integer comType) {
		this.comType = comType;
	}

	@Column(name = "com_context")
	public String getComContext() {
		return this.comContext;
	}

	public void setComContext(String comContext) {
		this.comContext = comContext;
	}

	@Column(name = "com_time")
	public String getComTime() {
		return this.comTime;
	}

	public void setComTime(String comTime) {
		this.comTime = comTime;
	}

	@Column(name = "user_account")
	public String getUserAccount() {
		return this.userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

}