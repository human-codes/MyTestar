package com.mytestar.entityrepo;

import com.mytestar.entity.Answer;
import jakarta.persistence.EntityManager;

import static com.mytestar.MyListener.emf;

public class AnswerRepo extends BaseRepo<Answer> {
    public static Answer getAnswerByID(Integer id) {
        try (EntityManager entityManager = emf.createEntityManager()) {
            return entityManager.find(Answer.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
