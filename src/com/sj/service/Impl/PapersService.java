package com.sj.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.dao.IPapersDao;
import com.sj.entity.Papers;
import com.sj.service.IPapersService;
@Service
public class PapersService extends BaseService<Papers> implements IPapersService {
@Resource
private IPapersDao papersDao;
	
	@Override
	public List<Papers> getnewPapers() {
		return papersDao.getNewPapers();
	}

	@Override
	public List<Papers> getnewPapers(Integer page, Integer row) {
		return papersDao.getNewPapers(page,row);
	}

	@Override
	public List<Papers> getnewPapers(Integer cp, Integer row, Integer type,
			String keycontect) {
		return papersDao.getNewPapers(cp,row,type,keycontect);
	}

	@Override
	public List<Papers> getLikePapers(List<Papers> papers) {
		if(papers.size()<1){
			return null;
		}
		String hql="from Papers where ";
		String basehql="";
		for(int i=0;i<papers.size();i++){
			if(i==papers.size()-1){
				basehql=basehql+"prName like '%"+papers.get(i).getPrName()+"%' or prAuthor like '%"+papers.get(i).getPrAuthor()+"%'";	
			}else{
				basehql=basehql+"prName like '%"+papers.get(i).getPrName()+"%' or prAuthor like '%"+papers.get(i).getPrAuthor()+"%' or ";
			}
		}
		hql=hql+basehql;
		return papersDao.find(hql);
	}

}
