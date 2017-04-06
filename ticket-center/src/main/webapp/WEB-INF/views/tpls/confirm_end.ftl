<div class="addtwo_box end_item " ng-class="{'is-visible':showConfirmEndModal}" ng-controller="confirmEndCtrl">
    <div class="addtwo_box_container">
        <a class="close_bnt close_addtwo" ng-click="$parent.showConfirmEndModal=false"></a><!--关闭按钮-->
        <div class="addtwo_mian">
            <h2 class="cut_tit">是否确认结项？</h2>
            <div class="audit_a">请选择结项日期：</div>
            <div class="audit_b pr">
                <input type="text" ng-model="projectConfirmStop.finishDate"   class="datepuicker_input from-date">
                <p class="time_explain none" id="errors">错误提示：未选择结项日期</p><!---当没选择日期时出现错误提示去掉none 样式--->
            </div>
        </div>
        <div class="tb_btnbox pa">
            <input name="确定" type="button"  ng-click="confrimToEnd()"  class="tbnt blue f_left dete" value="确定">
            <input name="取消" type="reset" ng-click="$parent.showConfirmEndModal=false" class="tbnt black f_right cancle" value="取消">
        </div>
        </div>
</div>