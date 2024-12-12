package com.mytestar.entity;

import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Category extends BaseEntity{
    private String name;
    private String description;
    private Integer testCount=0;

    public Category(String name, String description) {
        this.name = name;
        this.description = description;
    }
}
