package com.tw.bear.service.admin;

import com.tw.bear.admin.entity.OperaterLog;
import com.tw.bear.dao.admin.OperaterLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OperaterLogService {
    @Autowired
    private OperaterLogDao operaterLogDao;

    /**
     *
     */
    public OperaterLog save(OperaterLog operaterLog){
        return operaterLogDao.save(operaterLog);
    }

    public OperaterLog findById(Long id){
        return operaterLogDao.findAccordingToId(id);
    }

    /**
     * 根据id删除
     * @param id
     */
    public void delete(Long id){
        operaterLogDao.deleteById(id);
    }


    public List<OperaterLog> findAll(){
        return operaterLogDao.findAll();
    }

    public void deleteById(Long id ){
        operaterLogDao.deleteById(id);
    }

    public  void deleteAll(){
        operaterLogDao.deleteAll();
    }

    /**
     * 获取指定条数的日志
     * @param size
     * @return
     */
    public List<OperaterLog> findLastestLog(int size){
        return operaterLogDao.findLastestLog(size);
    }
}
