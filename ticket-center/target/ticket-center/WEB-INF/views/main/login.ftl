<#-- 引入布局指令的命名空间 -->
<#assign base=request.contextPath />
<#include "../tpls/css_js.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>

</head>

<script type="text/javascript">
    var baseUrl ='${base}';
</script>


<body id="login_body" ng-app="ticketCenterApp" ng-controller="userLoginCtrl">
<div class="login_top" >
    <h2>任务信息公示系统</h2>
</div>

<div class="login_box">
    <span class="login_ts"  ng-bind='errorTips'></span>
    <ul class="login_in">
        <li>
            <label>用户名：</label>
            <input ng-model="user.name" type="text" class="input_txt" required>
        </li>
        <li>
            <label>密码：</label>
            <input ng-model="user.password" type="password" class="input_txt" required>
        </li>
    </ul>
    <div class="login_btn_box">

        <button type="button" class="bnt blue f_left"
                id="login" ng-click="doLogin()">登录</button>
        <button type="button" class="bnt black f_right" id="back">返回</button>
    </div>
</div>
</body>

</html>
