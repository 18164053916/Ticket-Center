<!---待审核弹窗--->
<div class="addxx_box audit" ng-class="{'is-visible':showAuditModal}"  ng-controller="showAuditCtrl">
    <div class="addxx_box_container">
        <div class="tc_top">待审核</div> <!---弹出页面top--->
        <a class="close_bnt close_addxx" ng-click="$parent.showAuditModal=false"></a><!--关闭按钮-->
        <div class="tc_main"><!---弹出页面main--->
            <ul class="tc_audit">
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目名称：</div>
                    <div class="audit_b">{{project_name}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目编号：</div>
                    <div class="audit_b">{{project_node}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">第{{week_index}}周：</div>
                    <div class="audit_b">{{progress.startDate| date:'yyyy.MM.dd'}}-{{progress.endDate| date:'yyyy.MM.dd'}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目完成百分比：</div>
                    <div class="audit_b">{{progress.ratio}}%</div>
                </li>
                <li>
                    <div class="audit_a">已完成任务描述：</div>
                    <div class="audit_b" ng-if="progress.taskDesc!=''">{{progress.taskDesc}}</div><div class="audit_b" ng-if="progress.taskDesc==''||!progress.taskDesc">无</div>
                </li>
                <li>
                    <div class="audit_a">是否有风险：</div>
                    <div class="audit_b" ng-if="progress.isRisk==2">是</div><div class="audit_b" ng-if="progress.isRisk==1">否</div>
                </li>
                <li>
                    <div class="audit_a">风险提示：</div>
                    <div class="audit_b" ng-if="progress.riskTips!=''">{{progress.riskTips}}</div><div class="audit_b" ng-if="progress.riskTips==''||!progress.riskTips">无</div>
                </li>
                <li>
                    <div class="audit_a">是否变更：</div>
                    <div class="audit_b" ng-if="progress.isUpdated==2">是</div><div class="audit_b" ng-if="progress.isUpdated==1">否</div>
                </li>
                <li>
                    <div class="audit_a">变更内容：</div>
                    <div class="audit_b" ng-if="progress.updatedDesc!=''">{{progress.updatedDesc}}</div><div class="audit_b" ng-if="progress.updatedDesc==''||!progress.updatedDesc">无</div>
                </li>
                <li>
                    <div class="audit_a">备注：</div>
                    <div class="audit_b">
                        {{progress.remark}}
                    </div>
                </li>
            </ul>
        </div>
        <div class="tc_bottom"><!---弹出页面bottom--->
            <div class="tb_btnbox">
                <input name="提交" type="button" class="tbnt blue f_left dete" value="通过" ng-click="submitAudit(progress.id,progress.proId)">
                <input name="不通过" type="button" class="tbnt black f_right cancle" value="不通过" ng-click="denyAudit(progress.id)">
            </div>
        </div>
    </div>
</div>