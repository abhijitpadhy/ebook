package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String uname = request.getParameter("uname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String pwd = request.getParameter("pwd");
            String checkbox = request.getParameter("checkbox");

            User user = new User();
            user.setName(uname);
            user.setEmail(email);
            user.setPhoneno(phone);
            user.setPassword(pwd);

            HttpSession session = request.getSession();
            if (checkbox != null) {
                UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
               boolean f2=dao.checkUser(email);
               if(f2) {
            	   boolean f = dao.userRegistre(user);
                   if (f) {
                       session.setAttribute("reg-msg", "Registration Successfully...");
                       response.sendRedirect("register.jsp");
                   } else {
                       // Handle registration failure here
                       session.setAttribute("reg-error-msg", "Registration failed. Please try again.");
                       response.sendRedirect("register.jsp");
                   }
               }else {
            	   session.setAttribute("reg-error-msg", "User already Exit Try another Email id.");
                   response.sendRedirect("register.jsp");
               }
            } else {
               
                session.setAttribute("reg-error-msg", "Please check the checkbox.");
                response.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
