package com.chat.chat.Metier;


import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "User")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String email;
    private char gender; // Assuming gender is stored as a single character
    private String image;
    private String name;
    private String password;
    public User(String name, String email, String password,String image,char gen) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.image = image;
        this.gender=gen;
    }

    public User() {
        this.name = "";
        this.email = "";
        this.password = "";
        this.image="";
        this.gender='\0';

    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", gender=" + gender +
                ", image='" + image + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public char getGender() {
        return gender;
    }
}
