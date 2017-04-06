
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录成功</title>
</head>
<body>
<table width="1500" height="600" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="500" height="200"><div align="center">
        <@shiro.hasRole name="1">
            我是管理员
        </@shiro.hasRole>
        <@shiro.hasRole name="2">
            我是维护人员
        </@shiro.hasRole>

  </div></td>
    </tr>

    <tr>
        <td><@shiro.authenticated>
            <li><a href="/user/center"><@shiro.principal></@shiro.principal></a></li>

            <li><a href="/signout">退出</a></li>
        </@shiro.authenticated>
        <@shiro.user>
            <@shiro.principal></@shiro.principal>
        </@shiro.user>
        </td>

    </tr>
</table>
</body>
</html>