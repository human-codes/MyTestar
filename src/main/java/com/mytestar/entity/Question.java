package com.mytestar.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Question extends BaseEntity {
    private String text;
    private String difficulty;

    @ManyToOne
    private Category category;

    @ManyToOne
    private Attachment audio;

}
