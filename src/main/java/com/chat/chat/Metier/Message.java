package com.chat.chat.Metier;

import jakarta.persistence.*;

import javax.xml.crypto.Data;
import java.io.Serializable;
import java.util.Date;
@Entity
@Table
public class Message implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_create")
    private Date dateCreate;

    private String message;

    private Boolean rd;

    @ManyToOne
    @JoinColumn(name = "auth_id")
    private User auth;

        @ManyToOne
        @JoinColumn(name = "user1_id")
        private User user1;

        @ManyToOne
        @JoinColumn(name = "user2_id")
        private User user2;

    public Message() {
        // Default constructor is required for JPA
    }

    // Parameterized constructor
    public Message(String message, Boolean read, Date dateCreate, User user1, User user2, User auth) {
        this.message = message;
        this.rd = read;
        this.dateCreate = dateCreate;
        this.user1 = user1;
        this.user2 = user2;
        this.auth = auth;
    }



    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getRead() {
        return rd;
    }

    public void setRead(Boolean read) {
        this.rd = read;
    }

    public Date getDate_create() {
        return dateCreate;
    }

    public void setDate_create(Date date_create) {
        this.dateCreate = date_create;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

   public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    public User getAuth() {
        return auth;
    }

    public void setAuth(User auth) {
        this.auth = auth;
    }
}
