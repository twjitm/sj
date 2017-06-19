package com.sj.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.dao.IBooksDao;
import com.sj.entity.Books;
import com.sj.service.IBooksService;

@Service
public class BooksService extends BaseService<Books> implements IBooksService{
@Resource
	private IBooksDao booksDao;

	@Override
	public Books getBooksById(Integer id) {
		return booksDao.getEntityById(Books.class, id);
	}

	@Override
	public List<Books> getinteerSertByBook(String context) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Books> getBooksByScach(String context, Integer type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Books> getnewBooks(Integer page,Integer row) {
		return  booksDao.getnewBooks(page,row);
	}
	@Override
	public List<Books> getnewBooks() {
		return  booksDao.getnewBooks();
	}

	@Override
	public List<Books> getnewBooks(Integer page, Integer row, Integer type,
			String keycontect) {
		return  booksDao.getnewBooks(page,row,type,keycontect);
	}

	@Override
	public List<Books> getLikeBooks(List<Books> books) {
		if(books.size()<1){
			return null;
		}
		String hql="from Books where ";
		String basehql="";
		for(int i=0;i<books.size();i++){
			if(i==books.size()-1){
				basehql=basehql+"bkName like '%"+books.get(i).getBkName()+"%' or bkAuthor like '%"+books.get(i).getBkAuthor()+"%'";	
			}else{
				basehql=basehql+"bkName like '%"+books.get(i).getBkName()+"%' or bkAuthor like '%"+books.get(i).getBkAuthor()+"%' or ";
			}
		}
		hql=hql+basehql;
		return booksDao.find(hql);
	}

}
