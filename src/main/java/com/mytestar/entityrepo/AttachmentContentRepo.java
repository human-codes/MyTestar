package com.mytestar.entityrepo;

import com.mytestar.entity.AttachmentContent;
import jakarta.persistence.EntityManager;

import static com.mytestar.MyListener.emf;

public class AttachmentContentRepo {


    public AttachmentContent getAttachmentIdById(int attachmentId) {
        try (EntityManager entityManager = emf.createEntityManager()){
            return entityManager.createQuery("from AttachmentContent where attachment.id = :id", AttachmentContent.class)
                    .setParameter("id",attachmentId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
