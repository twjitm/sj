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
 * Books entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "books", catalog = "sj")
public class Books implements java.io.Serializable {

	// Fields

	private Integer id;
	private String bkName;
	private String bkAuthor;
	private String bkPress;
	private String bkIsbn;
	private String bkPresstime;
	private Integer bkVersion;
	private String bkTheme;
	private Integer bkBrowsenum;
	private String bkCollection;
	private Integer bkPagenum;//页数
	private Integer bkType;//a图书分类
	private String bkImage;//图书图片
	private Date bkLibtime;//入关时间
	private String pdfurl;//电子书路径
	private String fbwurl;//外借图书url
	private Integer storageNum;
	private Integer haveBooks;//存在

	// Constructors

	/** default constructor */
	public Books() {
	}

	/** full constructor */
	public Books(String bkName, String bkAuthor, String bkPress, String bkIsbn,
			String bkPresstime, Integer bkVersion, String bkTheme,
			Integer bkBrowsenum, String bkCollection, Integer bkPagenum,
			Integer bkType, String bkImage) {
		this.bkName = bkName;
		this.bkAuthor = bkAuthor;
		this.bkPress = bkPress;
		this.bkIsbn = bkIsbn;
		this.bkPresstime = bkPresstime;
		this.bkVersion = bkVersion;
		this.bkTheme = bkTheme;
		this.bkBrowsenum = bkBrowsenum;
		this.bkCollection = bkCollection;
		this.bkPagenum = bkPagenum;
		this.bkType = bkType;
		this.bkImage = bkImage;
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

	@Column(name = "bk_name")
	public String getBkName() {
		return this.bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	@Column(name = "bk_author")
	public String getBkAuthor() {
		return this.bkAuthor;
	}

	public void setBkAuthor(String bkAuthor) {
		this.bkAuthor = bkAuthor;
	}

	@Column(name = "bk_press")
	public String getBkPress() {
		return this.bkPress;
	}

	public void setBkPress(String bkPress) {
		this.bkPress = bkPress;
	}

	@Column(name = "bk_isbn")
	public String getBkIsbn() {
		return this.bkIsbn;
	}

	public void setBkIsbn(String bkIsbn) {
		this.bkIsbn = bkIsbn;
	}

	@Column(name = "bk_presstime")
	public String getBkPresstime() {
		return this.bkPresstime;
	}

	public void setBkPresstime(String bkPresstime) {
		this.bkPresstime = bkPresstime;
	}

	@Column(name = "bk_version")
	public Integer getBkVersion() {
		return this.bkVersion;
	}

	public void setBkVersion(Integer bkVersion) {
		this.bkVersion = bkVersion;
	}

	@Column(name = "bk_theme")
	public String getBkTheme() {
		return this.bkTheme;
	}

	public void setBkTheme(String bkTheme) {
		this.bkTheme = bkTheme;
	}

	@Column(name = "bk_browsenum")
	public Integer getBkBrowsenum() {
		return this.bkBrowsenum;
	}

	public void setBkBrowsenum(Integer bkBrowsenum) {
		this.bkBrowsenum = bkBrowsenum;
	}

	@Column(name = "bk_collection")
	public String getBkCollection() {
		return this.bkCollection;
	}

	public void setBkCollection(String bkCollection) {
		this.bkCollection = bkCollection;
	}

	@Column(name = "bk_pagenum")
	public Integer getBkPagenum() {
		return this.bkPagenum;
	}

	public void setBkPagenum(Integer bkPagenum) {
		this.bkPagenum = bkPagenum;
	}

	@Column(name = "bk_type")
	public Integer getBkType() {
		return this.bkType;
	}

	public void setBkType(Integer bkType) {
		this.bkType = bkType;
	}

	@Column(name = "bk_image")
	public String getBkImage() {
		return this.bkImage;
	}

	public void setBkImage(String bkImage) {
		this.bkImage = bkImage;
	}
	
	@Temporal(TemporalType.TIMESTAMP)    
     @Column(name="bk_inlibtime")
	public Date getBkLibtime() {
		return bkLibtime;
	}

	public void setBkLibtime(Date bkLibtime) {
		this.bkLibtime = bkLibtime;
	}
	 @Column(name="bk_pdfurl")
	public String getPdfurl() {
		return pdfurl;
	}

	public void setPdfurl(String pdfurl) {
		this.pdfurl = pdfurl;
	}
	 @Column(name="bk_fbwurl")
	public String getFbwurl() {
		return fbwurl;
	}

	public void setFbwurl(String fbwurl) {
		this.fbwurl = fbwurl;
	}
	 @Column(name="bk_storagenum")
	public Integer getStorageNum() {
		return storageNum;
	}

	public void setStorageNum(Integer storageNum) {
		this.storageNum = storageNum;
	}
       @Column(name="bk_have")
	public Integer getHaveBooks() {
		return haveBooks;
	}

	public void setHaveBooks(Integer haveBooks) {
		this.haveBooks = haveBooks;
	}

	
	
	
}