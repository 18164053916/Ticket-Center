package com.ticketcenter.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.print.attribute.standard.DateTimeAtCompleted;
import java.util.Date;

/**
 * Created by admin on 2017/3/16.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class User {

    private int id=-1;

    //登录名称
    private String name;

    private String password;

    //显示名称
    private String displayName;

    //用户状态
    private String status;

    //用户创建是时间
    private Date createTime;

    //用户最后登录的时间
    private Date lastLoginDate;

    //项目类型
    private String proType;

    //角色ID
    private int roleId;

    //角色描述，管理员，维护人员或者开发人员
    private String roleDesc;


    //权限的URL
    private String permissionUrl;

    //权限的名称
    private String permissionName;

    //权限的class类
    private String permissionClass;

    private int total;

    private int sysType;

    //用户输入的新密码
    private String newPassword;


    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public String getProType() {
        return proType;
    }

    public void setProType(String proType) {
        this.proType = proType;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public String getPermissionUrl() {
        return permissionUrl;
    }

    public void setPermissionUrl(String permissionUrl) {
        this.permissionUrl = permissionUrl;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public int getSysType() {
        return sysType;
    }

    public void setSysType(int sysType) {
        this.sysType = sysType;
    }

    public String getPermissionClass() {
        return permissionClass;
    }

    public void setPermissionClass(String permissionClass) {
        this.permissionClass = permissionClass;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
