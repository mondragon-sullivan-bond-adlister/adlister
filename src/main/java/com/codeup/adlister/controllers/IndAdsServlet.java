package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "IndAdsServlet", value = "/ad")
public class IndAdsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            request.getSession().setAttribute("redirectAfterLogin", request.getRequestURL() + "?" + request.getQueryString());
            response.sendRedirect("/login");
            return;
        }
        String ad1 = request.getQueryString();
        long adId = Long.parseLong(ad1);
        Ad ad = DaoFactory.getAdsDao().getAdById(adId);
        request.setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/IndividualAd/individualAd.jsp").forward(request, response);
    }
}
