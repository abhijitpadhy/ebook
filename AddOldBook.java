package com.user.servlet;

import java.io.File;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtlss;

/**
 * Servlet implementation class AddOldBook
 */
@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            String bookName = request.getParameter("bname");
	            String author = request.getParameter("author");
	            String price = request.getParameter("price");
	            String category = "Old";
	            String status = "Active";
	            
	            Part part = request.getPart("bimg");
	            String filename = part.getSubmittedFileName();
	           
	            String useremail=request.getParameter("user");
          
	            BookDtlss book = new BookDtlss(bookName, author, price, category, status, filename, useremail);

	            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	            boolean isBookAdded = dao.addBooks(book);

	            HttpSession session = request.getSession();

	            if (isBookAdded) {
	                String path = getServletContext().getRealPath("") + "book";
	                File file = new File(path);

	                part.write(path + File.separator + filename);

	                session.setAttribute("sucMsg", "Book added Successfully");
	            } else {
	                session.setAttribute("failedMsg", "Something went wrong on the server");
	            }

	            response.sendRedirect("sell_book.jsp");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}