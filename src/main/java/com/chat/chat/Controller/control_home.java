package com.chat.chat.Controller;

import com.chat.chat.Metier.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "chat", urlPatterns = "/chat")
public class control_home  extends HttpServlet{

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("User");
        if (user == null) {
            response.sendRedirect("/login");
        } else {
            request.setAttribute("User", user);
            request.getRequestDispatcher("/WEB-INF/View/chatbox.jsp").forward(request, response); // Show chat page
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

