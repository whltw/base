package com.tw.bear.service.admin;

import com.tw.bear.entity.admin.User;
import com.tw.bear.dao.admin.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户管理service
 */
@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public User findByUsername(String username){
        return userDao.findByUsername(username);

    }
}
