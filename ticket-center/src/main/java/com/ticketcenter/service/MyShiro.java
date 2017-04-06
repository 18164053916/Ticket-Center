package com.ticketcenter.service;

import com.ticketcenter.constants.Constants;
import com.ticketcenter.model.User;
import com.ticketcenter.util.MD5Utils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by LiHao on 2017/3/20.
 */
@Service
public class MyShiro extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //UsernamePasswordToken对象用来存放提交的登录信息
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;

        //查出是否有此用户
        //到数据库查是否有此对象
        List<User> userList=userService.queryUsersByName(token.getUsername());
        User user=null;
        if(null!=userList&&userList.size()>0){
            user=userList.get(0);
            if(user!=null){
                //若存在，将此用户存放到登录认证info中
                    this.setName(user.getName());
                ((UsernamePasswordToken) authenticationToken).setHost(String.valueOf(user.getId()));
                    return new SimpleAuthenticationInfo(user.getDisplayName(), user.getPassword(), getName());
            }
        }

        return null;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录时输入的用户名
        String userName=getName();
        //到数据库查是否有此对象
        List<User> userList=userService.queryUsersByName(userName);
        User user=null;
        if(null!=userList&&userList.size()>0){
            user=userList.get(0);
            if(user!=null){
                //权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
                SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
                //得到用户的系统权限
                 int sysType=user.getRoleId();
                info.addRole(String.valueOf(sysType));


               /* Set<String> roles =new HashSet<String>();
                roles.add(String.valueOf(sysType));
                //用户的角色集合
                info.setRoles(roles);*/
                //用户的角色对应的所有权限，如果只使用角色定义访问权限，下面的四行可以不要
              /*  List<Role> roleList=user.getRoleList();
                for (Role role : roleList) {
                    info.addStringPermissions(role.getPermissionsName());
                }*/
                return info;
            }
        }

        return null;
    }
}
