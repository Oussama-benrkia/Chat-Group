package com.chat.chat.Controller;

import com.chat.chat.Metier.User;
import com.chat.chat.Service.imp.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class Control_login extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("User");
        if (user != null) {
            response.sendRedirect("/chat");
        } else {
            request.getRequestDispatcher("/WEB-INF/View/login.jsp").forward(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
            ServiceUser us = new ServiceUser();
            User user = us.find(email, password);
            if (user == null) {
                req.setAttribute("errorMessage", "email or password invalid");
                req.getRequestDispatcher("/WEB-INF/View/login.jsp").forward(req, resp);
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("User", user);
                resp.sendRedirect("/chat");
            }
        } else {
            req.setAttribute("errorMessage", "All fields are required");
            req.getRequestDispatcher("/WEB-INF/View/login.jsp").forward(req, resp);
        }
    }
}
