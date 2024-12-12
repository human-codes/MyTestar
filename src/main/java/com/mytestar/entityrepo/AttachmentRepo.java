package com.mytestar.entityrepo;

import com.mytestar.entity.Attachment;
import com.mytestar.entity.AttachmentContent;
import jakarta.persistence.EntityManager;

import static com.mytestar.MyListener.emf;

public class AttachmentRepo extends BaseRepo<Attachment> {


    public static Attachment saveFile(String submittedFileName, byte[] bytes) {

        try(EntityManager entityManager = emf.createEntityManager()) {
            Attachment attachment = new Attachment(
                    submittedFileName
            );

            AttachmentContent attachmentContent = new AttachmentContent(attachment,bytes);

            entityManager.getTransaction().begin();
            entityManager.persist(attachment);
            entityManager.persist(attachmentContent );
            entityManager.getTransaction().commit();

            return attachment;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }



    }
}
