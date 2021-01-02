package com.blog.service;

import com.blog.entity.Admin;
import com.blog.entity.User;

public interface UserService {

    public User checkUser(String username, String password);
    void addUser(User user);
    public Admin checkAdmin(String username, String password);
}
