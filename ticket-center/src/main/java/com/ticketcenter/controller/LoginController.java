package com.ticketcenter.controller;

import com.ticketcenter.model.User;
import com.ticketcenter.service.UserService;
import com.ticketcenter.util.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

/**
 * Created by LiHao on 2017/3/17.
 * 登录的controller
 */

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserService userService;


    @RequestMapping(value="/index",method= RequestMethod.GET)
            public String toLogin(){
                return "main/login";
     }


    @RequestMapping(value="/loginTo",method= RequestMethod.POST)
    @ResponseBody
    public String login(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("application/json;charset=UTF-8");
        try {
            String tempPwd=MD5Utils.EncoderByMd5(user.getPassword());
            user.setPassword(tempPwd);
            UsernamePasswordToken token = new UsernamePasswordToken(user.getName(), user.getPassword());
            token.setRememberMe(true);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            //得到用户名
            String user_id=token.getHost();
            Session session=subject.getSession();
            user.setId(Integer.parseInt(user_id));
            user.setLastLoginDate(new Date());
            session.setAttribute("user",user);
            String message=null;
            //如果登录成功
            if (subject.isAuthenticated()) {
                //如果是管理员，则跳转到管理员的菜单
                if(subject.hasRole("1")){
                    user.setRoleId(1);
                    userService.updateUserLoginStatus(user);
                    response.getWriter().write("{\"url\":\"/audit/index\",\"message\":\"登录成功\"}");
                }
                //如果是维护人员,则跳转到维护人员的菜单
               else if(subject.hasRole("2")){
                    user.setRoleId(2);
                    userService.updateUserLoginStatus(user);
                    response.getWriter().write("{\"url\":\"/progress/index\",\"message\":\"登录成功\"}");
                }
                 //如果是开发人员，不让他登录
                else if(subject.hasRole("3")){
                    response.getWriter().write("{\"message\":\"您的账号无权限登录\"}");
                }

            } else {
                response.getWriter().write("{\"message\":\"登录失败，请联系管理员\"}");
            }

        }
        catch (UnknownAccountException ex) {//用户名没有找到。
            response.getWriter().write("{\"message\":\"用户名或密码错误\"}");
        }
        catch (IncorrectCredentialsException ex) {//用户名密码不匹配。
            response.getWriter().write("{\"message\":\"用户名或密码错误\"}");
        }
        catch (AuthenticationException e) {
            response.getWriter().write("{\"message\":\"登录失败，请联系管理员\"}");
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();

        }

        return null;

    }



    @RequestMapping(value="/logout",method=RequestMethod.GET)
    public void logout(HttpServletRequest request, HttpServletResponse response){
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息
        SecurityUtils.getSubject().logout();
        response.setContentType("application/json;charset=UTF-8");
        try {
            response.getWriter().write("{\"message\":\"您已安全退出\"}");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping(value="/unauthorized",method= RequestMethod.GET)
         public String loginUnauthorized(){
        if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "main/login";
        }
        return "main/login";

    }


    //修改密码跳转
    @RequestMapping(value="/toUpdatePwd",method= RequestMethod.GET)
    public String toUpdatePwd(){
        if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "main/login";
        }
        else{
            return "main/updatePassword";
        }


    }

    @RequestMapping(value="/updatePwd",method= RequestMethod.POST)
    @ResponseBody
    public void updatePwd(@RequestBody User user, HttpServletRequest request, HttpServletResponse response){
        Session session=SecurityUtils.getSubject().getSession();
        User currentUser= (User) session.getAttribute("user");
        user.setId(currentUser.getId());
        response.setContentType("application/json;charset=UTF-8");
        try {
            String inputOldPwd=MD5Utils.EncoderByMd5(user.getPassword());
            //如果输入的旧密码和原有的旧密码不匹配
            if(!inputOldPwd.equals(currentUser.getPassword())){
                response.getWriter().write("{\"message\":\"旧密码输入有误，请重新输入!\"}");
            }
            else{
                user.setPassword(MD5Utils.EncoderByMd5(user.getNewPassword()));
                userService.updateUserPwd(user);
                response.getWriter().write("{\"message\":\"密码修改成功，请重新登录！\"}");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

    }


}
