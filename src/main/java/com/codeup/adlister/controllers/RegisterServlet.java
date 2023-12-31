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

    // allows users to register an account
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

        // check if there are issues with the inputs above
        if (inputHasErrors) {
            String error = "1";
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("Error1", error);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);

        // hash the password
        String hash = Password.hash(user.getPassword());

        // add hashed password to the user
        user.setPassword(hash);

        // try to insert user or catch the error
        try {
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        } catch (RuntimeException e){
            if(e.getMessage().contains("Error creating new user: Username or Email is already taken.")) {
                request.setAttribute("Error", e.getMessage());
                request.setAttribute("username", username);
                request.setAttribute("email", email);
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                return;
            }
        }
    }
}
