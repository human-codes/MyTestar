package com.mytestar.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;

@Entity
public class Question extends BaseEntity {
    private String text;
    private Degree degree;

    private Integer answerId;
    @ManyToOne
    private Category category;

    @ManyToOne
    private Attachment audio;

}
