package com.ticketcenter.dao;

import com.ticketcenter.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Lihao on 2017/3/16.
 */
@Repository
public interface UserDAO {

    void addUser(@Param("user") User user);


    void updateUser(@Param("user") User user);

    public void updateUserLoginStatus(@Param("user") User user);

    public void updateUserPwd(@Param("user") User user);

    void deleteUser(int id);


    List<User> queryUsersByName(String userName);

    /**
     * 从 offset 条开始  去 limit 条 数据。
     * @param limit
     * @param offset
     * @return
     */
    List<User> getUsers(@Param("limit") int limit, @Param("offset") int offset);

    List<User> getAllUsers();



}