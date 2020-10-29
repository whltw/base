package com.tw.bear.dao.admin;

import com.tw.bear.admin.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<User, Long> {
    /**
     * 按照用户名查找用户信息
     * @param username
     * @return
     */
    public  User findByUsername(String username);
}
