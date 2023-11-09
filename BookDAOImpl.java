package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtlss;

public class BookDAOImpl  implements BookDAO{
  private Connection con;
	public BookDAOImpl(Connection con) {
	super();
	this.con = con;
}

	@Override
	public boolean addBooks(BookDtlss bd) {
		boolean f=false;
        
        try {
       	 String sql = "INSERT INTO book_details (bookname,author, price,bookCategory,status,photo,email) VALUES (?, ?, ?, ?,?,?,?)";

       	 PreparedStatement ps=con.prepareStatement(sql);
       	 ps.setString(1,bd.getBookname());
       	 ps.setString(2, bd.getAuthor());
       	 ps.setString(3,bd.getPrice());
       	 ps.setString(4, bd.getBookCategory());
       	 ps.setString(5,bd.getStatus());
       	 ps.setString(6,bd.getPhotoName());
       	 ps.setString(7, bd.getEmail());
       	 int i=ps.executeUpdate();
       	 if(i==1)
       	 {
       		f=true; 
       	 }
        }catch(Exception e) {
       	 e.printStackTrace();
        }
		return f;
	}





	@Override
	public List<BookDtlss> getAllBooks() {
		List<BookDtlss> list =new ArrayList<BookDtlss>();
		BookDtlss b=null;
		try {
			String sql="select * from book_details";
			PreparedStatement ps=con.prepareStatement(sql);
			
			
		  ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			   b=new BookDtlss();
			   b.setBookId(rs.getInt(1));
			   b.setBookname(rs.getString(2));
			   b.setAuthor(rs.getString(3));
			   b.setPrice(rs.getString(4));
			   b.setBookCategory(rs.getString(5));
			   b.setStatus(rs.getString(6));
			   b.setPhotoName(rs.getString(7));
			   b.setEmail(rs.getString(8));
			   list.add(b);
		   }
		
		} catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		return list;
	}





	@Override
	public BookDtlss getBookById(int id) {
     
		
		BookDtlss b= null;
		try {
			String sql="select * from book_details where bookId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				 b=new BookDtlss();
				   b.setBookId(rs.getInt(1));
				   b.setBookname(rs.getString(2));
				   b.setAuthor(rs.getString(3));
				   b.setPrice(rs.getString(4));
				   b.setBookCategory(rs.getString(5));
				   b.setStatus(rs.getString(6));
				   b.setPhotoName(rs.getString(7));
				   b.setEmail(rs.getString(8));
			}
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		return b;
	}



//for edit books

	@Override
	public boolean updateEditBooks(BookDtlss b) {
		boolean f=false;
		
		try {
			String sql="update book_details set bookname=?,author=?, price=?,status=? where bookId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
		int i=	ps.executeUpdate();
		if(i==1)
		{
		 f=true;	
			
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}



//for delete books

	@Override
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book_details where bookId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}



//for Book showing dynamically

	@Override
	public List<BookDtlss> getNewBook() {
		List<BookDtlss> list = new ArrayList<BookDtlss>();
		BookDtlss b=null;
		try {
			String sql ="select * from book_details where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDtlss();
				   b.setBookId(rs.getInt(1));
				   b.setBookname(rs.getString(2));
				   b.setAuthor(rs.getString(3));
				   b.setPrice(rs.getString(4));
				   b.setBookCategory(rs.getString(5));
				   b.setStatus(rs.getString(6));
				   b.setPhotoName(rs.getString(7));
				   b.setEmail(rs.getString(8));
				   list.add(b);
				   i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<BookDtlss> getRecentBooks() {
		
		List<BookDtlss> list = new ArrayList<BookDtlss>();
		BookDtlss b=null;
		try {
			String sql ="select * from book_details where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDtlss();
				   b.setBookId(rs.getInt(1));
				   b.setBookname(rs.getString(2));
				   b.setAuthor(rs.getString(3));
				   b.setPrice(rs.getString(4));
				   b.setBookCategory(rs.getString(5));
				   b.setStatus(rs.getString(6));
				   b.setPhotoName(rs.getString(7));
				   b.setEmail(rs.getString(8));
				   list.add(b);
				   i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}





	@Override
	public List<BookDtlss> getOldBooks() {
		List<BookDtlss> list = new ArrayList<BookDtlss>();
		BookDtlss b=null;
		try {
			String sql ="select * from book_details where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDtlss();
				   b.setBookId(rs.getInt(1));
				   b.setBookname(rs.getString(2));
				   b.setAuthor(rs.getString(3));
				   b.setPrice(rs.getString(4));
				   b.setBookCategory(rs.getString(5));
				   b.setStatus(rs.getString(6));
				   b.setPhotoName(rs.getString(7));
				   b.setEmail(rs.getString(8));
				   list.add(b);
				   i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return list;
	}





	@Override
	public List<BookDtlss> getAllRecentBook() {
		List<BookDtlss> list = new ArrayList<BookDtlss>();
		BookDtlss b=null;
		try {
			String sql ="select * from book_details where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b=new BookDtlss();
				   b.setBookId(rs.getInt(1));
				   b.setBookname(rs.getString(2));
				   b.setAuthor(rs.getString(3));
				   b.setPrice(rs.getString(4));
				   b.setBookCategory(rs.getString(5));
				   b.setStatus(rs.getString(6));
				   b.setPhotoName(rs.getString(7));
				   b.setEmail(rs.getString(8));
				   list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}





	@Override
	public List<BookDtlss> getAllNewBook() {
		List<BookDtlss> list = new ArrayList<BookDtlss>();
		BookDtlss b=null;
		try {
			String sql ="select * from book_details where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDtlss();
				   b.setBookId(rs.getInt(1));
				   b.setBookname(rs.getString(2));
				   b.setAuthor(rs.getString(3));
				   b.setPrice(rs.getString(4));
				   b.setBookCategory(rs.getString(5));
				   b.setStatus(rs.getString(6));
				   b.setPhotoName(rs.getString(7));
				   b.setEmail(rs.getString(8));
				   list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}





	@Override
	public List<BookDtlss> getAllOldBook() {
		List<BookDtlss> list = new ArrayList<BookDtlss>();
		BookDtlss b=null;
		try {
			String sql ="select * from book_details where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				   b=new BookDtlss();
				   b.setBookId(rs.getInt(1));
				   b.setBookname(rs.getString(2));
				   b.setAuthor(rs.getString(3));
				   b.setPrice(rs.getString(4));
				   b.setBookCategory(rs.getString(5));
				   b.setStatus(rs.getString(6));
				   b.setPhotoName(rs.getString(7));
				   b.setEmail(rs.getString(8));
				   list.add(b);
				 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return list;
	}





	@Override
	public List<BookDtlss> getBookByOld(String email, String cate) {
	    List<BookDtlss> list = new ArrayList<BookDtlss>();
	    BookDtlss b = null;
	    try {
	        // You need to implement getConnection method to get a database connection.
	        String sql = "select * from book_details where email=? and bookCategory=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, email);
	        ps.setString(2, cate); // Swap the order of parameters

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            b = new BookDtlss();
	            b.setBookId(rs.getInt(1));
	            b.setBookname(rs.getString(2));
	            b.setAuthor(rs.getString(3));
	            b.setPrice(rs.getString(4));
	            b.setBookCategory(rs.getString(5));
	            b.setStatus(rs.getString(6));
	            b.setPhotoName(rs.getString(7));
	            b.setEmail(rs.getString(8));
	            list.add(b); // Add the retrieved BookDtlss object to the list.
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}





	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		boolean f=false;
		
		try {
			String sql="delete from book_details where bookCategory=? and email=? and bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			
		    int i = ps.executeUpdate();
		    if (i == 1) {
		    	f = true;
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtlss> getBookSearch(String ch) {

		List<BookDtlss> list = new ArrayList<BookDtlss>();
	    BookDtlss b = null;
	    try {
	        // You need to implement getConnection method to get a database connection.
	        String sql = "select * from book_details where bookname like ? or author like ? or bookCategory like ? and status=? ";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1,"%"+ch+"%");
	        ps.setString(2,"%"+ch+"%");
	        ps.setString(3,"%"+ch+"%");
	        ps.setString(4,"Active");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            b = new BookDtlss();
	            b.setBookId(rs.getInt(1));
	            b.setBookname(rs.getString(2));
	            b.setAuthor(rs.getString(3));
	            b.setPrice(rs.getString(4));
	            b.setBookCategory(rs.getString(5));
	            b.setStatus(rs.getString(6));
	            b.setPhotoName(rs.getString(7));
	            b.setEmail(rs.getString(8));
	            list.add(b); // Add the retrieved BookDtlss object to the list.
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	

}

