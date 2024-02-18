package com.chat.chat.Controller;
import com.chat.chat.Metier.User;
import com.chat.chat.Service.imp.ChatService;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatweb/{username}")
public class Websocketchatserver {
    private ChatService chatService = new ChatService();
    @OnOpen
    public void onOpen(Session session) {

        // Add the user session to a list or data structure for broadcasting messages
    }

    @OnMessage
    public void onMessage(@PathParam("username") String username, String message, Session session) {
        chatService.savemessage(message,Integer.parseInt(username) ,0);        // Broadcast the message to all connected users
    }
}

