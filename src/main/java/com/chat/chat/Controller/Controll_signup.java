package com.chat.chat.Controller;

import com.chat.chat.Metier.User;
import com.chat.chat.Service.imp.ServiceUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
@WebServlet(name = "register", urlPatterns = "/register")
@MultipartConfig
public class Controll_signup extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("User");

        if (user != null) {
            resp.sendRedirect("/chat");
        } else {
            req.getRequestDispatcher("/WEB-INF/View/register.jsp").forward(req, resp);
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("name");
        String password = req.getParameter("password");
        String gender = req.getParameter("sex");
        String email = req.getParameter("email");
        String password2 = req.getParameter("password2");
        Part avatar = req.getPart("logo") != null ? req.getPart("logo") : null;
        if (username != null && !username.isEmpty() &&
                password != null && !password.isEmpty() &&
                email != null && !email.isEmpty() &&
                password2 != null && !password2.isEmpty()) {
            System.out.println("ok1");
            if (password2.equals(password)){

                ServiceUser user =new ServiceUser();
               User us= user.saveUser(username,email,gender.charAt(0),password,avatar);
                HttpSession session=req.getSession();
                session.setAttribute("User",us);
                resp.sendRedirect("/chat");
            }else{
                req.setAttribute("errorMessage", "Password is not Match");
                req.getRequestDispatcher("/WEB-INF/View/register.jsp").forward(req,resp);
            }

        }else{
            req.setAttribute("errorMessage", "All fields are required");
            req.getRequestDispatcher("/WEB-INF/View/register.jsp").forward(req,resp);
        }
    }
}
