package com.ticketcenter.controller;

import com.ticketcenter.model.*;
import com.ticketcenter.service.AuditService;
import com.ticketcenter.service.ProgressService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by LiHao on 2017/3/29.
 */
@Controller
@RequestMapping("/audit")
public class AuditController {


    @Autowired
    private ProgressService progressService;
    @Autowired
    private AuditService auditService;


    //该功能必须登录才能访问，而且只有管理员(role=1)才能访问
    @RequiresAuthentication
    @RequiresRoles("1")
    @RequestMapping(value="/index",method= RequestMethod.GET)
    public String toLogin(){
        return "main/auditIndex";
    }

    //该功能必须登录才能访问，而且只有管理人员(role=1)才能访问
    @RequiresAuthentication
    @RequiresRoles("1")
    @ResponseBody
    @RequestMapping(value="/list/{queryType}",method= RequestMethod.PUT)
    public List<Project> getProjectList(@RequestBody Pager pager, @PathVariable String queryType){
        Session session= SecurityUtils.getSubject().getSession();
        User user= (User) session.getAttribute("user");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<String> sundayList=getDayList();
        String first_sunday=null;
        String last_sunday=null;
        if(null!=sundayList){
            first_sunday=sundayList.get(0);
            last_sunday=sundayList.get(5);
        }
        List<Project> projectList=progressService.getProgressList(pager,first_sunday,last_sunday,user, queryType);
        for(int i=0;i<projectList.size();i++){
            Project project=projectList.get(i);
            List<Progress> progressList=project.getProgressList();
            if(progressList.size()<6){
                List<Progress> tempList=new ArrayList<Progress>();
                for(int m=0;m<6;m++){
                    tempList.add(new Progress());
                }
                for(int s=0;s<progressList.size();s++){
                    Date endDate=progressList.get(s).getEndDate();
                    String end_date=sdf.format(endDate);
                    int temp_index=sundayList.indexOf(end_date);
                    tempList.set(temp_index,progressList.get(s));
                }
                project.setProgressList(tempList);

            }

        }

        return projectList;
    }


    //该功能必须登录才能访问，而且只有管理员(role=1)才能访问
    @RequiresAuthentication
    @RequiresRoles("1")
    @RequestMapping(value="/insert",method= RequestMethod.PUT)
    @ResponseBody
    public MessageReturn insertAuditLog(@RequestBody AuditLog auditLog) {

        Session session=SecurityUtils.getSubject().getSession();
        User currentUser= (User) session.getAttribute("user");

        return auditService.insertAuditLog(auditLog,currentUser);


    }


    //得到前六周的星期天
    @RequestMapping(value = "/getDayList",method = RequestMethod.GET)
    @ResponseBody
    public List<String> getDayList(){
        List<String> dayList=new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        // Calendar默认周日为第一天, 所以设置为1
        cal.set(Calendar.DAY_OF_WEEK, 7);
        cal.add(cal.DATE,1);
        dayList.add(sdf.format(cal.getTime()));
        for(int i=0;i<5;i++){
            cal.add(cal.DATE,-7);
            dayList.add(sdf.format(cal.getTime()));
        }
        Collections.reverse(dayList);
        return dayList;
    }


}
