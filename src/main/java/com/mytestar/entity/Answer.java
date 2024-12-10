package com.mytestar.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;

@Entity
public class Answer extends BaseEntity {
    private String text;
    @ManyToOne
    private Question question;
}
