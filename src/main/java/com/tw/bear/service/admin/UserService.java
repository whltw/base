package com.tw.bear.service.admin;

import com.tw.bear.bean.PageBean;
import com.tw.bear.entity.admin.User;
import com.tw.bear.dao.admin.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
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

    public User save(User user){
        return userDao.save(user);
    }

    /**
     * 分页查询用户
     * @param user
     * @param pageBean
     * @return
     */
    public PageBean<User> findList(User user,PageBean<User> pageBean){
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("username", ExampleMatcher.GenericPropertyMatchers.contains());
        withMatcher = withMatcher.withIgnorePaths("status","sex");
        Example<User> example = Example.of(user,withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1,pageBean.getPageSize());
        Page<User> all = userDao.findAll(example, pageable);
        pageBean.setContent(all.getContent());
        pageBean.setTotal(all.getTotalElements());
        pageBean.setTotalPage(all.getTotalPages());
        return pageBean;
    }

    public User findById(Long id){
        return userDao.find(id);
    }
}
