package com.sj.service;

import java.util.List;
import java.util.Map;

import com.sj.entity.Borrows;

public interface IBorrowsService  extends IBaseService<Borrows>{
	public List<Borrows> getBorrowsByUId(Integer uId);
	/**
	 * 获取当前用户借阅图书为归还的数量
	 * @param uId
	 * @return
	 */
	public List<Borrows> getBorrowsByUIdandRentun(Integer uId);
	public Map<String, Object> getBrroWsLike(Integer uId);
	
	
	public void updateBorrows(Borrows borrows);

}
