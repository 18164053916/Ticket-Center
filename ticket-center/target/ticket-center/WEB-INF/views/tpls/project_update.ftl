<!--添加项目-->
<div class="addxx_box add_item" ng-class="{'is-visible':showUpdateProjectModal}">
    <form name="projectForm" class="addxx_box_container">
        <div class="tc_top">添加项目</div> <!---弹出页面top--->
        <a class="close_bnt close_addxx" ng-click="cancel()"></a><!--关闭按钮-->
        <div class="tc_main"><!---弹出页面main--->
            <ul class="input_list">
                <li>
                    <label>任务开始时间</label>
                    <input ng-model="project.startDate" type="text" class="datepuicker_input from-date" name="from">
                    <label>任务结束时间</label>
                    <input ng-model="project.endDate" type="text" class="datepuicker_input to-date to-date" name="to">
                </li>
                <li class="pr">
                    <span class="explain">说明：二次开发填写Jira编号，其他项目填写立项编号</span>
                    <label>项目名称</label>
                    <input ng-model="project.name" name="name" type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.name.$error.required">必填</span>
                    <label>项目编号</label>
                    <input ng-model="project.code" name="code" type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.code.$error.required">必填</span>
                </li>
                <li>
                    <label>预估工作量(人天)</label>
                    <input ng-model="project.estimatedDays" name="estimatedDays" type="number" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.estimatedDays.$error.required">必填</span>
                    <span  style="color:red" ng-show="projectForm.estimatedDays.$dirty && projectForm.estimatedDays.$invalid">请输入数字</span>
                    <label>项目类型</label>
                    <select ng-model="project.type" name="type"  class="item_input" required>
                        <option ng-repeat="pt in projectTypeList" value="{{pt.id}}">{{pt.name}}</option>
                    </select>
                    <span  style="color:red" ng-show="projectForm.type.$error.required">必填</span>
                </li>
                <li>
                    <label>客户名称</label>
                    <input ng-model="project.customerName"  type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.estimatedDays.$error.required">必填</span>
                    <label>进度维护人</label>
                    <select ng-model="project.scheduleMaintenanceUserId" name="scheduleMaintenanceUserId" class="item_input" required>
                        <option ng-repeat="u in userList|filter:scheduleMaintenanceUserFilter" value="{{u.id}}">{{u.displayName}}</option>
                    </select>
                    <span  style="color:red" ng-show="projectForm.scheduleMaintenanceUserId.$error.required">必填</span>
                </li>
                <li>
                    <label>开发接口人</label>
                    <input ng-model="project.developerKeyUser"  name="developerKeyUser" type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.developerKeyUser.$error.required">必填</span>
                    <label>开发接口人邮箱</label>
                    <input ng-model="project.developerKeyUserEmail" name="developerKeyUserEmail" type="email" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.developerKeyUserEmail.$error.required">必填</span>
                    <span  style="color:red" ng-show="projectForm.developerKeyUserEmail.$dirty && projectForm.developerKeyUserEmail.$invalid">邮箱格式不正确</span>
                </li>
                <li>
                    <label>现场接口人</label>
                    <input ng-model="project.sceneKeyUser" name="sceneKeyUser"  type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.sceneKeyUser.$error.required">必填</span>
                    <label>现场接口人邮箱</label>
                    <input ng-model="project.sceneKeyUserEmail" name="sceneKeyUserEmail"  type="email" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.sceneKeyUserEmail.$error.required">必填</span>
                    <span  style="color:red" ng-show="projectForm.sceneKeyUserEmail.$dirty && projectForm.sceneKeyUserEmail.$invalid">邮箱格式不正确</span>
                </li>
                <li>
                    <label>需求接口人</label>
                    <input ng-model="project.demandKeyUser"  name="demandKeyUser" type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.demandKeyUser.$error.required">必填</span>
                    <label>需求接口人邮箱</label>
                    <input ng-model="project.demandKeyUserEmail" name="demandKeyUserEmail" type="email" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.demandKeyUserEmail.$error.required">必填</span>
                    <span  style="color:red" ng-show="projectForm.demandKeyUserEmail.$dirty && projectForm.demandKeyUserEmail.$invalid">邮箱格式不正确</span>
                </li>
                <li>
                    <label>需求分类</label>
                    <#--目前循环两级，如需更复杂的tree 需要用tree 控件-->
                    <select ng-model="project.demandType" name="demandType"  class="item_input" required>
                        <optgroup ng-repeat="dt in demandTypesTree" label="{{dt.name}}">
                            <option ng-repeat="dtc in dt.childrens" value="{{dtc.id}}">{{dtc.name}}</option>
                        </optgroup>
                    </select>
                    <span  style="color:red" ng-show="projectForm.demandType.$error.required">必填</span>
                    <label>需求关键字</label>
                    <input ng-model="project.demandKeyword" name="demandKeyword" type="text" class="item_input" placeholder="必填" required>
                    <span  style="color:red" ng-show="projectForm.demandKeyword.$error.required">必填</span>
                </li>
                <li>
                    <label>项目成员</label>
                    <div  class="member_box">
                        <ul>
                            <li ng-repeat="(key,value) in projectRoles">
                                <h3>{{value}}</h3>
                                <span ng-repeat="u in userList|filter:{proType: key}">
                                    <input ng-click="updateMemberSelection($event,u.id)" type="checkbox" class="radio_a" value="{{u.id}}">
                                    <label class="lable_a" for="test1">{{u.displayName}}</label>
                                </span>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="tc_bottom"><!---弹出页面bottom--->
            <div class="tb_btnbox">
                <input name="提交" ng-click="submit()" ng-disabled="projectForm.$invalid" type="submit" class="tbnt blue f_left dete" value="确定">
                <input name="重置" ng-click="cancel()" type="reset" class="tbnt black f_right cancle" value="取消">
            </div>
        </div>
    </form>
</div>

