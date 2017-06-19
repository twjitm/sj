package com.sj.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.dao.IPeriodicalsDao;
import com.sj.entity.Periodicals;
import com.sj.service.IPeriodicalsService;
@Service
public class PeriodicalsService extends BaseService<Periodicals> implements IPeriodicalsService {

	@Resource
	private IPeriodicalsDao periodicalsDao;
	@Override
	public List<Periodicals> getnewPeriodicals() {
		return periodicalsDao.getnewPeriodicals();
	}
	@Override
	public List<Periodicals> getnewPeriodicals(Integer page, Integer row) {
		// TODO Auto-generated method stub
		return periodicalsDao.getnewPeriodicals(page,row);
	}
	@Override
	public List<Periodicals> getnewPeriodicals(Integer page, Integer row,
			Integer type, String keycontect) {
		// TODO Auto-generated method stub
				return periodicalsDao.getnewPeriodicals(page,row,type,keycontect);
	}
	/**
	 * 协同过滤
	 */
	@Override
	public List<Periodicals> getLikeperiodicals(List<Periodicals> periodicals) {
		if(periodicals.size()<1){
			return null;
		}
		
		String hql="from Periodicals where ";
		String basehql="";
		for(int i=0;i<periodicals.size();i++){
			if(i==periodicals.size()-1){
				if(periodicals.get(i)==null) 
					continue;
					;
				basehql=basehql+"plName like '%"+periodicals.get(i).getPlName()+"%' or plAuthor like '%"+periodicals.get(i).getPlAuthor()+"%'";	
			}else{
				basehql=basehql+"plName like '%"+periodicals.get(i).getPlName()+"%' or plAuthor like '%"+periodicals.get(i).getPlAuthor()+"%' or ";
			}
		}
		hql=hql+basehql;
		System.out.println(hql);
		return periodicalsDao.find(hql);
	}

}
