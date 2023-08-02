package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.ShowUserAdsServlet", urlPatterns = "/showUserAds")
public class ShowUserAdsServlet extends HttpServlet {

    // allow user to see all their ad's in the profile page
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/login");
            return;
        }
        long userId = ((User) req.getSession().getAttribute("user")).getId();
        List<Ad> userAds = DaoFactory.getAdsDao().getAdsByUserId(userId);
        req.setAttribute("userAds", userAds);
        req.getRequestDispatcher("/WEB-INF/showUserAds.jsp").forward(req, resp);

    }
}
