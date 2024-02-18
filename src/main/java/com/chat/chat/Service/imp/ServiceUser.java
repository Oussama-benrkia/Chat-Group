package com.chat.chat.Service.imp;

import com.chat.chat.Metier.User;
import com.chat.chat.Model.Manap.ManDatabase;
import com.chat.chat.Model.ModelUser;
import com.chat.chat.Service.ISerUser;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class ServiceUser implements ISerUser {
    @Override
    public User saveUser(String username, String email, char sex, String password, Part avatar) throws IOException {
        String image="";
        if(!(avatar.getSubmittedFileName().isEmpty())){
            String fileName = avatar.getSubmittedFileName();
            String timeStamp = DateTimeFormatter.ofPattern("yyyyMMddHHmmss").format(LocalDateTime.now());
            image = timeStamp + "-" + fileName;

            File uploadsDir = new File( "/image");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdir();
            }

            File file = new File(uploadsDir, image);

            try (InputStream fileContent = avatar.getInputStream()) {
                Files.copy(fileContent, file.toPath());
            } catch (Exception e) {
                // Handle exceptions
            }
        }else {
            if (sex=='F'){
                image="Default"+File.separator+"F.jpg";
            }else {
                image="Default"+File.separator+"M.jpg";
            }
        }

        ManDatabase.init();
        EntityManager em = ManDatabase.getEntityManager();
        ModelUser u=new ModelUser();
        u.save(new User(username,email,password,image,sex));
        return new User(username,email,password,image,sex);
    }

    @Override
    public User find(String email, String pass) {
        ManDatabase.init();
        EntityManager em = ManDatabase.getEntityManager();
        ModelUser us = new ModelUser();
        User u=us.find(email,pass);
        return u;
    }
    public List<User> getDistinctUsersByUser1OrUser2(User me) {
        ManDatabase.init();
        EntityManager entityManager = ManDatabase.getEntityManager();
        TypedQuery<User> query = entityManager.createQuery(
                "SELECT DISTINCT CASE WHEN m.user1 = :me THEN m.user2 ELSE m.user1 END FROM Message m WHERE m.user1 = :me OR m.user2 = :me",
                User.class);
        query.setParameter("me", me);

        return query.getResultList();
    }

}
