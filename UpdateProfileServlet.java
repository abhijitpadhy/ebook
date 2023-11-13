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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idString = request.getParameter("id");
            String uname = request.getParameter("uname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String pwd = request.getParameter("pwd");

            if (idString != null && !idString.isEmpty() && uname != null && !uname.isEmpty() && email != null && !email.isEmpty() && phone != null && !phone.isEmpty() && pwd != null && !pwd.isEmpty()) {
                int id = Integer.parseInt(idString);

                User us = new User();
                us.setId(id);
                us.setName(uname);
                us.setEmail(email);
                us.setPhoneno(phone);

                HttpSession session = request.getSession();
                UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());

                boolean f = dao.checkPassword(id, pwd);
                if (f) {
                    boolean f2 = dao.updateProfile(us);
                    if (f2) {
                        session.setAttribute("succMsg", "Profile Update Successfully...");
                    } else {
                        session.setAttribute("failedMsg", "Something went wrong on the server...");
                    }
                } else {
                    session.setAttribute("failedMsg", "Your Password is Incorrect");
                }
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("failedMsg", "Invalid input. Please fill in all fields.");
            }

            response.sendRedirect("edit_profile.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions if necessary
        }
    }
}
