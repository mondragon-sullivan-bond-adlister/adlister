package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);

    void updateUser(String username, String email, String password, long id);

    void deleteUser(String username);
}
