package com.chat.chat.Service.imp;

import com.chat.chat.Metier.Message;
import com.chat.chat.Metier.User;
import com.chat.chat.Model.Manap.ManDatabase;
import com.chat.chat.Model.ModelMsg;
import com.chat.chat.Model.ModelUser;
import jakarta.persistence.EntityManager;

import java.util.Date;
import java.util.List;

public class ChatService {
  public void savemessage(String message, int usss1, int uss2){
   ManDatabase.init();
   EntityManager em = ManDatabase.getEntityManager();
   ModelMsg u=new ModelMsg();
   ModelUser u1=new ModelUser();
   User us1=u1.find(usss1);
   User us2=u1.find(uss2);
   u.save(new Message(message,false,new Date(),us1,us2,us1));
  }
  public List<Message> getmessage(){
   ManDatabase.init();
   ModelMsg msg=new ModelMsg();
   return msg.Findall();

  }


 }
