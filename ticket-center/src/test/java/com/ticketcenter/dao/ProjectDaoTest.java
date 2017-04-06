package com.ticketcenter.dao;

import com.google.gson.Gson;
import com.junit.Base4Junit;
import com.ticketcenter.model.Pager;
import com.ticketcenter.model.Progress;
import com.ticketcenter.model.Project;
import com.ticketcenter.model.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by LiHao on 2017/3/30.
 */
public class ProjectDaoTest extends Base4Junit{

    @Autowired
    ProjectDao dao;
    @Test
    public void test1(){
        User user = new User();
        user.setId(2);
        Pager pager=new Pager();
        pager.setCurrent(1);
        pager.setPageSize(10);
        try {
            List<Project> progressList = dao.getProgressList(pager, "2017-02-26", "2017-04-02", user,"ADMIN");

            for (Project p : progressList){
                if(p.getProgressList()!=null){
                        System.out.println(new Gson().toJson(p.getProgressList()));

                }else{
                    System.out.println(" is null");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }


    }

}