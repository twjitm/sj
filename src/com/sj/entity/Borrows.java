package com.sj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Borrows entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "borrows", catalog = "sj")
public class Borrows implements java.io.Serializable {

	// Fields

	private Integer id;
	private String  bwBwtime;      //开始时间
	private String  bwEndtime;     //结束时间
	private Integer bwIsreturn;    //是否归还 0归还，1为归还
	private Integer bkId;
	private Integer prId;
	private Integer plId;
	private Integer bwIscontinue;    // 1是 0否延续
	private String  bwContinue;      //
	private String  bwContreturntime;//延续归还时间
	private Integer UId;
	private Integer type;
	private String urName;
	private String bookName;

	// Constructors

	/** default constructor */
	public Borrows() {
	}

	/** full constructor */
	public Borrows(String bwBwtime, String bwEndtime, Integer bwIsreturn,
			Integer bkId, Integer prId, Integer plId, Integer bwIscontinue,
			String bwContinue, String bwContreturntime, Integer UId) {
		this.bwBwtime = bwBwtime;
		this.bwEndtime = bwEndtime;
		this.bwIsreturn = bwIsreturn;
		this.bkId = bkId;
		this.prId = prId;
		this.plId = plId;
		this.bwIscontinue = bwIscontinue;
		this.bwContinue = bwContinue;
		this.bwContreturntime = bwContreturntime;
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

	@Column(name = "bw_bwtime")
	public String getBwBwtime() {
		return this.bwBwtime;
	}

	public void setBwBwtime(String bwBwtime) {
		this.bwBwtime = bwBwtime;
	}

	@Column(name = "bw_endtime")
	public String getBwEndtime() {
		return this.bwEndtime;
	}

	public void setBwEndtime(String bwEndtime) {
		this.bwEndtime = bwEndtime;
	}

	@Column(name = "bw_isreturn")
	public Integer getBwIsreturn() {
		return this.bwIsreturn;
	}

	public void setBwIsreturn(Integer bwIsreturn) {
		this.bwIsreturn = bwIsreturn;
	}

	@Column(name = "bk_id")
	public Integer getBkId() {
		return this.bkId;
	}

	public void setBkId(Integer bkId) {
		this.bkId = bkId;
	}

	@Column(name = "pr_id")
	public Integer getPrId() {
		return this.prId;
	}

	public void setPrId(Integer prId) {
		this.prId = prId;
	}

	@Column(name = "pl_id")
	public Integer getPlId() {
		return this.plId;
	}

	public void setPlId(Integer plId) {
		this.plId = plId;
	}

	@Column(name = "bw_iscontinue")
	public Integer getBwIscontinue() {
		return this.bwIscontinue;
	}

	public void setBwIscontinue(Integer bwIscontinue) {
		this.bwIscontinue = bwIscontinue;
	}

	@Column(name = "bw_continue")
	public String getBwContinue() {
		return this.bwContinue;
	}

	public void setBwContinue(String bwContinue) {
		this.bwContinue = bwContinue;
	}

	@Column(name = "bw_contreturntime")
	public String getBwContreturntime() {
		return this.bwContreturntime;
	}

	public void setBwContreturntime(String bwContreturntime) {
		this.bwContreturntime = bwContreturntime;
	}

	@Column(name = "u_id")
	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}
     @Transient
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
 @javax.persistence.Transient
	public String getUrName() {
		return urName;
	}

	public void setUrName(String urName) {
		this.urName = urName;
	}
	@javax.persistence.Transient
	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	
	
}