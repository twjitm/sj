package com.sj.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "menu", catalog = "sj")
public class Menu implements java.io.Serializable {

	// Fields

	private Integer id;
	private String menuName;//菜单名字
	private String menuUrl;//功能路径
	private Integer parentId;//父id
	private Integer haveChild;//是否有孩子
	private Integer isHidden;//是否课件
	private Integer orderNum;//排序
	private String menuImg;//菜单图片
	private List<Menu> menus;

	// Constructors

	/** default constructor */
	public Menu() {
	}

	/** full constructor */
	public Menu(String menuName, String menuUrl, Integer parentId,
			Integer haveChild, Integer isHidden, Integer orderNum) {
		this.menuName = menuName;
		this.menuUrl = menuUrl;
		this.parentId = parentId;
		this.haveChild = haveChild;
		this.isHidden = isHidden;
		this.orderNum = orderNum;
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

	@Column(name = "menu_name")
	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "menu_url")
	public String getMenuUrl() {
		return this.menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	@Column(name = "parent_id")
	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	@Column(name = "have_child")
	public Integer getHaveChild() {
		return this.haveChild;
	}

	public void setHaveChild(Integer haveChild) {
		this.haveChild = haveChild;
	}

	@Column(name = "is_hidden")
	public Integer getIsHidden() {
		return this.isHidden;
	}

	public void setIsHidden(Integer isHidden) {
		this.isHidden = isHidden;
	}

	@Column(name = "order_num")
	public Integer getOrderNum() {
		return this.orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	@Transient
	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	@Column(name="menu_img")
	public String getMenuImg() {
		return menuImg;
	}

	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}




}