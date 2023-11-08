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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");

            if ("admin@gmail.com".equals(email) && "admin".equals(pwd)) {
                User user = new User();
                user.setName("Admin");
                session.setAttribute("userobj", user);
                response.sendRedirect("admin/admin.jsp");
                // Exit the function after redirecting for admin
            } else {
                User user = dao.getLogin(email, pwd);
                if (user != null) {
                    session.setAttribute("succMsg", "Login successful"); // Set a success message string
                    session.setAttribute("userobj", user); // Set the user object as well
                    response.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("failedMsg", "Email & password invalid");
                    response.sendRedirect("login.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
