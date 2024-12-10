package com.mytestar.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
@Entity
public class AttachmentContent extends BaseEntity {

    @ManyToOne
    private Attachment attachment;

    private byte[] data;


}
