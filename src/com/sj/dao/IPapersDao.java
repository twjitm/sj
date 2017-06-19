package com.sj.dao;

import java.util.List;

import com.sj.base.IBaseDao;
import com.sj.entity.Papers;


public interface IPapersDao extends IBaseDao<Papers>{
	/**
	 * 获取最新的入库论文
	 * @return
	 */
	public List<Papers> getNewPapers();

	public List<Papers> getNewPapers(Integer page, Integer row);

	public List<Papers> getNewPapers(Integer cp, Integer row, Integer type,
			String keycontect);

}
