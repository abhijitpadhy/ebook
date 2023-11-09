package com.DAO;
import java.util.List;
import com.entity.BookDtlss;


public interface BookDAO {
	
	public boolean addBooks(BookDtlss b);

	public List<BookDtlss> getAllBooks();
	
	public BookDtlss getBookById(int id);
	
	public boolean updateEditBooks(BookDtlss b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtlss> getNewBook();
	
	public List<BookDtlss> getRecentBooks();
	
	public List<BookDtlss> getOldBooks();
	
	public List<BookDtlss> getAllRecentBook();
	
	public List<BookDtlss> getAllNewBook();
	
	public List<BookDtlss> getAllOldBook();
    
	public List<BookDtlss> getBookByOld(String email,String cate);
	
	public boolean oldBookDelete(String email,String cat, int id);
	
	public List<BookDtlss> getBookSearch(String ch);
	
}