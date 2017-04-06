package com.ticketcenter.service;

import com.ticketcenter.model.*;
import org.apache.poi.ss.usermodel.Workbook;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by baron.wei on 2017/3/24.
 */
public interface ProjectService {

    MessageReturn updateProject(Project project);


    List<Project> getProjectList(int current, int pageSize);

    List<Project> getProjectList(Pager pager,User user);


   //异常终止项目
    MessageReturn stopProject(Project project);


    List<ProjectType> getProjectTypeList();


    void downloadExcelWithPOI(Pager pager,HttpServletResponse response);

    MessageReturn downloadExcel(Pager pager,User user);

    //结项
   public MessageReturn finishProject(Project project);

}
