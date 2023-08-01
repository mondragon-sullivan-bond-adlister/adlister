package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.util.Config;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditAdsServlet", urlPatterns = "/edit-ads")

public class EditAdsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/edit-ads.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        User loggedInUser = (User) req.getSession().getAttribute("user");

        String updatedAdTitle = req.getParameter("title");
        String updatedAdDescription = req.getParameter("description");

        boolean inputHasErrors = updatedAdTitle.isEmpty() || updatedAdDescription.isEmpty();

        if (inputHasErrors) {
            resp.sendRedirect("/edit-ads");
            return;
        }

        try {
            int adId = Integer.parseInt(req.getParameter("id"));
            System.out.println("adId: " + adId);
            Config config = new Config();
            MySQLAdsDao adsDao = new MySQLAdsDao(config);
            adsDao.updateAd(updatedAdTitle, updatedAdDescription, adId);
            resp.sendRedirect("/showUserAds");
        } catch (NumberFormatException e) {
            resp.sendRedirect("/edit-ads?error=invalid_id"); // Redirect with an error message if adId is not a valid number
        }
    }
}

