<!---未通过审核修改意见弹窗--->
<div class="addtwo_box opin " ng-class="{'is-visible':showDenyModal}"  ng-controller="showAuditCtrl">
    <form name="auditForm" class="addtwo_box_container">
        <a class="close_bnt close_addtwo" ng-click="$parent.showDenyModal=false"></a><!--关闭按钮-->
        <div class="addtwo_mian">
            <div class="audit_a">未通过意见：</div>
            <div class="audit_b">
                <textarea cols="" class="text_input w380 h120" ng-model="auditLog.auditDesc" maxlength="500" rows=""></textarea>
            </div>
        </div>
        <div class="tb_btnbox pa">
            <input name="确定" type="submit" class="tbnt blue f_left dete_opin"  ng-click="submitRemark(deny_progress_id)" value="确定">
            <input name="取消" type="button" ng-click="$parent.showDenyModal=false" class="tbnt black f_right cancle_opin" value="取消">
        </div>
</div>