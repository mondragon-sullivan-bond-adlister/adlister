package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        try {

            boolean inputHasErrors = username.isEmpty()
                    || password.isEmpty();

            if (inputHasErrors) {
                String error = "Username or Password was empty. Please try again!";
                request.setAttribute("username", username);
                request.setAttribute("Error", error);
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                return;
            }

            boolean passwordsMatch = BCrypt.checkpw(password, user.getPassword());


            if (passwordsMatch) {
                request.getSession().setAttribute("user", user);
                String redirectUrl = (String) request.getSession().getAttribute("redirectAfterLogin");
                System.out.println("request.getSession().getAttribute(\"redirectAfterLogin\") = " + request.getSession().getAttribute("redirectAfterLogin"));
                if (redirectUrl != null) {
                    request.getSession().removeAttribute("redirectAfterLogin");
                    response.sendRedirect(redirectUrl);
                } else {
                    response.sendRedirect("/profile");
                }
            } else {
                String error2 = "The password you typed was incorrect!";
                request.setAttribute("Error2", error2);
                request.setAttribute("username", username);
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }
        } catch (RuntimeException e){
                String error1 = "The username you typed was incorrect!";
                request.setAttribute("Error1", error1);
                request.setAttribute("username", username);
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
