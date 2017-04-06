<!--添加用户-->
<div class="addxx_box add_user" ng-class="{'is-visible':showUpdateUserModal}" ng-controller="updateUserCtrl">
    <form name="userForm" class="addxx_box_container">
        <div class="tc_top">添加用户</div> <!---弹出页面top--->
        <a class="close_bnt close_addxx cancel" ng-click="$parent.showUpdateUserModal=false" ></a><!--关闭按钮-->
        <div class="tc_main"><!---弹出页面main--->
            <ul class="input_list">
                <li>
                    <label>用户名称</label>
                    <input ng-model="user.id" hidden>
                    <input ng-model="user.name" name="name" type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="userForm.name.$error.required">用户名是必须的。</span>
                </li>
                <li>
                    <label>密码</label>
                    <input disabled type="password" class="item_input" value="123456">
                    <label>(默认:123456)</label>
                </li>
                <li>
                    <label>系统角色</label>
                    <select name="roleId" ng-model="user.roleId" class="item_input" required>
                        <option ng-repeat="r in roles" value="{{r.id}}">{{r.sysRoleDesc}}</option>
                    </select>
                    <label>项目角色</label>
                    <select name="proType" ng-model="user.proType" class="item_input" required>
                        <option ng-repeat="(key,value) in projectRoles" value="{{key}}">{{value}}</option>
                    </select>
                    <span  style="color:red" ng-show="userForm.roleId.$error.required||userForm.proType.$error.required">角色是必须的。</span>
                </li>
                <li>
                    <label>显示名</label>
                    <input ng-model="user.displayName" name="displayName" type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="userForm.displayName.$error.required">显示名是必须的。</span>
                </li>
            </ul>
        </div>
        <div class="tc_bottom"><!---弹出页面bottom--->
            <div class="tb_btnbox">
                <input  ng-disabled="userForm.$invalid" ng-click="submit()" name="提交" type="submit" class="tbnt blue f_left dete" value="确定">
                <input ng-click="$parent.showUpdateUserModal=false" name="重置" type="reset" class="tbnt black f_right cancel" value="取消">
            </div>
        </div>
    </form>
</div>