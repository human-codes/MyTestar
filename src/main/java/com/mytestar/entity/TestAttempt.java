package com.mytestar.entity;

import jakarta.persistence.ManyToOne;

import java.time.LocalDateTime;

public class TestAttempt extends BaseEntity{
    @ManyToOne
    private Users user;

    private LocalDateTime time;
    private Integer points;

    @ManyToOne
    private Category category;
}
