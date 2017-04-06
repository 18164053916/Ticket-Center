package com.ticketcenter.controller;

import com.ticketcenter.constants.Constants;
import com.ticketcenter.model.*;
import com.ticketcenter.service.AuditService;
import com.ticketcenter.service.ProgressService;
import com.ticketcenter.service.ProjectService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by LiHao on 2017/3/24.
 * 项目进度信息维护
 */

@Controller
@RequestMapping("/progress")
public class ProgressCotroller {

    @Autowired
    private ProgressService progressService;


    //该功能必须登录才能访问，而且只有维护人员(role=2)才能访问
    @RequiresAuthentication
    @RequiresRoles("2")
    @RequestMapping(value="/index",method= RequestMethod.GET)
         public String toLogin(){

        return "main/progressIndex";
    }



    //该功能必须登录才能访问，而且只有维护人员(role=2)才能访问
    @RequiresAuthentication
    @RequiresRoles("2")
    @ResponseBody
    @RequestMapping(value="/list/{queryType}",method= RequestMethod.PUT)
    public List<Project> getProjectList(@RequestBody Pager pager,@PathVariable String queryType){
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
    @RequiresRoles("2")
    @RequestMapping(value="/add/{id}/{startDate}/{endDate}",method= RequestMethod.PUT)
    @ResponseBody
    public MessageReturn insertProgress(@RequestBody Progress progress,@PathVariable int id,
                                        @PathVariable String startDate,@PathVariable String endDate) {
        Session session=SecurityUtils.getSubject().getSession();
        User currentUser= (User) session.getAttribute("user");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date startNewDate = sdf.parse(startDate);
            progress.setStartDate(startNewDate);
            Date endNewDate = sdf.parse(endDate);
            progress.setEndDate(endNewDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(progress.getIsRisk()==0){
            progress.setIsRisk(1);
        }
        if(progress.getIsUpdated()==0){
            progress.setIsUpdated(1);
        }

        //如果有变更，要将t_projet表的is_updated改成2,如果有风险，要将t_projet表的is_risk改成2
        //新增了一个进度后，就要把t_project的is_audit字段改为2，表示该项目处于待审核状态

        //存在progressid,则该操作是针对t_audit_log表，将t_audit_log表原有记录的audit_flag字段改为2
        if(progress.getAuditLogId()>0){
            return progressService.updateProgress(progress);
        }
        //如果不存在progressid，则直接在t_progress表增加一条新记录
        else{
            return progressService.insertProgress(progress,id,currentUser);
        }




    }


    //该功能必须登录才能访问
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(value="/singleDetail/{progressId}",method= RequestMethod.GET)
    public List<Progress> getProgressById(@PathVariable int progressId){
          return progressService.getProgressById(progressId);
    }


    /**
     * 查询每个项目的变更情况和风险提示情况
     * @param queryType
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/progressOption/{projectId}/{queryType}",method= RequestMethod.GET)
    public List<Progress> getProgressOptions(@PathVariable int projectId,@PathVariable int queryType){
        return progressService.getProgressOptions(projectId,queryType);
    }


    //该功能必须登录才能访问，而且只有维护人员(role=2)才能访问
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(value="/details/{id}",method= RequestMethod.GET)
    public List<Progress> getProjectDetails(@PathVariable int id){
        return progressService.getProgressDetails(id);
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


    public static int getIntervalDays(String smdate,String bdate) throws ParseException{
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setTime(sdf.parse(smdate));
        long time1 = cal.getTimeInMillis();
        cal.setTime(sdf.parse(bdate));
        long time2 = cal.getTimeInMillis();
        long between_days=(time2-time1)/(1000*3600*24);
        return Integer.parseInt(String.valueOf(between_days));
    }


    public static void main(String[] args) {

        try {
            System.out.println("------------"+getIntervalDays("2017-02-26","2017-03-26"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }




}
