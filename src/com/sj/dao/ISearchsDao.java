package com.sj.dao;

import java.util.List;

import com.sj.base.IBaseDao;
import com.sj.entity.Querys;


public interface ISearchsDao extends IBaseDao<Querys>{
        /**
         * 获取某人的关键词
         * @param uId
         * @return
         */
	public List<Querys> getSearchsList(Integer uId);
     /**
      * 
      * @param sId
      */
     public Querys getSearchsById(Integer sId);
     
     
}
