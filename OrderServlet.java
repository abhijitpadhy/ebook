package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();			int id = Integer.parseInt(request.getParameter("id"));
			
			String name = request.getParameter("username");
			String email = request.getParameter("email");
			String phoneno = request.getParameter("phoneno");
			String address = request.getParameter("address");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("pincode");
			String paymentType = request.getParameter("payment");
			
			String fullAdd = address+","+landmark+","+city+","+state+","+pincode;
			
//			System.out.println(name+" "+email+" "+phoneno+" "+fullAdd+" "+paymentType);
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
			
			List<Cart> blist = dao.getBookByUser(id);
			if(blist.isEmpty())
				{
				session.setAttribute("failedMsg1", "Please Add The item in cart first");
				  response.sendRedirect("checkout.jsp");
				}else{
					BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConnection());
					
					
					Book_Order o = null;
					
					ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
					Random r= new Random();
					for(Cart c:blist)
					{
						o=new Book_Order();
					   o.setOrderId("BOOK_ORD_00"+r.nextInt(1000));
					   o.setUsername(name);
					   o.setEmail(email);
					   o.setPhoneno(phoneno);
					   o.setFulladd(fullAdd);
					   o.setBookname(c.getBookname());
					   o.setAuthor(c.getAuthor());
					   o.setPrice(c.getPrice()+"");
					   o.setPaymentType(paymentType);
					   orderList.add(o);
					   
					   
					   
					}
					
					if("noselect".equals(paymentType))
					{
						session.setAttribute("failedMsg1", "Please Choose Payment Method");
						response.sendRedirect("checkout.jsp");
					} else {
						boolean f = dao2.saveOrder(orderList);
						
						if(f)
						{
							response.sendRedirect("order_success.jsp");
							
						} else {
							session.setAttribute("failedMsg1", "Your order failed");
							response.sendRedirect("checkout.jsp");
						}
						
					}
				}
			} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

