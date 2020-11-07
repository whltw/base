package com.tw.bear.dao.admin;

import com.tw.bear.entity.admin.Menu;
import com.tw.bear.entity.admin.OperaterLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 后台菜单数据库操作
 */
@Repository
public interface MenuDao extends JpaRepository<Menu,Long > {

}
