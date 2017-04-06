<!---风险次数弹窗--->
<div class="addxx_box risk_times" ng-class="{'is-visible':showRiskModal}"  ng-controller="showRiskCtrl">
    <div class="addxx_box_container">
        <div class="tc_top">风险记录</div> <!---弹出页面top--->
        <a class="close_bnt close_addxx" ng-click="$parent.showRiskModal=false"></a><!--关闭按钮-->
        <div class="tc_main"><!---弹出页面main--->
            <div class="tc_table">
                <table cellpadding="0" cellspacing="0" class="fx_table_con">
                    <thead>
                    <tr class="table_head">
                        <th>项目名称</th>
                        <th>提示时间</th>
                        <th>风险内容</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="progress in optionList">
                        <td>{{projectOptionDetails.name}}</td>
                        <td>{{::progress.updateDate| date:'yyyy-MM-dd'}}</td>
                        <td>{{::progress.riskTips}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>