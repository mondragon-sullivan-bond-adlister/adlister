package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "controllers.EditProfileServlet", urlPatterns = "/edit-profile")
public class EditProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("user");
        long userId = currentUser.getId();
        System.out.println("userId = " + userId);
        request.getRequestDispatcher("/WEB-INF/edit-profile.jsp").forward(request, response);
    }

    // allows users to edit their profile
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");
        String newPasswordConfirmation = request.getParameter("confirm_password");
        
        // validate input
        boolean inputHasErrors = newUsername.isEmpty()
                || newEmail.isEmpty()
                || newPassword.isEmpty()
                || (! newPassword.equals(newPasswordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/edit-profile");
            return;
        }

        // update user
        User currentUser = (User) request.getSession().getAttribute("user");
        long userId = currentUser.getId();
        System.out.println("userId = " + userId);

        System.out.println(currentUser.toString());

        try {
            String hash = Password.hash(newPassword);
//            currentUser.setPassword(hash);
            DaoFactory.getUsersDao().updateUser(newUsername, newEmail, hash, userId);

            HttpSession session = request.getSession();
            session.invalidate();

            response.sendRedirect("/login");
//            request.getRequestDispatcher("/WEB-INF/edit-profile.jsp").forward(request, response);

        } catch (RuntimeException e){
            if(e.getMessage().contains("Error creating new user: Username is already taken.")) {
                request.setAttribute("Error", e.getMessage());
                request.getRequestDispatcher("/WEB-INF/edit-profile.jsp").forward(request, response);
                return;
            }
        }
    }

}
