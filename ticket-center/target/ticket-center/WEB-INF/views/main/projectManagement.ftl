<#-- 引入布局指令的命名空间 -->
<#import "application.ftl" as appMain>
<#assign base=request.contextPath />

<script type="text/javascript">
    <#if RequestParameters["status"]??>
        var status = '${RequestParameters["status"]}';
    </#if>



</script>

<#-- 调用布局指令 -->
<@appMain.layout>

<!---右侧列表页--->
<div class="right_main" ng-controller="projectCtrl">

    <#--添加 编辑项目-->
    <#include "../tpls/project_update.ftl">

    <#--终止项目-->
    <#include "../tpls/project_end.ftl">

    <#--详情显示-->
        <#include "../tpls/check_details.ftl">



    <!--右侧头部说明-->
    <div class="r_main_top"></div>
    <!--右侧主要内容区域-->
    <div class="main_in">
        <div class="table_top"><!---列表操作栏-->
            <ul class="action_bar f_left">
                <li ng-if="siderbarActive=='doing'">
                    <a href="javascript:;" ng-click="addProject()" l class="additem"  title="添加项目"><img src="${base}/themes/imges/icon09.png"><span>添加项目</span></a>
                </li>
                <li>
                    <a href="javascript:;" ng-click="downloadExcel()" title="导出Execl"><img src="${base}/themes/imges/icon15.png"><span>导出Execl</span></a>
                </li>
            </ul>
            <div class="table_input_box"><!--搜索-->
                <ul class="search_box">
                    <li>
                        <label>项目名称</label>
                        <input ng-model="pager.filter.name" type="text" class="input_search">
                    </li>
                    <li>
                        <label>项目编号</label>
                        <input ng-model="pager.filter.code" type="text" class="input_search">
                    </li>
                    <li>
                        <label>客户名称</label>
                        <input ng-model="pager.filter.work" type="text" class="input_search">
                    </li>
                    <li>
                        <input ng-click="search()" name="提交" type="submit" value="搜索" class="search_btn">
                    </li>
                </ul>
            </div>
        </div>

        <!--列表-->
        <div class="table_box">
            <div class="table_in  clearfix">
                <table cellpadding="0" cellspacing="0" class="fx_table_con">
                    <thead>
                    <tr class="table_head">
                        <th title="工单号" class="plr50">工单号</th>
                        <th title="项目编号" class="plr50">项目编号</th>
                        <th title="项目名称" class="plr50">项目名称</th>
                        <th title="项目类型" class="plr50">项目类型</th>
                        <th title="预估工作量（人天）">预估工作量（人天）</th>
                        <th title="项目开始时间">项目开始时间</th>
                        <th title="计划结束时间">计划结束时间</th>
                        <th ng-if="siderbarActive!='doing'" title="实际结束时间">实际结束时间</th>
                        <th title="客户名称">客户名称</th>
                        <th title="开发接口人">开发接口人</th>
                        <th title="现场接口人">现场接口人</th>
                        <th title="需求接口人">需求接口人</th>
                        <th ng-if="siderbarActive!='stop'" title="进度维护人">进度维护人</th>
                        <th title="项目人员" class="plr50">项目人员</th>
                        <th title="需求分类">需求分类</th>
                        <th ng-if="siderbarActive=='stop'" title="终止原因">终止原因</th>
                        <th title="操作">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in projectList|filter:membersNameFilter">
                            <td name="工单号">{{::p.workOrderNumber}}</td>
                            <td name="项目编号">{{::p.code}}</td>
                            <td name="项目名称">{{::p.name}}</td>
                            <td name="项目类型">{{::p.typeName}}</td>
                            <td name="预计人天">{{::p.estimatedDays}}</td>
                            <td name="开始时间">{{::p.startDate}}</td>
                            <td name="预计结束时间">{{::p.endDate}}</td>
                            <td name="实际结束时间" ng-class="{'font-red':p.finishDate>p.endDate}" ng-if="siderbarActive!='doing'">{{::p.finishDate}}</td>
                            <td name="客户">{{::p.customerName}}</td>
                            <td name="开发接口人">{{::p.developerKeyUser}}</td>
                            <td name="现场接口人">{{::p.sceneKeyUser}}</td>
                            <td name="需求接口人">{{::p.demandKeyUser}}</td>
                            <td name="进度维护人" ng-if="siderbarActive!='stop'">{{::p.scheduleMaintenanceUserName}}</td>
                            <td name="项目成员">{{::p.membersName}}</td>
                            <td name="需求类型">{{::p.demandTypeName}}</td>
                            <td name="终止原因" ng-if="siderbarActive=='stop'">{{::p.stopReason}}</td>
                            <td name="操作">
                                <div ng-if="siderbarActive=='doing'" class="table_btn">
                                    <a ng-click="modify(p)" class="bnt blue">编辑</a>
                                    <a ng-click="showStop(p)" class="bnt red cut_off">终止项目</a>
                                </div>
                                <div ng-if="siderbarActive!='doing'" class="table_btn">
                                    <a ng-click="showDetail(p)" class="bnt blue view_deta">查看详情</a>
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