package com.ticketcenter.service.impl;

import com.ticketcenter.constants.Constants;
import com.ticketcenter.dao.UserDAO;
import com.ticketcenter.model.MessageReturn;
import com.ticketcenter.model.User;
import com.ticketcenter.service.UserService;
import com.ticketcenter.util.MD5Utils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lihao on 2017/3/16.
 */
@Service
public class UserServiceImpl implements UserService {

    private Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    UserDAO userDao;


    /*public MessageReturn addUser(User user) {
        MessageReturn msg = new MessageReturn();
        try {
            userDao.addUser(user);
            msg.setStatus(0);
        }catch (Exception e){
            // TODO: 2017/3/21 rizhi
            e.printStackTrace();
            msg.setStatus(-500).setErrmsg(e.getMessage());
            log.info(msg.toString());
        }
        return msg;
    }*/

    public MessageReturn deleteUser(int id){
        MessageReturn msg = new MessageReturn();
        try {
            userDao.deleteUser(id);
        }catch (Exception e){
            // TODO: 2017/3/21 rizhi
            e.printStackTrace();
            msg.setStatus(-500).setErrmsg(e.getMessage());
            log.info(msg.toString());
        }
        return msg;
    }


    @Override
    public List<User> getUserList(int current,int pageSize) {
        List<User> list = null;
        try {
            list=userDao.getUsers(pageSize,(current-1)*pageSize);
        }catch (Exception e){
            log.info(new MessageReturn().setErrmsg(e.getMessage()).toString());
        }
        return list;
    }

    @Override
    public List<User> getUserList() {
        List<User> list = null;
        try {
            list=userDao.getAllUsers();
        }catch (Exception e){
            log.info(new MessageReturn().setErrmsg(e.getMessage()).toString());
        }
        return list;
    }


    @Override
    public MessageReturn updateUser(User user) {
        MessageReturn msg = new MessageReturn();
        try {
            if(user.getId()!=-1){
                userDao.updateUser(user);
            }else{
                user.setPassword(MD5Utils.EncoderByMd5(Constants.DEFAULT_PASSWORD));
                userDao.addUser(user);
            }
            msg.setStatus(0);
        }catch (Exception e){
            // TODO: 2017/3/21 rizhi
            e.printStackTrace();
            msg.setStatus(-500).setErrmsg(e.getMessage());
            log.info(msg.toString());
        }
        return msg;
    }

    public List<User> queryUsersByName(String userName) {
        return userDao.queryUsersByName(userName);
    }


    public void updateUserLoginStatus(@Param("user") User user){
         userDao.updateUserLoginStatus(user);
    }

    public void updateUserPwd(@Param("user") User user){
        userDao.updateUserPwd(user);
    }
}
