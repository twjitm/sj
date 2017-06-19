package com.sj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Querys entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "querys", catalog = "sj")
public class Querys implements java.io.Serializable {

	// Fields

	private Integer id;
	private String qyTime;
	private String qyContext;
	private Integer UId;

	// Constructors

	/** default constructor */
	public Querys() {
	}

	/** full constructor */
	public Querys(String qyTime, String qyContext, Integer UId) {
		this.qyTime = qyTime;
		this.qyContext = qyContext;
		this.UId = UId;
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

	@Column(name = "qy_time")
	public String getQyTime() {
		return this.qyTime;
	}

	public void setQyTime(String qyTime) {
		this.qyTime = qyTime;
	}

	@Column(name = "qy_context")
	public String getQyContext() {
		return this.qyContext;
	}

	public void setQyContext(String qyContext) {
		this.qyContext = qyContext;
	}

	@Column(name = "u_id")
	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

}