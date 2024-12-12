package com.mytestar.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestAttempt extends BaseEntity{
    @ManyToOne
    private Users user;

    private LocalDateTime time;
    private Integer points;

}
