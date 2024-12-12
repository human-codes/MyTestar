package com.mytestar.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Answer extends BaseEntity {
    private String text;

    @ManyToOne
    private Question question;

    private boolean correct=false;

    public Answer(String text, Question question) {
        this.text = text;
        this.question = question;
    }
}
