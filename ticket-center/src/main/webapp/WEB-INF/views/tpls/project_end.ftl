<!---终止项目弹窗--->
<div class="addtwo_box cutoff" ng-class="{'is-visible':showEndProjectModal}">
    <div class="addtwo_box_container">
        <a class="close_bnt close_addtwo" ng-click="showEndProjectModal=false"></a><!--关闭按钮-->
        <div class="addtwo_mian">
            <h2 class="cut_tit">是否确认终止项目？</h2>
            <div class="audit_a">请选择终止项目原因：</div>
            <div class="audit_b">
                <select ng-model="projectStop.stopReason" class="item_input">
                    <option>客户撤回申请</option>
                    <option>需求无法实现</option>
                    <option>其他</option>
                </select>
            </div>
            <div class="audit_a">备注：</div>
            <div class="audit_b">
                <textarea ng-model="projectStop.stopMemo" cols="" class="text_input w380 h120" rows=""></textarea>
            </div>
        </div>
        <div class="tb_btnbox pa">
            <input name="确定" ng-click="stopProject()" type="submit" class="tbnt blue f_left dete_opin" value="确定">
            <input name="取消" ng-click="showEndProjectModal=false" type="reset" class="tbnt black f_right cancle_opin" value="取消">
        </div>
    </div>
</div>