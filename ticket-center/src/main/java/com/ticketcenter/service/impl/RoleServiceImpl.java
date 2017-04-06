package com.ticketcenter.service.impl;

import com.ticketcenter.dao.RoleDao;
import com.ticketcenter.model.MessageReturn;
import com.ticketcenter.model.SystemRole;
import com.ticketcenter.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by baron.wei on 2017/3/22.
 */
@Service
public class RoleServiceImpl implements RoleService {

    private Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Autowired
    RoleDao roleDao;

    @Override
    public List<SystemRole> getRoleList() {
        List<SystemRole> roleList=null;
        try {
            roleList= roleDao.getRoleList();

        }catch (Exception e){
            logger.error(new MessageReturn().setStatus(-500).setErrmsg(e.getMessage()).toString());
        }
        return roleList;

    }
}
