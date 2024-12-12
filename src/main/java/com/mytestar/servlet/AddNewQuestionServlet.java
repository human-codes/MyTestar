package com.mytestar.servlet;

import com.mytestar.entity.*;
import com.mytestar.entityrepo.AnswerRepo;
import com.mytestar.entityrepo.AttachmentRepo;
import com.mytestar.entityrepo.CategoryRepo;
import com.mytestar.entityrepo.QuestionRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.Objects;


@WebServlet("/addQuestion")
@MultipartConfig
public class AddNewQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int idCategory = (int) Objects.requireNonNullElse(req.getSession().getAttribute("categoryId"), null);

        CategoryRepo categoryRepo = new CategoryRepo();
        Category category = categoryRepo.getCategoryByID(idCategory);

        String questionText = req.getParameter("questionText");
        String difficulty = req.getParameter("degree");
        String correctAnswer = req.getParameter("correctAnswer");


        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");


        Question question=new Question();
        question.setText(questionText);
        question.setCategory(category);
        category.setTestCount(category.getTestCount()+1);
        categoryRepo.edit(category);
        question.setDifficulty(difficulty);

        Part audio = req.getPart("audio");
        if (audio != null && audio.getSize() > 0) { // Check if the part exists and has content
            Attachment audioAttachment = AttachmentRepo.saveFile(audio.getSubmittedFileName(), audio.getInputStream().readAllBytes());
            question.setAudio(audioAttachment);
        }

        QuestionRepo questionRepo=new QuestionRepo();
        questionRepo.save(question);

        Answer answer1=new Answer(option1,question);
        Answer answer2=new Answer(option2,question);
        Answer answer3=new Answer(option3,question);
        Answer answer4=new Answer(option4,question);

        switch (Integer.parseInt(correctAnswer)){
            case 1->{
                answer1.setCorrect(true);
            }
            case 2->{
                answer2.setCorrect(true);
            }
            case 3->{
                answer3.setCorrect(true);
            }
            case 4->{
                answer4.setCorrect(true);
            }
        }

        AnswerRepo answerRepo=new AnswerRepo();
        answerRepo.save(answer1);
        answerRepo.save(answer2);
        answerRepo.save(answer3);
        answerRepo.save(answer4);

        resp.sendRedirect("createTest.jsp");
    }
}

