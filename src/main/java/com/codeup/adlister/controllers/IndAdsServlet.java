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

@WebServlet(name = "IndAdsServlet", value = "/IndAdsServlet")
public class IndAdsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // redirects them to login
        if (request.getSession().getAttribute("user") == null) {
            request.getSession().setAttribute("redirectAfterLogin", request.getRequestURI() + "?" + request.getQueryString());
            response.sendRedirect("/login");
            return;
        }



        String adId = request.getParameter("adId");


//        Ad ad = ad.getAdById(Integer.parseInt(adId));

//        request.setAttribute("ad", ad);
        RequestDispatcher dispatcher = request.getRequestDispatcher("individualAd.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Do something for POST request if needed
    }
}
