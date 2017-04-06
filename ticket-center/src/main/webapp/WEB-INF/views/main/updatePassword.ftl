<#-- 引入布局指令的命名空间 -->
<@shiro.hasAnyRoles name="1,2" >
<#assign base=request.contextPath />
<#include "../tpls/css_js.ftl">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>修改密码</title>

</head>

<script type="text/javascript">
    var baseUrl ='${base}';
</script>

<body id="login_body" ng-app="ticketCenterApp" ng-controller="userUpdatePwd">
<div class="login_top">
    <h2>任务信息公示系统——修改密码</h2>
</div>
<div class="password_box">
    <span class="login_ts"  ng-bind='errorTips'></span>
    <ul class="login_in">
        <li>
            <label>用户名：</label>
            <span><@shiro.principal/></span>
        </li>
        <li>
            <label>原始密码：</label>
            <input ng-model="user.password" type="password"
                   class="input_txt" required placeholder="必填">
        </li>
        <li>
            <label>新密码：</label>
            <input ng-model="user.newPassword" type="password"
                   class="input_txt" required placeholder="必填">
        </li>
        <li>
            <label>确认新密码：</label>
            <input ng-model="repeatPassword" type="password"
                   class="input_txt" required placeholder="必填">
        </li>
    </ul>
    <div class="login_btn_box">
        <button type="submit" class="bnt blue f_left" id="login" ng-click="updatePwd()">保存</button>
        <button type="button" class="bnt black f_right" id="back" onclick="history.go(-1)">返回</button>
    </div>
</div>
</body>



</html>
</@shiro.hasAnyRoles>