<#-- 引入布局指令的命名空间 -->


<#import "application.ftl" as appMain>
<#assign base=request.contextPath />
<#--引入自定义的js-->



<#-- 调用布局指令 -->
<@appMain.layout>
<!---右侧列表页--->
<div class="right_main" ng-controller="userManagementCtrl">

    <#include "../tpls/user_update.ftl">

    <#include "../tpls/user_delete_alert.ftl">


    <!--右侧头部说明-->
    <div class="r_main_top"></div>

    <!--右侧主要内容区域-->
    <div class="main_in">
        <div class="table_top"><!---列表操作栏-->
            <ul class="action_bar f_left">
                <li>
    <@shiro.hasRole name="1">
                    <a href="javascript:;" ng-click="addUser()" class="adduser"  title="添加用户"><img src="${base}/themes/imges/icon09.png"><span>添加用户</span></a>
    </@shiro.hasRole>
                </li>
            </ul>
        </div>

        <!--列表-->
        <div class="table_box">
            <div class="table_in  clearfix">
                <table cellpadding="0" cellspacing="0" class="fx_table_con">
                    <thead>
                    <tr class="table_head">
                        <th title="序号">序号</th>
                        <th title="用户名">用户名</th>
                        <th title="显示名">显示名</th>
                        <th title="系统角色">系统角色</th>
                        <th title="项目角色">项目角色</th>
                        <th title="操作">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="u in userList">
                            <td>{{$index+1}}</td>
                            <td>{{::u.name}}</td>
                            <td>{{::u.displayName}}</td>
                            <td>{{::u.roleDesc}}</td>
                            <td>{{projectRoles[u.proType]}}</td>
                            <td>
                                <div class="table_btn">
    <@shiro.hasRole name="1">
                                    <a ng-click="modify(u)" class="bnt blue">编辑</a>
                                    <a ng-click="deleteAlert(u)" class="bnt red delet_user">删除</a>
    </@shiro.hasRole>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
                <!---翻页--->
                <div class="tcdPageCode pa">
                </div>

        </div>
    </div>
</div>
</@appMain.layout>
