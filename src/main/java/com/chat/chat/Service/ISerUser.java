package com.chat.chat.Service;

import com.chat.chat.Metier.User;
import jakarta.servlet.http.Part;

import java.io.IOException;

public interface ISerUser {
    public User saveUser( String username,String email,char sex, String password, Part avatar ) throws IOException;
    public User find(String email,String pass);
}
