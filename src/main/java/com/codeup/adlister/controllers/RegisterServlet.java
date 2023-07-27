package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");


        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }

//        if (errorMessage.equals("Error creating new user: Username is already taken.")) {
//            String errorMessage1 = "Sorry, this username is already taken.";
//            response.sendRedirect("/register");
//        }

        // create and save a new user
        User user = new User(username, email, password);



        // hash the password

        String hash = Password.hash(user.getPassword());

        user.setPassword(hash);

        try {
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        } catch (RuntimeException e){
            if(e.getMessage().contains("Error creating new user: Username is already taken.")) {
                request.setAttribute("Error", e.getMessage());
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                return;
            }
        }
    }
}
