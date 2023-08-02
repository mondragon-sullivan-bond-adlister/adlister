package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
    // the do post will grab the params and use them for the searches or all adds
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String cat = request.getParameter("cat");
        System.out.println("cat = " + cat);
        String all = request.getParameter("all");
        String error = "no ad";

        // if a search was made it will render the search results ELSE if a category search was done it will render the results
        if(search != null){
            try {
                request.setAttribute("ads", DaoFactory.getAdsDao().search(search));
                request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);

            } catch (Exception e){
                request.setAttribute("ads", DaoFactory.getAdsDao().all());
                request.setAttribute("Error", error);
                request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
            }
        } else {
            try {
                request.setAttribute("ads", DaoFactory.getAdsDao().searchCat(Long.parseLong(cat)));
                request.setAttribute("cat", cat);
                request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
            } catch (Exception e){
                request.setAttribute("ads", DaoFactory.getAdsDao().all());
                request.setAttribute("Error", error);
                request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
            }
        }
    }
}
