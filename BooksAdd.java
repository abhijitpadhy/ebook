package com.admin.servlet;

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

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String bookName = request.getParameter("bname");
            String author = request.getParameter("author");
            String price = request.getParameter("price");
            String category = request.getParameter("categories");
            String status = request.getParameter("status");
            
            Part part = request.getPart("bimg");
            String filename = part.getSubmittedFileName();

            BookDtlss book = new BookDtlss(bookName, author, price, category, status, filename, "admin");

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
            boolean isBookAdded = dao.addBooks(book);

            HttpSession session = request.getSession();

            if (isBookAdded) {
                String path = getServletContext().getRealPath("") + "book";
                File file = new File(path);

                part.write(path + File.separator + filename);

                session.setAttribute("succMsg", "Book added Successfully");
            } else {
                session.setAttribute("failMsg", "Something went wrong on the server");
            }

            response.sendRedirect("admin/add_books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
