package com.sj.dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sj.base.BaseDao;
import com.sj.dao.IBooksDao;
import com.sj.entity.Books;

@Repository
public class BooksDaoImpl extends BaseDao<Books> implements IBooksDao{

	@Override
	public void add(Books books) {
		this.Save(books);		
	}

	@Override
	public Books getBooksById(Integer id) {
		String hql=" from Books b where b.id="+id;		
		return this.Get(hql);
	}

	@Override
	public List<Books> getinteerSertByBook(String context) {
		String hql="from Books b where b.bookName like'%"+context+"%' or b.briefIntrodu like'%"+context+"%'"
				+" or b.author like '%"+context+"%'" +" or b.bookKeys like '%"+context+"%'";
		return this.find(hql);
	}

	@Override
	public List<Books> getBooksByScach(String context, Integer type) {
		String sql="from Books b where b.";
		switch (type) {
		case 0://书名
			sql=sql+"bookName like'%"+context+"%'";
			break;
		case 1://作者
			sql=sql+"author like'%"+context+"%'";
			break;
		case 2://关键字
			sql=sql+"bookKeys like'%"+context+"%'";
			break;
		default:
			break;
		}
		return this.find(sql);
	}

	@Override
	public List<Books> getnewBooks() {
		String hql="from Books where YEARWEEK(date_format(bkLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) ";
		List<Books>books=find(hql);
		System.out.println("books="+books.size());
		return books;
	}

	@Override
	public List<Books> getnewBooks(Integer page, Integer row) {
		String hql="from Books where YEARWEEK(date_format(bkLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) ";
		List<Books>books=find(hql,page,row);
		System.out.println("books="+books.size());
		return books;
	}

	@Override
	public List<Books> getnewBooks(Integer page, Integer row, Integer type,
			String keycontect) {
		String hql="from Books where YEARWEEK(date_format(bkLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) and ";
		String base="";
		switch (type) {
		    case 0:
		    	base="bkName like'%"+keycontect+"%'";
			break;
		    case 1:
		    	base="bkAuthor like'%"+keycontect+"%'";
				break;
		    case 2:
		    	base="bkTheme like'%"+keycontect+"%'";
				break;
		   default:
			break;
		}
		hql=hql+base;
		return this.find(hql,page,row);
	}
}
