package com.tw.bear.dao.admin;

import com.tw.bear.entity.admin.Role;
import com.tw.bear.entity.admin.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<User, Long> {
    /**
     * 按照用户名查找用户信息
     * @param username
     * @return
     */
    public  User findByUsername(String username);

    /**
     * 根据id查用户
     * @param id
     * @return
     */
    @Query("select u from User u where u.id =:id")
    User find(@Param("id") Long id);
}
