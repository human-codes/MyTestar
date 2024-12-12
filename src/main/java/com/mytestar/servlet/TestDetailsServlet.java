package com.mytestar.servlet;

import com.mytestar.entity.Category;
import com.mytestar.entity.Question;
import com.mytestar.entity.TestAttempt;
import com.mytestar.entityrepo.CategoryRepo;
import com.mytestar.entityrepo.QuestionRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

@WebServlet("/getDetails")
public class TestDetailsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String difficulty = req.getParameter("difficulty");
        String howMany = req.getParameter("howMany");
        int tests = Integer.parseInt(howMany);

        int categoryId = (int) req.getSession().getAttribute("categoryId");
        CategoryRepo categoryRepo = new CategoryRepo();
        Category category = categoryRepo.getCategoryByID(categoryId);

        QuestionRepo questionRepo = new QuestionRepo();
        List<Question> all = questionRepo.findAll();

        // Using Iterator to safely remove elements while iterating
        Iterator<Question> iterator = all.iterator();
        while (iterator.hasNext()) {
            Question question = iterator.next();
            if (!question.getCategory().equals(category) || (!difficulty.equals("ANY") && !question.getDifficulty().equals(difficulty))) {
                iterator.remove();
            }
        }

        List<Question> TEST = new ArrayList<>();
        Random random = new Random();

        if (tests != 0 && type.equals("random")) {
            for (int i = 0; i < tests; i++) {
                int randomIndex = random.nextInt(all.size());
                TEST.add(all.get(randomIndex));
            }
        } else if (tests != 0 && type.equals("sequential")) {
            for (int i = 0; i < tests; i++) {
                TEST.add(all.get(i));
            }
        } else if (tests == 0 && type.equals("random")) {
            TEST.addAll(all);
            Collections.shuffle(TEST);
        } else if (tests == 0 && type.equals("sequential")) {
            TEST.addAll(all);
        }

        System.out.println(TEST.size());
        TestAttempt testAttempt = new TestAttempt();
        testAttempt.setTime(LocalDateTime.now());
        req.getSession().setAttribute("testAttempt", testAttempt);
        req.getSession().setAttribute("TEST", TEST);

        resp.sendRedirect("test.jsp");
    }
}
