package com.mytestar.entityrepo;

import com.mytestar.entity.Category;
import com.mytestar.entity.Question;
import jakarta.persistence.EntityManager;

import static com.mytestar.MyListener.emf;

public class QuestionRepo extends BaseRepo<Question> {
    public static Question getQuestionByID(Integer id) {
        try (EntityManager entityManager = emf.createEntityManager()) {
            return entityManager.find(Question.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
