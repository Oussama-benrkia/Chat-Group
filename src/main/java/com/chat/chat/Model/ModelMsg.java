package com.chat.chat.Model;

import com.chat.chat.Metier.Message;
import com.chat.chat.Metier.User;
import com.chat.chat.Model.Manap.ManDatabase;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ModelMsg implements IModel<Message, Integer>{

    @Override
    public Message save(Message p) {
        EntityManager em = null;
        EntityTransaction transaction = null;

        try {
            em = ManDatabase.getEntityManager();
            transaction = em.getTransaction();
            transaction.begin();

            em.persist(p);
            transaction.commit();
        } catch (RuntimeException e) {
            // Check and roll back transaction if it's active
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e; // or handle it as needed
        } finally {
            // Close EntityManager
            if (em != null) {
                em.close();
            }
        }
        return p;
    }

    @Override
    public Message delete(Message p) {
        return null;
    }

    @Override
    public Message update(Message p) {
        return null;
    }

    @Override
    public List<Message> Findall() {
        EntityManager em = null;
        em = ManDatabase.getEntityManager();

        TypedQuery<Message> query = em.createQuery(
                "SELECT m FROM Message m ORDER BY m.dateCreate DESC", Message.class);
        return query.getResultList();
    }

    @Override
    public Message find(Integer a) {
        return null;
    }
}
