package com.tw.bear.dao.admin;

import com.tw.bear.admin.entity.OperaterLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OperaterLogDao extends JpaRepository<OperaterLog,Long > {

    @Query("select ol from OperaterLog ol where ol.id =:id")
    OperaterLog findAccordingToId(@Param("id") Long id);
}
