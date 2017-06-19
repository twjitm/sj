package com.sj.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Papers entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "papers", catalog = "sj")
public class Papers implements java.io.Serializable {

	// Fields

	private Integer id;
	private String prName;
	private String prDegree;
	private String prYear;
	private String prAuthor;
	private String prTheme;
	private String prSummary;
	private String prClassify;
	private String prCompany;
	private String prTutor;
	private Integer prPagenum;
	private String prLanguage;
	private Integer prBorrownum;
	private Integer prCollectionnum;
	private Integer prLooknum;
	private  Date prLibtime;//入库时间
	private String pdfurl;
	private String fbwurl;
	private Integer havepapers;

	// Constructors

	/** default constructor */
	public Papers() {
	}

	/** full constructor */
	public Papers(String prName, String prDegree, String prYear,
			String prAuthor, String prTheme, String prSummary,
			String prClassify, String prCompany, String prTutor,
			Integer prPagenum, String prLanguage, Integer prBorrownum,
			Integer prCollectionnum, Integer prLooknum) {
		this.prName = prName;
		this.prDegree = prDegree;
		this.prYear = prYear;
		this.prAuthor = prAuthor;
		this.prTheme = prTheme;
		this.prSummary = prSummary;
		this.prClassify = prClassify;
		this.prCompany = prCompany;
		this.prTutor = prTutor;
		this.prPagenum = prPagenum;
		this.prLanguage = prLanguage;
		this.prBorrownum = prBorrownum;
		this.prCollectionnum = prCollectionnum;
		this.prLooknum = prLooknum;
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

	@Column(name = "pr_name")
	public String getPrName() {
		return this.prName;
	}

	public void setPrName(String prName) {
		this.prName = prName;
	}

	@Column(name = "pr_degree")
	public String getPrDegree() {
		return this.prDegree;
	}

	public void setPrDegree(String prDegree) {
		this.prDegree = prDegree;
	}

	@Column(name = "pr_year")
	public String getPrYear() {
		return this.prYear;
	}

	public void setPrYear(String prYear) {
		this.prYear = prYear;
	}

	@Column(name = "pr_author")
	public String getPrAuthor() {
		return this.prAuthor;
	}

	public void setPrAuthor(String prAuthor) {
		this.prAuthor = prAuthor;
	}

	@Column(name = "pr_theme", length = 500)
	public String getPrTheme() {
		return this.prTheme;
	}

	public void setPrTheme(String prTheme) {
		this.prTheme = prTheme;
	}

	@Column(name = "pr_summary", length = 1000)
	public String getPrSummary() {
		return this.prSummary;
	}

	public void setPrSummary(String prSummary) {
		this.prSummary = prSummary;
	}

	@Column(name = "pr_classify")
	public String getPrClassify() {
		return this.prClassify;
	}

	public void setPrClassify(String prClassify) {
		this.prClassify = prClassify;
	}

	@Column(name = "pr_company")
	public String getPrCompany() {
		return this.prCompany;
	}

	public void setPrCompany(String prCompany) {
		this.prCompany = prCompany;
	}

	@Column(name = "pr_tutor")
	public String getPrTutor() {
		return this.prTutor;
	}

	public void setPrTutor(String prTutor) {
		this.prTutor = prTutor;
	}

	@Column(name = "pr_pagenum")
	public Integer getPrPagenum() {
		return this.prPagenum;
	}

	public void setPrPagenum(Integer prPagenum) {
		this.prPagenum = prPagenum;
	}

	@Column(name = "pr_language")
	public String getPrLanguage() {
		return this.prLanguage;
	}

	public void setPrLanguage(String prLanguage) {
		this.prLanguage = prLanguage;
	}

	@Column(name = "pr_borrownum")
	public Integer getPrBorrownum() {
		return this.prBorrownum;
	}

	public void setPrBorrownum(Integer prBorrownum) {
		this.prBorrownum = prBorrownum;
	}

	@Column(name = "pr_collectionnum")
	public Integer getPrCollectionnum() {
		return this.prCollectionnum;
	}

	public void setPrCollectionnum(Integer prCollectionnum) {
		this.prCollectionnum = prCollectionnum;
	}

	@Column(name = "pr_looknum")
	public Integer getPrLooknum() {
		return this.prLooknum;
	}

	public void setPrLooknum(Integer prLooknum) {
		this.prLooknum = prLooknum;
	}

	@Temporal(TemporalType.TIMESTAMP)    
	@Column(name="pr_inlibtime")
	public Date getPrLibtime() {
		return prLibtime;
	}

	public void setPrLibtime(Date prLibtime) {
		this.prLibtime = prLibtime;
	}
	@Column(name="pr_pdfurl")
	public String getPdfurl() {
		return pdfurl;
	}

	public void setPdfurl(String pdfurl) {
		this.pdfurl = pdfurl;
	}
	@Column(name="pr_fuwurl")
	public String getFbwurl() {
		return fbwurl;
	}

	public void setFbwurl(String fbwurl) {
		this.fbwurl = fbwurl;
	}
	@Column(name="pr_have")
	public Integer getHavepapers() {
		return havepapers;
	}

	public void setHavepapers(Integer havepapers) {
		this.havepapers = havepapers;
	}

}