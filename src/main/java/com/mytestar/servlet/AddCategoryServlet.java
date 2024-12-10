package com.mytestar.servlet;

import com.mytestar.entity.Category;
import com.mytestar.entityrepo.CategoryRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");
        String categoryDesc = req.getParameter("categoryDesc");

        CategoryRepo categoryRepo=new CategoryRepo();
        categoryRepo.save(new Category(categoryName, categoryDesc));
        resp.sendRedirect("chooseCategory.jsp");
    }
}
