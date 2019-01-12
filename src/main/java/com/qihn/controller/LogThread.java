package com.qihn.controller;

import com.qihn.pojo.User;
import com.qihn.service.UserService;

import javax.annotation.Resource;

public class LogThread implements Runnable {

    public LogThread(UserService userService, User user) {
        this.userService = userService;
        this.user = user;
    }

    private UserService userService;

    private User user;
    @Override
    public void run() {
        this.userService.save(user);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
