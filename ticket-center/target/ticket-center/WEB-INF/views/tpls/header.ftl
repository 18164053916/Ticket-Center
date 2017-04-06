<!---头部--->
<div class="login_top" ng-app="ticketCenterApp" ng-controller="userLoginManageCtrl">

<#include "confirm_loginout.ftl">

    <h2>对外任务公示系统</h2>
    <ul class="top_right">
        <li>
            <span class="top_user">用户：
            <@shiro.principal/>
            </span>
        </li>
        <li>
            <a href="javascript:void(0)" class="top_out"  ng-click="doLoginOut()">退出</a>
        </li>
        <li>
            <a href="javascript:void(0)" class="top_password" ng-click="doUpdatePwd()">修改密码</a>
        </li>
    </ul>
</div>