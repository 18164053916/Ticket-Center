package com.ticketcenter.service.impl;

import com.ticketcenter.dao.ProgressDao;
import com.ticketcenter.dao.ProjectDao;
import com.ticketcenter.model.*;
import com.ticketcenter.service.ProgressService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lihao on 2017/3/16.
 */
@Service
public class ProgressServiceImpl implements ProgressService {

    @Autowired
    private ProgressDao progressDao;
    @Autowired
    private ProjectDao projectDao;

    private Logger log = LoggerFactory.getLogger(ProgressServiceImpl.class);


    @Override
    public List<Project> getProgressList(Pager pager,String firstSunday, String lastSunday, User user,String queryType) {
        return projectDao.getProgressList(pager,firstSunday,lastSunday,user,queryType);
    }


    @Override
    public MessageReturn insertProgress(Progress progress,int projectId,User user) {
        MessageReturn msg = new MessageReturn();
        try {
            progressDao.insertProgress(progress,projectId,user);
        }catch (Exception e){
            e.printStackTrace();
            msg.setStatus(-500).setErrmsg(e.getMessage());
            log.info(msg.toString());
        }

        return msg;
    }

    @Override
    public List<Progress> getProgressDetails(int id) {
        return progressDao.getProgressDetails(id);
    }

    @Override
    public List<Progress> getProgressById(int progressId) {
        return progressDao.getProgressById(progressId);
    }

    @Override
    public List<Progress> getProgressOptions(int progressId, int queryType) {
        return progressDao.getProgressOptions(progressId,queryType);
    }

    @Override
    public MessageReturn updateProgress(Progress progress) {
        MessageReturn msg = new MessageReturn();
        try {
            progressDao.updateProgress(progress);
        }catch (Exception e){
            e.printStackTrace();
            msg.setStatus(-500).setErrmsg(e.getMessage());
            log.info(msg.toString());
        }

        return msg;
    }

}
