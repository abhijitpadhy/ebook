package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtlss;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
//    public EditBooksServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	   int id =Integer.parseInt(request.getParameter("id"));
	  String bookName = request.getParameter("bname");
      String author = request.getParameter("author");
      String price = request.getParameter("price");
      String status = request.getParameter("status");
      
      BookDtlss b=new BookDtlss();
      b.setBookId(id);
      b.setBookname(bookName);
      b.setAuthor(author);
      b.setPrice(price);
      b.setStatus(status);
      
      BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
      boolean f=dao.updateEditBooks(b);
      
      
      HttpSession session =request.getSession();      
      if(f)
      {
    	 session.setAttribute("succMsg", "Book update Successfully");
    	 response.sendRedirect("admin/all_books.jsp");
      }else {
    	  session.setAttribute("failedMsg", "Something went wrong o server");
     	 response.sendRedirect("admin/all_books.jsp");
      }
      
	
}catch(Exception e) {
	
}
	}

}
