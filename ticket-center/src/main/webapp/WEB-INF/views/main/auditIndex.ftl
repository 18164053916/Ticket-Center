<#-- 引入布局指令的命名空间 -->
<@shiro.authenticated>
    <#import "application.ftl" as appMain>
    <#assign base=request.contextPath />

<#--引入自定义的js-->

<script type="text/javascript">
    var baseUrl ='${base}';
</script>

<#-- 调用布局指令 -->
    <@appMain.layout>
<!---右侧列表页--->
<div class="right_main" ng-app="ticketCenterApp" ng-controller="auditIndexCtrl">
    <#include "../tpls/check_details.ftl">
    <#include "../tpls/audit_progress.ftl">
    <#include "../tpls/deny_audit.ftl">
    <#include "../tpls/risk_tips.ftl">
    <#include "../tpls/updated_tips.ftl">
    <!--右侧头部说明-->
    <div class="r_main_top">
        <p>周进度状态：<span class="t_gray">未提交</span>、<span class="t_blue">待审核</span>、<span class="t_green">已审核</span>、<span class="t_red">审核未通过</span></p>
    </div>

    <!--右侧主要内容区域-->
    <div class="main_in">
        <div class="table_top"><!---列表操作栏-->
            <ul class="action_bar f_left">
                <li>
                    <a href="javascript:;" class="active" title="所有待审核项目置顶" ng-click="toTop()"><img src="${base}/themes/imges/icon14.png"><span>所有待审核项目置顶</span></a><!--点击置顶后加入样式active-->
                </li>
            </ul>
            <div class="table_input_box">
                <ul class="search_box">
                    <li>
                        <label>风险提示</label>
                        <select class="input_search w80" ng-model="pager.filter.isRisk">
                            <option></option>
                            <option value="2">有提示</option>
                            <option value="1">无提示</option>
                        </select>
                    </li>
                    <li>
                        <label>变更提示</label>
                        <select class="input_search w80" ng-model="pager.filter.isUpdated">
                            <option></option>
                            <option value="2">有变更</option>
                            <option value="1">无变更</option>
                        </select>
                    </li>
                    <li>
                        <label>项目名称</label>
                        <input type="text" ng-model="pager.filter.name" class="input_search">
                    </li>
                    <li>
                        <label>项目编号</label>
                        <input type="text" ng-model="pager.filter.code" class="input_search">
                    </li>
                    <li>
                        <input name="提交" type="button" ng-click="search()" value="搜索" class="search_btn">
                    </li>
                </ul>
            </div>
        </div>
        <div class="table_box">
            <div class="table_in  clearfix">
                <table cellpadding="0" cellspacing="0" class="fx_table_con" id="gridTable">
                    <thead>
                    <tr class="table_head">
                        <th colspan="13" title="">&nbsp;</th>
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
                        <th title="进度维护人">进度维护人</th>
                        <th title="完成百分比（%）">完成百分比（%）</th>
                        <th title="风险次数">风险次数</th>
                        <th title="变更次数">变更次数</th>
                        <th ng-repeat="r in defaultDays" title="{{r}}">{{r}}</th>
                        <th title="操作">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="u in projectAuditList">
                        <td>{{::u.workOrderNumber}}</td>
                        <td>{{::u.code}}</td>
                        <td>{{::u.name}}</td>
                        <td>{{::u.proTypeName}}</td>
                        <td>{{::u.estimatedDays}}</td>
                        <td>{{::u.startDate| date:'yyyy-MM-dd'}}</td>
                        <td>{{::u.endDate| date:'yyyy-MM-dd'}}</td>
                        <td>{{::u.projectLeader}}</td>
                        <td>{{::u.maxRatio}}</td>
                        <td><a class="t_red risk" ng-if="u.riskCount!=0" ng-click="showRiskDetail(u)">{{::u.riskCount}}</a><span ng-if="u.riskCount==0">{{::u.riskCount}}</span></td>
                        <td><a class="t_red change" ng-if="u.updatedCount!=0" ng-click="showUpdateDetail(u)">{{::u.updatedCount}}</a><span ng-if="u.updatedCount==0">{{::u.updatedCount}}</span></td>
                        <td ng-repeat="progress in u.progressList">
                            <span ng-if="checkShown(u,$index)&&progress.auditLog.auditResult=='1'" class="t_green">已审核</span>
                            <span class="t_red" ng-if="checkShown(u,$index)&&progress.auditLog.auditResult=='2'">审核未通过</span>
                            <a class="t_blue pendAudit" ng-if="checkShown(u,$index)&&!progress.auditLog&&progress.id!='0'" ng-click="auditItem(u,$index,$event)">待审核</a>
                            <span class="t_gray" ng-if="checkShown(u,$index)&&!progress.auditLog&&progress.id=='0'">未提交</span>
                        </td>
        <@shiro.hasRole name="1">
                        <td><a class="bnt blue view_deta" ng-click="checkDetails(u)">查看详情</a></td>
        </@shiro.hasRole>
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
</@shiro.authenticated>