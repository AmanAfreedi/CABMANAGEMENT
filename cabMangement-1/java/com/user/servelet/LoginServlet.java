package com.user.servlet;

import com.user.dao.UserDAO;
import com.user.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.loginUser(email, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("profile.jsp");
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
