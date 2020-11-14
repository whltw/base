package com.tw.bear.util;

import com.tw.bear.entity.admin.Menu;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单工具类
 */
public class MenuUtil {
    /**
     * 获取所有的菜单一级分类
     * @return
     */
    public static List<Menu> getTopMenus(List<Menu> menus){
        List<Menu> topMenus = new ArrayList<Menu>();
        for(Menu menu : menus){
            if(menu.getParent() == null){
                topMenus.add(menu);
            }
        }
        return topMenus;
    }

    /**
     * 获取二级分类菜单
     * @param menus
     * @return
     */
    public static List<Menu> getSecondMenus(List<Menu> menus){
        List<Menu> secondMenus = new ArrayList<Menu>();
        for(Menu menu : menus){
            if(menu.getParent() != null && menu.getParent().getParent() == null){
                secondMenus.add(menu);
            }
        }
        return secondMenus;
    }

    /**
     * 获取三级菜单
     * @param menus
     * @return
     */
    public static List<Menu> getThirdMenus(List<Menu> menus){
        List<Menu> thirdMenus = new ArrayList<Menu>();
        for(Menu menu : menus){
            if(menu.getParent() != null && menu.getParent().getParent() != null && menu.getParent().getParent().getParent() == null){
                thirdMenus.add(menu);
            }
        }
        return thirdMenus;
    }


}
