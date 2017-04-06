package com.ticketcenter.service;

import com.ticketcenter.model.AuditLog;
import com.ticketcenter.model.MessageReturn;
import com.ticketcenter.model.User;

/**
 * Created by LiHao on 2017/3/29.
 */
public interface AuditService {

    public MessageReturn insertAuditLog(AuditLog auditLog,User user);


}
