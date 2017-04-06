<!---需添加弹窗--->
<div class="addxx_box add_item" ng-class="{'is-visible':showAddProgressModal}" ng-controller="progressAddCtrl">
    <form name="progressForm" class="addxx_box_container">
        <div class="tc_top">添加进度</div> <!---弹出页面top--->
        <a class="close_bnt close_addxx" ng-click="closeThis()"></a><!--关闭按钮-->
        <div class="tc_main"><!---弹出页面main--->
            <ul class="tc_audit">
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目名称：</div>
                    <input name="progress4ProjectId" type="hidden" ng-value="project.id">
                    <input name="startDate" type="hidden" ng-value="start_date">
                    <input name="endDate" type="hidden" ng-value="end_date">
                    <div class="audit_b">{{project.name}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目编号：</div>
                    <div class="audit_b">{{project.code}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">第{{week_index}}周：</div>
                    <div class="audit_b">{{start_date| date:'yyyy.MM.dd'}}-{{end_date| date:'yyyy.MM.dd'}}</div>
                </li>
                <li class="w_jd50 f_left">
                    <div class="audit_a">项目完成百分比：</div>
                    <div class="audit_b">
                        <input ng-model="progress.ratio" name="ratio" type="number" oninput="if(value.length>3)value=value.slice(0,3)"
                               class="text_input w80" placeholder="必填" required>
                        <span  style="color:red" ng-show="progressForm.ratio.$error.required"> *项目完成百分比是必须的。</span>
                    </div>
                </li>
                <li>
                    <div class="audit_a">已完成任务描述：</div>
                    <div class="audit_b">
                        <textarea cols="" ng-model="progress.taskDesc" ng-maxlength="300" name="taskDesc" maxlength="300"
                                  class="text_input w500 h60" rows="" placeholder="必填" required></textarea>
                        <span  style="color:red" ng-show="progressForm.taskDesc.$error.required||progressForm.taskDesc.$invalid"> *必输项,最多输入300字。</span>
                    </div>
                </li>
                <li>
                    <div class="audit_a">是否有风险：</div>
                    <div class="audit_b">
                        <input ng-model="progress.isRisk" type="radio" class="radio_a"
                               id="c_yes" ng-value="2" ng-click="showRiskTips()"><label class="lable_a" for="c_yes">是</label>
                        <input ng-model="progress.isRisk" type="radio" ng-value="1" ng-checked="true"
                               class="radio_a" id="c_no" ng-click="showRiskTips()"><label class="lable_a" for="c_no">否</label>
                    </div>
                </li>
                <li ng-show="isShow4Risk">
                    <div class="audit_a">风险提示：</div>
                    <div class="audit_b">
                <textarea cols="" ng-model="progress.riskTips" class="text_input w500 h60" rows="" maxlength="500">
                </textarea>
                    </div>
                </li>
                <li>
                    <div class="audit_a">是否变更：</div>
                    <div class="audit_b">
                        <input ng-model="progress.isUpdated" type="radio" class="radio_a" ng-click="showIsUpdatedTips()" id="c_yes" ng-value="2" ><label class="lable_a" for="c_yes">是</label>
                        <input ng-model="progress.isUpdated" type="radio" ng-value="1" ng-click="showIsUpdatedTips()" class="radio_a" id="c_no" ng-checked="true"><label class="lable_a" for="c_no">否</label>
                    </div>
                </li>
                <li ng-show="isShow4Updated">
                    <div class="audit_a">变更内容：</div>
                    <div class="audit_b"><textarea cols="" ng-model="progress.updatedDesc" maxlength="500" class="text_input w500 h60" rows=""></textarea></div>
                </li>
                <li>
                    <div class="audit_a">备注：</div>
                    <div class="audit_b">
                        <textarea cols="" class="text_input w500 h60" ng-model="progress.remark" maxlength="500" rows=""></textarea>
                    </div>
                </li>
            </ul>
        </div>
        <div class="tc_bottom"><!---弹出页面bottom--->
            <div class="tb_btnbox">
                <input name="确定" ng-disabled="progressForm.$invalid" ng-click="submit(progress.auditLogId)" type="submit" class="tbnt blue f_left dete" value="确定">
                <input name="取消" type="reset" ng-click="closeThis()" class="tbnt black f_right cancle" value="取消">
            </div>
        </div>
</div>