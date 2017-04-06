<#-- 引入布局指令的命名空间 -->
    <@shiro.hasRole name="2">
    <#import "application.ftl" as appMain>
    <#assign base=request.contextPath />
<#--引入自定义的js-->

<script type="text/javascript">
    var baseUrl ='${base}';
</script>

<#-- 调用布局指令 -->
    <@appMain.layout>
    <!---右侧列表页--->
    <div class="right_main" ng-app="ticketCenterApp" ng-controller="progressIndexCtrl">
        <#include "../tpls/add_progress.ftl">
        <#include "../tpls/confirm_end.ftl">
        <#include "../tpls/check_details.ftl">
        <!--右侧头部说明-->
        <div class="r_main_top">
            <p>周进度状态：<span class="t_gray">需添加</span>、<span class="t_blue">未审核</span>、<span class="t_green">已审核</span>、<span class="t_red">审核未通过</span></p>
        </div>

        <!--右侧主要内容区域-->
        <div class="main_in">
            <div class="table_top"><!---列表操作栏-->
                <div class="table_input_box">
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
                            <label>工单号</label>
                            <input ng-model="pager.filter.workOrderNo" type="text" class="input_search">
                        </li>
        <@shiro.hasRole name="2">
                        <li>
                            <input ng-click="search()" name="提交" type="button" value="搜索" class="search_btn">
                        </li>
        </@shiro.hasRole>
                    </ul>
                </div>
            </div>
            <div class="table_box">
                <div class="table_in  clearfix">
                    <table cellpadding="0" cellspacing="0" class="fx_table_con" id="gridTable">
                        <thead>
                        <tr class="table_head">
                            <th colspan="7" title="">&nbsp;</th>
                            <th colspan="6" title="">最近6周的项目进度添加情况</th>
                            <th title="">&nbsp;</th>
                        </tr>
                        <tr class="table_head">
                            <th title="工单号" class="plr50">工单号</th>
                            <th title="项目编号" class="plr50">项目编号</th>
                            <th title="项目名称" class="plr50">项目名称</th>
                            <th title="项目类型" class="plr50">项目类型</th>
                            <th title="预估工作量（人天）">预估工作量（人天）</th>
                            <th title="项目开始时间">项目开始时间</th>
                            <th title="计划结束时间">计划结束时间</th>
                            <th ng-repeat="r in days" title="{{r}}">{{r}}</th>
                            <th title="操作">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="u in projectList">
                            <td>{{::u.workOrderNumber}}</td>
                            <td>{{::u.code}}</td>
                            <td>{{::u.name}}</td>
                            <td>{{::u.proTypeName}}</td>
                            <td>{{::u.estimatedDays}}</td>
                            <td>{{::u.startDate| date:'yyyy-MM-dd'}}</td>
                            <td>{{::u.endDate| date:'yyyy-MM-dd'}}</td>
                            <td ng-repeat="progress in u.progressList">
                              <span ng-if="checkShown(u,$index)&&progress.auditLog.auditResult=='1'" class="t_green">已审核</span>
                                <a class="t_red" ng-if="checkShown(u,$index)&&progress.auditLog.auditResult=='2'" ng-click="reAddItem(u,progress,$index,$event)">审核未通过</a>
                                <span class="t_blue" ng-if="checkShown(u,$index)&&!progress.auditLog&&progress.id!='0'">待审核</span>
                                <a class="t_gray additem" ng-if="checkShown(u,$index)&&!progress.auditLog&&progress.id=='0'"
                                   ng-click="addItem(u,$index,$event)">需添加</a>
                            </td>
                            <td>
                                <div class="table_btn">
        <@shiro.hasRole name="2">
                  <a class="bnt black enditem " ng-click="confirmEnd(u)">确认结项</a>
                  <a class="bnt blue view_deta" ng-click="checkDetails(u)">查看详情</a>
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

    </section>


    </body>



    </@appMain.layout>
    </@shiro.hasRole>