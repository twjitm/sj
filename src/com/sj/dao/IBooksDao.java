package com.sj.dao;

import java.util.List;

import com.sj.base.IBaseDao;
import com.sj.entity.Books;


public interface IBooksDao extends IBaseDao<Books> {
 public void add(Books books);
 public Books getBooksById(Integer id);
 
 public List<Books> getinteerSertByBook(String context);
 /**
  * 
  * @param context
  * @param type
  * @return
  */
 public List<Books> getBooksByScach(String context, Integer type);
 
 /**
  * 获取最新图书
  * @return
  */
 public List<Books> getnewBooks();
public List<Books> getnewBooks(Integer page, Integer row);
public List<Books> getnewBooks(Integer page, Integer row, Integer type,
		String keycontect);

}
