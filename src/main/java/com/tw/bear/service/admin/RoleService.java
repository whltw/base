package com.tw.bear.service.admin;

import com.tw.bear.dao.admin.MenuDao;
import com.tw.bear.dao.admin.RoleDao;
import com.tw.bear.entity.admin.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色操作service层
 */
@Service
public class RoleService {
    @Autowired
    private RoleDao roleDao;

    /**
     * 角色编辑、保存
     * @param role
     * @return
     */
    public Role save(Role role){
        return roleDao.save(role);
    }

    /**
     * 查找所有角色
     */
    public List<Role> findAll(){
        return roleDao.findAll();
    }

    /**
     * 根据id获取角色
     * @param id
     * @return
     */
    public Role find(Long id){
       return roleDao.find(id);
    }

    /**
     * 根据id删除角色
     */

    public void delete(Long id){
        roleDao.deleteById(id);
    }
}
