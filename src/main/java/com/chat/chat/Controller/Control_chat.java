package com.chat.chat.Controller;

import com.chat.chat.Service.imp.ChatService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.stream.Collectors;

@WebServlet(name = "chate_create", urlPatterns = "/Chat/create")
@MultipartConfig
public class Control_chat extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Use Part to retrieve parameters from FormData
            String messagePart = req.getParameter("message");
            String userPart = req.getParameter("user");

            System.out.println(messagePart);
            ChatService chatService = new ChatService();
            chatService.savemessage(messagePart, Integer.parseInt(userPart), 0);

            // You may want to send a response back to the client if needed
            resp.getWriter().write("Message sent successfully");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }

    // Helper method to extract data from Part
    private String extractPartData(Part part) throws IOException {
        try (InputStream inputStream = part.getInputStream()) {
            return new BufferedReader(new InputStreamReader(inputStream))
                    .lines()
                    .collect(Collectors.joining("\n"));
        }
    }
}

