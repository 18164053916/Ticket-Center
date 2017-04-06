package com.ticketcenter.dao;

import com.ticketcenter.model.Pager;
import com.ticketcenter.model.Project;
import com.ticketcenter.model.ProjectType;
import com.ticketcenter.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by baron.wei on 2017/3/27.
 */
@Repository
public interface ProjectDao {

    void addProject(Project project);

    void updateProject(Project project);

    List<Project> getProjects(@Param("limit") int limit, @Param("offset") int offset);


    List<Project> getProjectsWithFilter(@Param("pager") Pager pager, @Param("user") User user);

    //异常终止项目
    void stopProject(Project project);


    List<ProjectType> getProjectTypes();

    //结项
    void finishProject(Project project);

    /**
     * 从 offset 条开始  去 limit 条 数据。
     * @return
     */
    List<Project> getProgressList(@Param("pager") Pager pager,
     @Param("firstSunday") String firstSunday,@Param("lastSunday") String lastSunday, @Param("user") User user,@Param("queryType") String queryType);

}
