package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    // allows the user to create an ad and submit a category with the ad
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        Ad ad = new Ad(
                loggedInUser.getId(),
                request.getParameter("title"),
                request.getParameter("description")
        );
        String cat1s = request.getParameter("cat1");
        String cat2s = request.getParameter("cat2");
        String cat3s = request.getParameter("cat3");
        String cat4s = request.getParameter("cat4");
        String cat5s = request.getParameter("cat5");
        String cat6s = request.getParameter("cat6");
        String cat7s = request.getParameter("cat7");
        String cat8s = request.getParameter("cat8");
        ArrayList<Long> cat = new ArrayList<>();
        if (cat1s != null) {
             cat.add(Long.parseLong(cat1s));
        }
        if (cat2s != null) {
            cat.add(Long.parseLong(cat2s));
        }
        if (cat3s != null) {
            cat.add(Long.parseLong(cat3s));
        }
        if (cat4s != null) {
            cat.add(Long.parseLong(cat4s));
        }
        if (cat5s != null) {
            cat.add(Long.parseLong(cat5s));
        }
        if (cat6s != null) {
            cat.add(Long.parseLong(cat6s));
        }
        if (cat7s != null) {
            cat.add(Long.parseLong(cat7s));
        }
        if (cat8s != null) {
            cat.add(Long.parseLong(cat8s));
        }
        DaoFactory.getAdsDao().insert(ad, cat);
        response.sendRedirect("/ads");
    }
}
