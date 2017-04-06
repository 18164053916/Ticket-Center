package com.ticketcenter.service;

import com.ticketcenter.model.MessageReturn;
import com.ticketcenter.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by admin on 2017/3/16.
 */
public interface UserService {


    MessageReturn deleteUser(int id);


    MessageReturn updateUser(User user);


    List<User> getUserList(int current,int pageSize);

    List<User> getUserList();


    public List<User> queryUsersByName(String userName);


    public void updateUserLoginStatus(@Param("user") User user);

    public void updateUserPwd(@Param("user") User user);

}
