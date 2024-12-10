package com.mytestar.entityrepo;

import com.mytestar.entity.Category;
import jakarta.persistence.EntityManager;

import static com.mytestar.MyListener.emf;

public class CategoryRepo extends BaseRepo<Category> {

    public static Category getCategoryByID(Integer id) {
        try (EntityManager entityManager = emf.createEntityManager()) {
            return entityManager.find(Category.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
