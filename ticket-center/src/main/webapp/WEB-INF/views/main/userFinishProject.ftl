<#-- 引入布局指令的命名空间 -->
<#import "application.ftl" as appMain>

<#-- 调用布局指令 -->
<@appMain.layout>
<!---右侧列表页--->
<div class="right_main" ng-controller="userFinishProjectCtrl">
    <!--右侧头部说明-->
    <div class="r_main_top"></div>

    <#include "../tpls/check_details.ftl">

    <!--右侧主要内容区域-->
    <div class="main_in">
        <div class="table_top"><!---列表操作栏-->
            <div class="table_input_box">
                <ul class="search_box">
                    <li>
                        <label>项目名称</label>
                        <input type="text" ng-model="pager.filter.name" class="input_search">
                    </li>
                    <li>
                        <label>项目编号</label>
                        <input type="text" ng-model="pager.filter.code" class="input_search">
                    </li>
                    <li>
                        <label>工单号</label>
                        <input type="text" ng-model="pager.filter.workOrderNumber" class="input_search">
                    </li>
                    <li>
                        <input name="提交" ng-click="search()" type="submit" value="搜索" class="search_btn">
                    </li>
                </ul>
            </div>
        </div>
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
                        <th title="实际结束实际">实际结束时间</th>
                        <th title="操作">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat=" p in projectList">
                        <td>{{p.workOrderNumber}}</td>
                        <td>{{p.code}}</td>
                        <td>{{p.name}}</td>
                        <td>{{p.typeName}}</td>
                        <td>{{p.estimatedDays}}</td>
                        <td>{{p.startDate}}</td>
                        <td>{{p.endDate}}</td>
                        <td ng-class="{'font-red':p.finishDate>p.endDate}">{{p.finishDate}}</td>
                        <td>
                            <div class="table_btn"><a class="bnt blue view_deta" ng-click="checkDetails(p)">查看详情</a></div>
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