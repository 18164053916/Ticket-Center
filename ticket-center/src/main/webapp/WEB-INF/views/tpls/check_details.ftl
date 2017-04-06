<!---查看详情弹窗--->
<div class="addxx_box details" ng-class="{'is-visible':showDetailModal}"  ng-controller="showDetailsCtrl">
    <div class="addxx_box_container">
        <div class="tc_top">进度详情</div> <!---弹出页面top--->
        <a class="close_bnt close_deta" ng-click="$parent.showDetailModal=false"></a><!--关闭按钮-->
        <div class="tc_main"><!---弹出页面main--->
            <ul class="tc_audit clearfix">
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目名称：</div>
                    <div class="audit_b t_blue">{{projectDetails[0].projectName}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目编号：</div>
                    <div class="audit_b">{{projectDetails[0].projectCode}}</div>
                </li>
                <li class="clearfix" ng-if="projectDetails[0].isEnd==0&&projectDetails[0].isTerminal==0">
                    <div class="jd_project">
                        <h3 ng-if="projectDetails[0].remain_days>0">已开始<span class="t_red">{{projectDetails[0].begin_days}}</span>天，距项目结束还有{{projectDetails[0].remain_days}}天</h3>
                        <h3 ng-if="projectDetails[0].remain_days<=0">该项目计划结束时间已到</h3>
                        <div class="over_sbox">
                            <h3>{{projectDetails[0].projectStartDate| date:'yyyy-MM-dd'}}</h3>
                            <div class="over_s"><!---总进度--->
                                <span>{{projectDetails[0].ratio}}%</span>
                                <div class="jd_over" style="width:{{projectDetails[0].ratio}}%;"></div>
                            </div>
                            <h3>{{projectDetails[0].projectEndDate| date:'yyyy-MM-dd'}}</h3>
                        </div>
                    </div>
                </li>
                <li ng-if="projectDetails[0].isTerminal==1">
                    <div class="audit_a">异常终止原因：</div>
                    <div class="audit_b">{{projectDetails[0].teminalReason}}</div>
                </li>
                <li ng-if="projectDetails[0].isTerminal==1">
                    <div class="audit_a">备注：</div>
                    <div class="audit_b">{{projectDetails[0].teminalRemark}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">风险提示次数：</div>
                    <div class="audit_b" ng-if="projectDetails[0].riskTimes>0"><span class="t_red">{{projectDetails[0].riskTimes}}</span></div>
                    <div class="audit_b" ng-if="projectDetails[0].riskTimes==0">{{projectDetails[0].riskTimes}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">变更次数：</div>
                    <div class="audit_b">{{projectDetails[0].updateTimes}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">汇报人：</div>
                    <div class="audit_b">{{projectDetails[0].projectLeader}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目成员：</div>
                    <div class="audit_b">{{projectDetails[0].members}}</div>
                </li>
            </ul>


            <div class="project_deta" ng-repeat="detail in projectDetails" ng-if="detail.isUpdated!=''">
                <div class="pro_time clearfix">
                    <h4 class="f_left">第{{::detail.progressOrder}}周</h4>
                    <span class="f_right">{{::detail.startDate| date:'yyyy-MM-dd'}}-{{::detail.endDate| date:'yyyy-MM-dd'}}</span>
                </div>
                <ul class="pro_box">
                    <li class="clearfix">
                        <h4>项目完成百分比：</h4><p>{{::detail.effortsHours}}%</p>
                    </li>
                    <li class="clearfix">
                        <h4>任务完成情况描述：</h4><p>{{::detail.taskDesc}}</p>
                    </li>
                    <li class="clearfix">
                        <h4>风险提示：</h4><p>{{::detail.riskTips}}</p>
                    </li>
                    <li class="clearfix">
                        <h4>是否变更：</h4><p ng-if="detail.isUpdated=='2'">是</p><p ng-if="detail.isUpdated=='1'">否</p>
                    </li>
                    <li class="clearfix">
                        <h4>变更内容：</h4><p>{{::detail.updatedDesc}}</p>
                    </li>
                    <li class="clearfix">
                        <h4>备注：</h4><p>{{::detail.remark}}</p>
                    </li>
                </ul>
            </div>


        </div>
    </div>
</div>
      