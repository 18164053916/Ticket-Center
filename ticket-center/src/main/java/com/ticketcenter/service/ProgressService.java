package com.ticketcenter.service;

import com.ticketcenter.model.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LiHao on 2017/3/24.
 */
public interface ProgressService {


    public  List<Project> getProgressList(Pager pager, String firstSunday, String lastSunday, User user,String queryType);

   public MessageReturn insertProgress(Progress progress,int projectId,User user);

    public  List<Progress> getProgressDetails(int id);

    List<Progress> getProgressById(int progressId);

    /**
     * 查询每个项目的变更情况和风险提示情况
     * @param progressId
     * @param queryType
     * @return
     */
    List<Progress> getProgressOptions(int progressId,int queryType);

    public  MessageReturn updateProgress(Progress progress);

}
