package com.sj.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 留言表
 */
@Entity
@Table(name = "leavemag", catalog = "sj")
public class Leavemag implements java.io.Serializable {

	// Fields

	private Integer id;
	private String msgContext;
	private String msgName;
	private String msgDate;
	private  String iphone;
	private String mail;


	// Constructors

	/** default constructor */
	public Leavemag() {
	}

	/** full constructor */
	public Leavemag(String msgContext, String msgName, String msgDate) {
		this.msgContext = msgContext;
		this.msgName = msgName;
		this.msgDate = msgDate;
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

	@Column(name = "msg_context")
	public String getMsgContext() {
		return this.msgContext;
	}

	public void setMsgContext(String msgContext) {
		this.msgContext = msgContext;
	}

	@Column(name = "msg_name")
	public String getMsgName() {
		return this.msgName;
	}

	public void setMsgName(String msgName) {
		this.msgName = msgName;
	}

	@Column(name = "msg_date")
	public String getMsgDate() {
		return this.msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}

	  @Column(name="iphone")
	public String getIphone() {
		return iphone;
	}

	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	 @Column(name="mail")
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

}