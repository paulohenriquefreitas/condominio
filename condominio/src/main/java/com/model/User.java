package com.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Entity;

import org.springframework.data.annotation.Id;

@Entity
@Table(name = "users")
public class User {

  // An autogenerated id (unique for each user in the db)
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;
  
  @NotNull
  private String email;
  
  @NotNull
  private String name;

  // Public methods
  
  public User() { }

  public User(long id) { 
    this.id = id;
  }
  
  public User(String email, String name) {
    this.email = email;
    this.name = name;
  }

  // Getter and setter methods
  // ...

}