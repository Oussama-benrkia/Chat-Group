package com.chat.chat.Controller;

import com.chat.chat.Metier.Message;
import com.chat.chat.Service.imp.ChatService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "chatall", urlPatterns = "/chat/all")
public class Controllerallchat extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ChatService s=new ChatService();
        List<Message> jj=s.getmessage();
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonMessages = objectMapper.writeValueAsString(jj);

        // Set content type to application/json
        resp.setContentType("application/json");

        // Write JSON to the response output stream
        resp.getWriter().write(jsonMessages);
    }
}
