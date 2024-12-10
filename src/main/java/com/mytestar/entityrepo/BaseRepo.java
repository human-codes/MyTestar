package com.mytestar.entityrepo;

import jakarta.persistence.EntityManager;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import static com.mytestar.MyListener.emf;

public class BaseRepo<T> {

    private final Class<T> persistentClass;

    public BaseRepo() {
        Class<T> entityClass = (Class<T>)((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.persistentClass = entityClass;
    }

    public void save(T t) {
        try (EntityManager entityManager = emf.createEntityManager()){
            entityManager.getTransaction().begin();
            entityManager.persist(t);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<T> findAll() {

        try (EntityManager entityManager = emf.createEntityManager()) {
            return entityManager.createQuery(
                            "from %s".formatted(persistentClass.getSimpleName()), persistentClass)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error retrieving entities", e);
        }
    }

    public void edit(T t) {
        try (EntityManager entityManager = emf.createEntityManager()) {
            entityManager.getTransaction().begin();
            entityManager.merge(t);
            entityManager.getTransaction().commit();
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}

