package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Config;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    // connects to db
    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    // find user by username
    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    // add new user to db
    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062){
                System.err.println("Username or Email is already taken! Please try again.");
                throw new RuntimeException("Error creating new user: Username or Email is already taken.");

            } else {
                throw new RuntimeException("Error creating new user", e);
            }
        }
    }

    // get a user object based on other methods
    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password")
        );
    }

    // method to update profile
    @Override
    public void updateUser(String username, String email, String password, long id) {
        String query = "UPDATE users SET username = ?, email = ?, password = ? WHERE (id = ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setLong(4, id);
//            System.out.println(user.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                System.err.println("Username is already taken. Please try again.");
                throw new RuntimeException("Error creating new user: Username is already taken.");

            } else {
                throw new RuntimeException("Error creating new user", e);
            }
        }
        }

        // allow user to delete account
        public void deleteUser(String username){
            String query = "DELETE FROM users WHERE username = ?";
            try {
                PreparedStatement stmt = connection.prepareStatement(query);
                stmt.setString(1, username);
                stmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

    }
