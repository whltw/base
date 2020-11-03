package com.tw.bear.dao.admin;

import com.tw.bear.entity.admin.OperaterLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OperaterLogDao extends JpaRepository<OperaterLog,Long > {

    @Query("select ol from OperaterLog ol where ol.id =:id")
    OperaterLog findAccordingToId(@Param("id") Long id);

    @Query(value="select * from tw_operater_log order by create_time desc limit 0,:size",nativeQuery = true)
    List<OperaterLog> findLastestLog(@Param("size") int size);
}


