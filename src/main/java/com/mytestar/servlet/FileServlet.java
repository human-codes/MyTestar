package com.mytestar.servlet;

import com.mytestar.entity.AttachmentContent;
import com.mytestar.entityrepo.AttachmentContentRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/file/get")
public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int attachmentId = Integer.parseInt(req.getParameter("id"));
        AttachmentContentRepo attachmentContentRepoRepo = new AttachmentContentRepo();
        AttachmentContent ac = attachmentContentRepoRepo.getAttachmentIdById(attachmentId);
        resp.getOutputStream().write(ac.getData());

    }
}
