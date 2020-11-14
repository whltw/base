package com.tw.bear.service.admin;

import com.tw.bear.dao.admin.MenuDao;
import com.tw.bear.entity.admin.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 菜单操作service层
 */
@Service
public class MenuService {
    @Autowired
    private MenuDao menuDao;

    /**
     * 菜单编辑、保存
     * @param menu
     * @return
     */
    public Menu save(Menu menu){
        return menuDao.save(menu);
    }

    /**
     * 查找所有菜单
     */
    public List<Menu> findAll(){
        return menuDao.findAll();
    }

    /**
     * 根据id获取菜单
     * @param id
     * @return
     */
    public Menu findOne(Long id){
       return menuDao.getOne(id);
    }

    /**
     * 根据id删除菜单
     */

    public void delete(Long id){
        menuDao.deleteById(id);
    }
}
