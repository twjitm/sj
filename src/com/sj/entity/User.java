package com.sj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "users", catalog = "sj")
public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String urName;
	private String urBarcode;
	private String urSex;
	private String urPsd;
	private String urAccess;
	private Integer urType;//2,管理员，1普通用户
	private Integer stuType;
	private String srIphone;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String urName, String urBarcode, String urSex, String urPsd,
			String urAccess, Integer urType, Integer stuType, String srIphone) {
		this.urName = urName;
		this.urBarcode = urBarcode;
		this.urSex = urSex;
		this.urPsd = urPsd;
		this.urAccess = urAccess;
		this.urType = urType;
		this.stuType = stuType;
		this.srIphone = srIphone;
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

	@Column(name = "ur_name")
	public String getUrName() {
		return this.urName;
	}

	public void setUrName(String urName) {
		this.urName = urName;
	}

	@Column(name = "ur_barcode")
	public String getUrBarcode() {
		return this.urBarcode;
	}

	public void setUrBarcode(String urBarcode) {
		this.urBarcode = urBarcode;
	}

	@Column(name = "ur_sex")
	public String getUrSex() {
		return this.urSex;
	}

	public void setUrSex(String urSex) {
		this.urSex = urSex;
	}

	@Column(name = "ur_psd")
	public String getUrPsd() {
		return this.urPsd;
	}

	public void setUrPsd(String urPsd) {
		this.urPsd = urPsd;
	}

	@Column(name = "ur_access")
	public String getUrAccess() {
		return this.urAccess;
	}

	public void setUrAccess(String urAccess) {
		this.urAccess = urAccess;
	}

	@Column(name = "ur_type")
	public Integer getUrType() {
		return this.urType;
	}

	public void setUrType(Integer urType) {
		this.urType = urType;
	}

	@Column(name = "stu_type")
	public Integer getStuType() {
		return this.stuType;
	}

	public void setStuType(Integer stuType) {
		this.stuType = stuType;
	}

	@Column(name = "sr_iphone")
	public String getSrIphone() {
		return this.srIphone;
	}

	public void setSrIphone(String srIphone) {
		this.srIphone = srIphone;
	}

}