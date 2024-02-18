package com.chat.chat.Model;

import com.chat.chat.Metier.User;
import com.chat.chat.Model.Manap.ManDatabase;
import jakarta.persistence.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

import java.util.List;

public class ModelUser implements IModel<User, Integer> {
    private static ModelUser instance = null;

    public synchronized static ModelUser getInstace() {
        if (instance == null) {
            instance = new ModelUser();
        }
        return instance;
    }
    @Override
    public User save(User p) {
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
    public User delete(User p) {
        return null;
    }

    @Override
    public User update(User p) {
        return null;
    }

    @Override
    public List<User> Findall() {
        return null;
    }

    @Override
    public User find(Integer a) {
        EntityManager em=ManDatabase.getEntityManager();
        User s=em.find(User.class, a);
        return s;
    }

    public User find(String email, String password) {
        EntityManager em = ManDatabase.getEntityManager();
        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<User> cq = cb.createQuery(User.class);
            Root<User> user = cq.from(User.class);

            // Add where clause for email and password
            cq.where(cb.and(cb.equal(user.get("email"), email), cb.equal(user.get("password"), password)));

            TypedQuery<User> q = em.createQuery(cq);
            return q.getSingleResult(); // This should now return a unique result
        } catch (NoResultException e) {
            return null; // or handle the case where no user is found
        } catch (NonUniqueResultException e) {
            // Log the error and handle it, perhaps by throwing a custom exception
            throw new IllegalStateException("Multiple users with the same email and password found.");
        } finally {
            em.close();
        }
    }

}
