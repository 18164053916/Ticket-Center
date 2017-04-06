package com.ticketcenter.dao;

import com.ticketcenter.model.AuditLog;
import com.ticketcenter.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by LiHao on 2017/3/29.
 */
@Repository
public interface AuditDao {

    /**
     * 插入进度
     */
    public  void insertAuditLog(@Param("auditLog") AuditLog auditLog, @Param("user") User user);


    public void updateAuditState(@Param("projectId") int projectId,@Param("isAudit") int isAudit);


}
