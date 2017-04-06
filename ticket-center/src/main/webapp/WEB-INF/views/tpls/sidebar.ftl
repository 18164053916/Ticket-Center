<#assign base=request.contextPath />
<a id="left-panel-link" href="#left-panel" class="left_panel_btn"></a>
<!---左侧导航--->
<!-- 管理员 -->
<@shiro.user>
<@shiro.hasRole name="1">
    <div class="left_navbox" id="left-panel" ng-controller="siderbarCtrl">
        <ul class="topnav topnav-block">
            <li><a ng-click="active('${base}/audit/index','nav01')"  href="" class="nav01" ng-class="{active:siderbarActive=='nav01'}">审核进度</a></li><!---选中的导航加active样式--->
            <li><a href="" class="nav02">项目管理</a>
                <ul>
                    <li><a ng-click="active('${base}/project/management/index','doing')" href="" ng-class="{active:siderbarActive=='doing'}">进行中项目</a></li><!---选中的导航加active样式--->
                    <li><a ng-click="active('${base}/project/management/index','finish')" href="" ng-class="{active:siderbarActive=='finish'}">已完成项目</a></li>
                    <li><a ng-click="active('${base}/project/management/index','stop')" href="" ng-class="{active:siderbarActive=='stop'}">异常终止项目</a></li>
                </ul>
            </li>
            <li><a href="" ng-click="active('${base}/user/management/index','nav03')" ng-class="{active:siderbarActive=='nav03'}" class="nav03">用户管理</a></li>
            <li><a href="admin_page04.html" class="nav04" >我的消息</a></li>
        </ul>
    </div>
    </@shiro.hasRole>
</@shiro.user>

<@shiro.user>
    <@shiro.hasRole name="2">
    <div class="left_navbox" id="left-panel"  ng-controller="siderbarCtrl">
        <ul class="topnav">
            <li><a ng-click="active('${base}/progress/index','nav02')" href="" class="nav02" ng-class="{active:siderbarActive=='nav02'}">我的项目</a></li>
            <li><a ng-click="active('${base}/user/finish/project/index','nav05')" href="" ng-class="{active:siderbarActive=='nav05'}" class="nav05">已完成的</a></li>
            <li><a href="#" class="nav04">我的消息</a><span class="news_t">3</span>
                <ul>
                    <li><a href="user_page03_1.html">未读消息</a></li>
                    <li><a href="user_page03_2.html">历史消息</a></li>

                </ul>
            </li>
        </ul>
    </div>
    </@shiro.hasRole>
</@shiro.user>
