package com.ticketcenter.controller;

import com.ticketcenter.model.MessageReturn;
import com.ticketcenter.model.User;
import com.ticketcenter.service.UserService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //该功能必须登录才能访问，而且只有管理员(role=1)才能访问
  @RequiresAuthentication
  @RequiresRoles("1")
    @RequestMapping("/user/management/index")
    public String index(){
        return "main/userManagement";
    }

    //该功能必须登录才能访问，而且只有管理员(role=1)才能访问
   @RequiresAuthentication
   @RequiresRoles("1")
    @ResponseBody
    @RequestMapping(value="/api/v1/user/list/page",method= RequestMethod.GET)
    public List<User> getUsers(int current,int pageSize){
        return userService.getUserList(current,pageSize);
    }

    //该功能必须登录才能访问，而且只有管理员(role=1)才能访问
    @RequiresAuthentication
   @RequiresRoles("1")
    @ResponseBody
    @RequestMapping(value="/api/v1/user/list",method= RequestMethod.GET)
    public List<User> getAllUsers(){
        return userService.getUserList();
    }

    @RequestMapping(value="/api/v1/user",method= RequestMethod.PUT)
    @ResponseBody
    public MessageReturn updateUser(@RequestBody User user) {
        return userService.updateUser(user);
    }

    //该功能必须登录才能访问，而且只有管理员(role=1)才能访问
  @RequiresAuthentication
   @RequiresRoles("1")
    @RequestMapping(value="/api/v1/user/{id}",method= RequestMethod.DELETE)
    @ResponseBody
    public MessageReturn updateUser(@PathVariable int id) {
        return userService.deleteUser(id);
    }








}
