package com.ticketcenter.model;

/**
 * Created by LiHao on 2017/3/20.
 */
public class SystemRole {

    private int id;

    private int sysRoleType;

    private String sysRoleDesc;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSysRoleType() {
        return sysRoleType;
    }

    public void setSysRoleType(int sysRoleType) {
        this.sysRoleType = sysRoleType;
    }

    public String getSysRoleDesc() {
        return sysRoleDesc;
    }

    public void setSysRoleDesc(String sysRoleDesc) {
        this.sysRoleDesc = sysRoleDesc;
    }
}
