package com.ticketcenter.service.impl;

import com.google.gson.Gson;
import com.ticketcenter.constants.Constants;
import com.ticketcenter.dao.ProjectDao;
import com.ticketcenter.model.*;
import com.ticketcenter.service.ProjectService;
import com.ticketcenter.util.ExcelUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by baron.wei on 2017/3/24.
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    private Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);


    @Autowired
    ProjectDao projectDao;


    @Override
    public MessageReturn updateProject(Project project) {
        MessageReturn msg = new MessageReturn();
        try {

            project.setUuid(UUID.randomUUID().toString());
            if(project.getId()!=-1){
                projectDao.updateProject(project);
            }else{
                projectDao.addProject(project);
            }
        }catch (Exception e){
            msg.setStatus(-500).setErrmsg(e.getMessage());
            logger.error(msg.toString());
            if(e.getMessage()!=null&&e.getMessage().contains("already exists")){
                msg.setErrmsg("项目名称或编码重复！");
            }
        }
        return msg;
    }


    @Override
    public List<Project> getProjectList(int current, int pageSize) {
        List<Project> list = null;
        try {
            list=projectDao.getProjects(pageSize,(current-1)*pageSize);
        }catch (Exception e){
            logger.error(new MessageReturn().setErrmsg(e.getMessage()).setStatus(-500).toString());
        }
        return list;
    }

    @Override
    public List<Project> getProjectList(Pager pager,User user) {
        List<Project> list = null;
        try {
            list=projectDao.getProjectsWithFilter(pager,user);
        }catch (Exception e){
            logger.error(new MessageReturn().setErrmsg(e.getMessage()).setStatus(-500).toString());
        }
        return list;
    }

    @Override
    public MessageReturn stopProject(Project project) {
        MessageReturn msg = new MessageReturn();
        try {
            projectDao.stopProject(project);
        }catch (Exception e){
            e.printStackTrace();
            msg.setStatus(-500).setErrmsg(e.getMessage());
            logger.error(msg.toString());
        }
        return msg;
    }

    @Override
    public List<ProjectType> getProjectTypeList() {
        List<ProjectType> list = null;
        try {
            list = projectDao.getProjectTypes();
        }catch (Exception e){
            logger.error(new MessageReturn().setErrmsg(e.getMessage()).setStatus(-500).toString());
        }
        return list;
    }


    public void downloadExcelWithPOI(Pager pager,HttpServletResponse response) {
       /* Workbook workBook=null;
        try {

            String json = "{\"current\":1,\"pageSize\":10,\"pageFlag\":false,\"filter\":{\"status\":\"doing\"}}";
            pager = new Gson().fromJson(json, Pager.class);

            pager.setPageFlag(false);
            List<Project> projectList = projectDao.getProjectsWithFilter(pager);

            if("doing".equals(pager.getFilter().get("status"))){
                String [] titles = {"工单号","项目编号","项目名称","项目类型","预估工作量（人天）","项目开始时间","计划结束时间",
                        "客户名称","开发接口人","现场接口人","需求接口人","进度维护人",
                        "项目人员","需求分类"};
                String [] contents = {"workOrderNumber","code","name","typeName","estimatedDays","startDate","endDate",
                        "customerName","developerKeyUser","sceneKeyUser","demandKeyUser","scheduleMaintenanceUserName",
                        "membersName","demandTypeName"};
                workBook = POIExcelUtil.createWorkBook(projectList, contents, titles);
            }
            //设置response
            setDownloadResponse(workBook,response);

        }catch (Exception e){
            logger.error(new MessageReturn().setErrmsg(e.getMessage()).setStatus(-500).toString());
        }*/
//        return workBook;
    }

    private void setDownloadResponse(Workbook workBook, HttpServletResponse response) throws Exception{
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try{
            workBook.write(os);
            byte[] content = os.toByteArray();
            InputStream is = new ByteArrayInputStream(content);
            // 设置response参数，可以打开下载页面
            response.reset();
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((UUID.randomUUID().toString()+".xls").getBytes(), "iso-8859-1"));
            ServletOutputStream out = response.getOutputStream();

            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        }finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
    }




    @Override
    public MessageReturn downloadExcel(Pager pager,User user) {
        MessageReturn msg =new MessageReturn();
        String uuid = null;
        try {
            pager.setPageFlag(false);
            List<Project> projectList = projectDao.getProjectsWithFilter(pager,user);

            uuid=UUID.randomUUID().toString();

            boolean flag = false;
            String fileName = Constants.DOWNLOAD_PATH+uuid+".xls";
            /*excel 导出*/
            if("doing".equals(pager.getFilter().get("status"))){
                String [] titles = {"工单号","项目编号","项目名称","项目类型","预估工作量（人天）","项目开始时间","计划结束时间",
                        "客户名称","开发接口人","现场接口人","需求接口人","进度维护人",
                        "项目人员","需求分类"};
                String [] contents = {"workOrderNumber","code","name","typeName","estimatedDays","startDate","endDate",
                        "customerName","developerKeyUser","sceneKeyUser","demandKeyUser","scheduleMaintenanceUserName",
                        "membersName","demandTypeName"};
                int [] columnSize={20,20,20,20,20,20,20,20,20,20,20,20,20,20};
                flag = ExcelUtils.creatExcel(projectList, titles, contents, columnSize, true, fileName);
            }else if("finish".equals(pager.getFilter().get("status"))){
                String [] titles = {"工单号","项目编号","项目名称","项目类型","预估工作量（人天）","项目开始时间","计划结束时间",
                        "实际结束时间","客户名称","开发接口人","现场接口人","需求接口人","进度维护人",
                        "项目人员","需求分类"};
                String [] contents = {"workOrderNumber","code","name","typeName","estimatedDays","startDate","endDate",
                        "finishDate","customerName","developerKeyUser","sceneKeyUser","demandKeyUser","scheduleMaintenanceUserName",
                        "membersName","demandTypeName"};
                int [] columnSize={20,20,20,20,20,20,20,20,20,20,20,20,20,20,20};
                flag = ExcelUtils.creatExcel(projectList, titles, contents, columnSize, true, fileName);
            }else if("stop".equals(pager.getFilter().get("status"))){
                String [] titles = {"工单号","项目编号","项目名称","项目类型","预估工作量（人天）","项目开始时间","计划结束时间",
                        "客户名称","开发接口人","现场接口人","需求接口人",
                        "项目人员","需求分类","终止原因"};
                String [] contents = {"workOrderNumber","code","name","typeName","estimatedDays","startDate","endDate",
                        "customerName","developerKeyUser","sceneKeyUser","demandKeyUser",
                        "membersName","demandTypeName","stopReason"};
                int [] columnSize={20,20,20,20,20,20,20,20,20,20,20,20,20,20};
                flag = ExcelUtils.creatExcel(projectList, titles, contents, columnSize, true, fileName);
            }

            if(!flag){
                uuid=null;
            }
        }catch (Exception e){
            e.printStackTrace();
            uuid=null;
            msg.setErrmsg(e.getMessage()).setStatus(-500);
            logger.error(msg.toString());
        }
        return msg.setStatus(0).setData(uuid);
    }

    @Override
    public MessageReturn finishProject(Project project) {
        MessageReturn msg = new MessageReturn();
        try {
            projectDao.finishProject(project);
        }catch (Exception e){
            msg.setStatus(-500).setErrmsg(e.getMessage());
            logger.error(msg.toString());
        }
        return msg;
    }
}
