<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.chat.chat.Metier.User" %>
<%@ page import="java.io.File" %>
<%
User user=(User) request.getAttribute("User");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/static/css/style.css" />">

    <link rel="icon" type="image/png"
          href="<c:url value="/static/images/icon.jpg" />">
    <title>Chat</title>
</head>
<body>
<div class="container">
    <div class="container">
        <div class="conversation-container">
            <div class="right-side active">
                <h2 style="padding: 10px">Chats: <span><%= user.getName() %></span></h2>
                <div class="tab-control">
                    <a href="<c:url value="/User/logout"/>" style="color: white; text-decoration: none; padding: 10px; background-color: #686ffd; border-radius: 5px; font-weight: bold; font-size: larger"> Log out</a>
                </div>
                <div class="list-messages-contain">
                    <ul class="list-messages" id="messages-container">
                        <!-- Messages will be dynamically added here -->
                    </ul>
                </div>
                <form id="chatForm" enctype="multipart/form-data">
                    <input type="text" id="message" class="txt-input" placeholder="Type message...">
                    <button style="position: absolute;top: 93%;width: 50px;right: 3%;height: 43px;" type="button" class="btn btn-send" onclick="sendMessage()"><i class="fa fa-paper-plane"></i></button>
                    <input type="hidden" value="<%= user.getId() %>" id="id">
                </form>
            </div>
        </div>
    </div>
</div>
    <script>
        function sendMessage() {
            var message = document.getElementById("message").value;
            var id = document.getElementById("id").value;
            console.log(id);
            console.log(message);

            // Create a FormData object to send data as multipart/form-data (similar to a form submission)
            var formData = new FormData();
            formData.append("message", message);
            formData.append("user", id);

            // Send a POST request to the server
            fetch("/Chat/create", {
                method: "POST",
                body: formData
            })
                .then(response => {
                    // Handle the response if needed
                    console.log(response);
                })
                .catch(error => {
                    console.error("Error:", error);
                });
        }
        function renderMessages(messages, authId) {
            // Get the messages container
            var messagesContainer = document.getElementById('messages-container');
            messagesContainer.innerHTML = "";
            // Loop through each message in the JSON array
            messages.forEach(function(message) {
                // Determine if the message is from the authenticated user
                var isAuthUser = message.auth.id == authId;

                // Create a new list item
                var listItem = document.createElement('li');

                // Create a message div with appropriate styling
                var messageDiv = document.createElement('div');
                messageDiv.className = 'message' + (isAuthUser ? ' right' : '');

                // Create an image div
                var imageDiv = document.createElement('div');
                imageDiv.className = 'message-img';

                // Create an image element
                var image = document.createElement('span');
                image.alt = '';

                // Append the image to the image div
                imageDiv.appendChild(image);

                // Create a text div
                var textDiv = document.createElement('div');
                textDiv.className = 'message-text';
                textDiv.textContent = message.message;

                // Append image and text divs to the message div
                messageDiv.appendChild(imageDiv);
                messageDiv.appendChild(textDiv);

                // Append the message div to the list item
                listItem.appendChild(messageDiv);

                // Append the list item to the messages container
                messagesContainer.appendChild(listItem);
            });
        }
        async function fetchDataAndRender() {
            // Example authenticated user ID (replace this with the actual authenticated user ID)
            var authUserId = document.getElementById("id").value;

            try {
                // Fetch JSON data from the server
                var response = await fetch('http://localhost:8082/chat/all');
                var jsonData = await response.json();

                // Call the renderMessages function with the JSON data and authenticated user ID
                renderMessages(jsonData, authUserId);
            } catch (error) {
                console.error('Error fetching or parsing JSON:', error);
            }
        }
        setInterval(fetchDataAndRender, 1000); // 60000 milliseconds = 1 minute

    </script>
</body>
</html>