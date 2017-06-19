package com.sj.service;

import java.util.List;

import com.sj.entity.Books;


public interface IBooksService extends IBaseService<Books>{
	 public Books getBooksById(Integer id);
	 public List<Books> getinteerSertByBook(String context);
	 /**
	  * 
	  * @param context
	  * @param type
	  * @return
	  */
	 public List<Books> getBooksByScach(String context, Integer type);
	 
	 public List<Books> getnewBooks();
	List<Books> getnewBooks(Integer page, Integer row);
	public List<Books> getnewBooks(Integer cp, Integer row, Integer type,
			String keycontect);
	public List<Books> getLikeBooks(List<Books> books);

}
