package com.mytestar.entity;

import jakarta.persistence.Entity;

@Entity
public class Users extends BaseEntity{
   private String name;
   private String email;
   private Integer points;

}
