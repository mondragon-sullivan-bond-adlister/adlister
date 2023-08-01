package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/delete-ad")
public class DeleteAdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/showUserAds");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedInUser = (User) req.getSession().getAttribute("user");
        int adId = Integer.parseInt(req.getParameter("id"));

        // Call the deleteAd method in the DAO to delete the ad
        DaoFactory.getAdsDao().deleteAd(adId);

        // Redirect the user back to the page showing their ads
        resp.sendRedirect("/showUserAds");
    }
}
