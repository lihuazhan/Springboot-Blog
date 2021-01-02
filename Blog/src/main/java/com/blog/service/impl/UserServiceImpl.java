package com.blog.service.impl;

import com.blog.dao.UserDao;
import com.blog.entity.Admin;
import com.blog.entity.User;
import com.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User checkUser(String username, String password) {
        User user = userDao.queryByUsernameAndPassword(username, password);
        return user;
    }

    @Override
    public void addUser(User user) {
        user.setCreateTime(new Date());
        userDao.addUser(user);
    }

    @Override
    public Admin checkAdmin(String username, String password) {
        Admin admin=userDao.queryByUsernameAndPassword2(username,password);

        return admin;
    }
}
