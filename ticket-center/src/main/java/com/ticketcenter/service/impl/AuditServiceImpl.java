package com.ticketcenter.service.impl;

import com.ticketcenter.dao.AuditDao;
import com.ticketcenter.dao.ProgressDao;
import com.ticketcenter.model.AuditLog;
import com.ticketcenter.model.MessageReturn;
import com.ticketcenter.model.Progress;
import com.ticketcenter.model.User;
import com.ticketcenter.service.AuditService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiHao on 2017/3/29.
 */
@Service
public class AuditServiceImpl implements AuditService {

    @Autowired
    private AuditDao auditDao;

    @Autowired
    private ProgressDao progressDao;

    private Logger log = LoggerFactory.getLogger(AuditServiceImpl.class);


    @Override
    public MessageReturn insertAuditLog(AuditLog auditLog, User user) {
        MessageReturn msg = new MessageReturn();
        try {
            auditDao.insertAuditLog(auditLog,user);
            List<Progress> progressList=progressDao.getProgressAuditing(auditLog.getProjectId());
            //说明还有待审核的内容
            if(progressList.size()>0){
                //将t_project的is_audit字段更新为2
                auditDao.updateAuditState(auditLog.getProjectId(),2);
            }
            else{
                //将t_project的is_audit字段更新为1
                auditDao.updateAuditState(auditLog.getProjectId(),1);
            }
        }catch (Exception e){
            e.printStackTrace();
            msg.setStatus(-500).setErrmsg(e.getMessage());
            log.info(msg.toString());
        }
        return msg;
    }


}
