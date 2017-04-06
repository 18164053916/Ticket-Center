<!---删除提示框--->
<div class="addtwo_box deletuser" ng-class="{'is-visible':showConfirmLoginOut}">
    <div class="addtwo_box_container">
        <a class="close_bnt close_addtwo" ng-click="$parent.showConfirmLoginOut=false"></a><!--关闭按钮-->
        <div class="addtwo_mian">
            <img src="${base}/themes/imges/icon11.png" class="icon_ts">
            <h2 class="delet_tit">是否确认注销？</h2>
        </div>
        <div class="tb_btnbox pa">
            <input ng-click="loginOut()" name="确定" type="submit" class="tbnt blue f_left dete_opin" value="确定">
            <input ng-click="showConfirmLoginOut=false" name="取消" type="reset" class="tbnt black f_right cancle_opin" value="取消">
        </div>
    </div>
</div>