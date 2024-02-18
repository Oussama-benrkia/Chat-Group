package com.chat.chat.Model.Manap;

import com.chat.chat.Metier.Message;
import com.chat.chat.Metier.User;
import com.chat.chat.Model.ModelMsg;
import com.chat.chat.Model.ModelUser;
import jakarta.persistence.EntityManager;
import java.util.Date;
import java.io.File;
import java.time.LocalDateTime;

public class Testman {
    public static void main(String args[]) {
       ManDatabase.init();


        EntityManager em = ManDatabase.getEntityManager();
        ModelMsg u=new ModelMsg();
        ModelUser u1=new ModelUser();



        //u.save(new Message("hello word",false,new Date(),us1,us2,us1));
    }
    }
