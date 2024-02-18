package com.chat.chat.Model.Manap;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class  ManDatabase {
    private static EntityManagerFactory entityManagerFactory;

    public static void init() {
        entityManagerFactory = Persistence.createEntityManagerFactory("chate");
    }

    public static EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }
    public static void kill(){
        entityManagerFactory.close();

    }
}