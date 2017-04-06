<!--变更次数弹窗-->
<div class="addxx_box change_times" ng-class="{'is-visible':showUpdatdModal}"  ng-controller="showRiskCtrl">
    <div class="addxx_box_container">
        <div class="tc_top">变更记录</div> <!---弹出页面top--->
        <a class="close_bnt close_addxx" ng-click="$parent.showUpdatdModal=false"></a><!--关闭按钮-->
        <div class="tc_main"><!---弹出页面main--->
            <div class="tc_table">
                <table cellpadding="0" cellspacing="0" class="fx_table_con">
                    <thead>
                    <tr class="table_head">
                        <th>项目名称</th>
                        <th>变更时间</th>
                        <th>变更内容</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="progress in optionList">
                        <td>{{projectOptionDetails.name}}</td>
                        <td>{{::progress.updateDate| date:'yyyy-MM-dd'}}</td>
                        <td>{{::progress.updatedDesc}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>