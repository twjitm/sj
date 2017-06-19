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
 * 期刊 entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "periodicals", catalog = "sj")
public class Periodicals implements java.io.Serializable {

	// Fields

	private Integer id;
	private String plName;
	private String plSource;
	private String plAuthor;
	private String plTime;
	private String plVersion;
	private String plTheme;
	private String plSummary;
	private String plIssn;
	private String plImage;
	private Integer plType;
	private Date plLibtime;
	private Integer plBrowsenum;
	private String pdfurl;
	private String fbwurl;
	private Integer havePeriodicals;
	

	// Constructors

	/** default constructor */
	public Periodicals() {
	}

	/** full constructor */
	public Periodicals(String plName, String plSource, String plAuthor,
			String plTime, String plVersion, String plTheme, String plSummary,
			String plIssn, String plImage, Integer plType) {
		this.plName = plName;
		this.plSource = plSource;
		this.plAuthor = plAuthor;
		this.plTime = plTime;
		this.plVersion = plVersion;
		this.plTheme = plTheme;
		this.plSummary = plSummary;
		this.plIssn = plIssn;
		this.plImage = plImage;
		this.plType = plType;
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

	@Column(name = "pl_name")
	public String getPlName() {
		return this.plName;
	}

	public void setPlName(String plName) {
		this.plName = plName;
	}

	@Column(name = "pl_source")
	public String getPlSource() {
		return this.plSource;
	}

	public void setPlSource(String plSource) {
		this.plSource = plSource;
	}

	@Column(name = "pl_author")
	public String getPlAuthor() {
		return this.plAuthor;
	}

	public void setPlAuthor(String plAuthor) {
		this.plAuthor = plAuthor;
	}

	@Column(name = "pl_time")
	public String getPlTime() {
		return this.plTime;
	}

	public void setPlTime(String plTime) {
		this.plTime = plTime;
	}

	@Column(name = "pl_version")
	public String getPlVersion() {
		return this.plVersion;
	}

	public void setPlVersion(String plVersion) {
		this.plVersion = plVersion;
	}

	@Column(name = "pl_theme", length = 1000)
	public String getPlTheme() {
		return this.plTheme;
	}

	public void setPlTheme(String plTheme) {
		this.plTheme = plTheme;
	}

	@Column(name = "pl_summary", length = 1000)
	public String getPlSummary() {
		return this.plSummary;
	}

	public void setPlSummary(String plSummary) {
		this.plSummary = plSummary;
	}

	@Column(name = "pl_issn")
	public String getPlIssn() {
		return this.plIssn;
	}

	public void setPlIssn(String plIssn) {
		this.plIssn = plIssn;
	}

	@Column(name = "pl_image")
	public String getPlImage() {
		return this.plImage;
	}

	public void setPlImage(String plImage) {
		this.plImage = plImage;
	}

	@Column(name = "pl_type")
	public Integer getPlType() {
		return this.plType;
	}

	public void setPlType(Integer plType) {
		this.plType = plType;
	}
	@Temporal(TemporalType.TIMESTAMP)    
    @Column(name="pl_inlibtime")
	public Date getPlLibtime() {
		return plLibtime;
	}

	public void setPlLibtime(Date plLibtime) {
		this.plLibtime = plLibtime;
	}
	
	 @Column(name="pl_browsenum")
	public Integer getPlBrowsenum() {
		return plBrowsenum;
	}

	public void setPlBrowsenum(Integer plBrowsenum) {
		this.plBrowsenum = plBrowsenum;
	}
	 @Column(name="pl_pdfurl")
	public String getPdfurl() {
		return pdfurl;
	}

	public void setPdfurl(String pdfurl) {
		this.pdfurl = pdfurl;
	}
	 @Column(name="pl_fbwurl")
	public String getFbwurl() {
		return fbwurl;
	}

	public void setFbwurl(String fbwurl) {
		this.fbwurl = fbwurl;
	}
	 @Column(name="pl_have")
	public Integer getHavePeriodicals() {
		return havePeriodicals;
	}

	public void setHavePeriodicals(Integer havePeriodicals) {
		this.havePeriodicals = havePeriodicals;
	}

	
}