package com.chat.chat.Controller;
import jakarta.websocket.ClientEndpoint;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.WebSocketContainer;
import org.glassfish.tyrus.client.ClientManager;

import java.net.URI;
public class ChatWebSocketClient {
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("Connected to server: " + session.getId());
        // Send a message to the server
        session.getAsyncRemote().sendText("Hello, Server!");
    }

    @OnMessage
    public void onMessage(String message) {
        System.out.println("Received message: " + message);
    }

    public static void main(String[] args) {
        try {
            WebSocketContainer container = ClientManager.createClient();
            URI uri = new URI("ws://localhost:8081/chat");
            container.connectToServer(ChatWebSocketClient.class, uri);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
