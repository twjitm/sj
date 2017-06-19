package com.sj.service;

import java.util.List;

import com.sj.entity.Papers;

public interface IPapersService  extends IBaseService<Papers>{
   /**
    * 获取最新的论文
    * @return
    */
	public List<Papers> getnewPapers();
	public List<Papers> getnewPapers(Integer page,Integer row);
	public List<Papers> getnewPapers(Integer cp, Integer row, Integer type,
			String keycontect);
	public List<Papers> getLikePapers(List<Papers> papers);
}
