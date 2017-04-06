package com.ticketcenter.controller;

import com.ticketcenter.model.*;
import com.ticketcenter.service.ProjectService;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by baron.wei on 2017/3/23.
 */
@Controller
public class ProjectController {

    @Autowired
    ProjectService projectService;


    @RequiresAuthentication
    @RequiresRoles("1")
    @RequestMapping("/project/management/index")
    public String index(){
        return "main/projectManagement";
    }

  @RequiresAuthentication
  @RequiresRoles("2")
    @RequestMapping("/user/finish/project/index")
    public String userFinishIndex(){
        return "main/userFinishProject";
    }

    @RequiresAuthentication
    @RequiresRoles("1")
    @RequestMapping(value="/api/v1/project",method= RequestMethod.PUT)
    @ResponseBody
    public MessageReturn updateProject(@RequestBody Project project) {
        return projectService.updateProject(project);
    }

    @RequestMapping(value="/get/project/list/page",method= RequestMethod.POST)
    @ResponseBody
    public List<Project> getProjects(@RequestBody Pager pager) {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        User user= (User) session.getAttribute("user");
        return projectService.getProjectList(pager,user);
    }

    //终止项目
    @RequiresAuthentication
    @RequiresRoles("1")
    @RequestMapping(value="/api/v1/project/stop",method= RequestMethod.PUT)
    @ResponseBody
    public MessageReturn stopProject(@RequestBody Project project) {
        return projectService.stopProject(project);
    }

    @RequestMapping(value="/api/v1/project/type/list",method= RequestMethod.GET)
    @ResponseBody
    public List<ProjectType> getProjectTypes() {
        return projectService.getProjectTypeList();
    }


    /*@RequestMapping(value="/project/excel/download",method= RequestMethod.POST)
    @ResponseBody
    public MessageReturn downloadExcel(HttpServletResponse response) {
        projectService.downloadExcelWithPOI(null,response);
        return null;
    }*/
    @RequiresAuthentication
    @RequiresRoles("1")
    @RequestMapping(value="/project/excel/download",method= RequestMethod.POST)
    @ResponseBody
    public MessageReturn downloadExcel(@RequestBody Pager pager) {
        Session session = SecurityUtils.getSubject().getSession();
        User user= (User) session.getAttribute("user");
        return projectService.downloadExcel(pager,user);
    }


    //确认结项
    @RequiresAuthentication
    @RequiresRoles("2")
    @RequestMapping(value="/api/v1/project/finish",method= RequestMethod.PUT)
    @ResponseBody
    public MessageReturn finishProject(@RequestBody Project project) {
        return projectService.finishProject(project);
    }


}
