package com.ticketcenter.dao;

import com.ticketcenter.model.Pager;
import com.ticketcenter.model.Progress;
import com.ticketcenter.model.Project;
import com.ticketcenter.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiHao on 2017/3/24.
 */


@Repository
public interface ProgressDao {

    /**
     * 从 offset 条开始  去 limit 条 数据。
     * @param pageSize
     * @param currentPage
     * @return
     */
    List<Project> getProgressList(@Param("pageSize") int pageSize, @Param("currentPage") int currentPage,
      @Param("firstSunday") String firstSunday,@Param("lastSunday") String lastSunday, @Param("user") User user);

    /**
     *
     *
     *
     * 查询得到进度详情
     * @return
     */
    List<Progress> getProgressDetails(@Param("id") int id);

    /**
     * 插入进度
     * @param progress
     * @param projectId
     * @param user
     */
    public  void insertProgress(@Param("progress") Progress progress,@Param("projectId") int projectId,@Param("user") User user);


    /**
     * 修改进度
     * @param progress
     */
    public  void updateProgress(@Param("progress") Progress progress);

    /**
     * 查询单个进度
     * @param progressId
     * @return
     */
    List<Progress> getProgressById(@Param("progressId") int progressId);


    List<Progress> getProgressAuditing(@Param("projectId") int projectId);


    /**
     * 查询每个项目的变更情况和风险提示情况
     * @param progressId
     * @param queryType
     * @return
     */
    List<Progress> getProgressOptions(@Param("projectId") int progressId,@Param("queryType") int queryType);


}
