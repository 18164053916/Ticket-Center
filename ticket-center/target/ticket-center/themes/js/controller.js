angular.module('ticketCenterApp')
.controller('userManagementCtrl',function($scope,$rootScope,userService,roleService,Utils){
    var pageCount=0;
    //左侧active 样式
    $rootScope.siderbarActive="nav03";

    $scope.showUpdateUserModal=false;

    $scope.showDelUserAlert=false;

    $scope.showDetailModal=false;

    roleService.getRoleList().then(
        function (resp) {
            $scope.roles =resp;
        }
    )
    
    $scope.addUser=function () {
        $scope.$$childHead.user={};
        $scope.showUpdateUserModal=true;
    }
    $scope.modify=function (user) {
        $scope.$$childHead.user=user;
        $scope.showUpdateUserModal=true;
    }
    $scope.deleteAlert=function (user) {
        console.log("delete:"+JSON.stringify(user));
        $scope.$$childHead.user=user;
        $scope.showDelUserAlert=true;
    }
    $scope.delete=function (id) {
        userService.deleteUser(id).then(
            function (resp) {
                if(resp.status=='0'){
                    $scope.showDelUserAlert=false;
                    $scope.load($scope.pager);
                }
            },
            function (resp) {
                console.error("load:"+JSON.stringify(resp));
            }
        )
    }


    $scope.pager={
        pageSize:10,
        current:1
    }

    $scope.load=function (pager) {
        userService.getUserPageList(pager).then(function (resp) {
            $scope.userList =resp;
            if(resp.length>0){
                var total = resp[1].total;
                pageCount=Math.ceil(total/$scope.pager.pageSize);
            }
            Utils.initPager(pager.current,pageCount,$scope);
        });
    }

    $scope.load($scope.pager);

    



})
.controller("updateUserCtrl",function ($scope,userService) {

    $scope.submit=function () {
        console.log("updateUser:"+JSON.stringify($scope.user))

        userService.updateUser($scope.user).then(
            function (resp) {
                console.log("load:"+JSON.stringify(resp));
                if(resp.status=='0'){
                    $scope.$parent.showUpdateUserModal=false;
                    $scope.load($scope.$parent.pager);
                }
            },
            function (resp) {
                console.error("load:"+JSON.stringify(resp));
            }
        );
    }
})
.controller("projectCtrl",function ($scope,$rootScope,$timeout,$location,userService,projectService,Utils,progressService) {

    $rootScope.siderbarActive=$location.search().status;

    $scope.project={};

    $scope.selected = [] ;

    //展开折叠
    $timeout(function(){
        $(".nav02").click();
    },300);
    $scope.showUpdateProjectModal=false;

    $scope.showEndProjectModal=false;

    /*增加*/
    $scope.addProject=function () {
        $scope.project={};
        $scope.selected = [] ;
        $(".member_box").find("input[type='checkbox']").attr("checked", false);
        $scope.showUpdateProjectModal=true;
    }

    //获取项目成员
    userService.getUserList().then(function (resp) {
        $scope.userList=resp;
    })
    
    /*获取项目类型*/
    projectService.getProjectTypes().then(function (resp) {
        $scope.projectTypeList=resp;
        console.log(JSON.stringify(resp));
    })
    
    /*需求类型*/
    projectService.getDemandTypesTree().then(function (resp) {
        $scope.demandTypesTree=resp;
    })
    


    //project 对象项目成员赋值
    $scope.updateMemberSelection=function ($event,id) {
        var checkbox = $event.target ;
        if(checkbox.checked){
            $scope.selected.push(id);
        }else{
            var idx = $scope.selected.indexOf(id);
            $scope.selected.splice(idx,1);
        }
        $scope.project["members"]= $scope.selected;
    }

    //提交
    $scope.submit=function () {
        $scope.project.membersName = [];
        console.log(JSON.stringify($scope.project));
        projectService.updateProject($scope.project).then(function (resp) {
            console.log("project success:"+JSON.stringify(resp))
            if(resp.status=='0'){
                $scope.showUpdateProjectModal=false;
                $scope.load($scope.pager);
            }else{
                alert(resp.errmsg);
            }
        },function (resp) {
            console.error("project error:"+JSON.stringify(resp))
        })
    }


    $scope.pager={
        filter:{},
        pageSize:10,
        current:1
    }

    $scope.pager.filter["status"]=$rootScope.siderbarActive;

    /*加载*/
    $scope.load=function (pager) {
        projectService.getProjectPageList(pager).then(function (resp) {
            $scope.projectList =resp;
            var pageCount=0;
            if(resp.length>0){
                var total = resp[0].total;
                pageCount=Math.ceil(total/$scope.pager.pageSize);
            }
            Utils.initPager(pager.current,pageCount,$scope);
        });
    }

    $scope.load($scope.pager);

    $scope.membersNameFilter=function (item) {
        var membersName = item.membersName+"";
        item.membersName=membersName;
        return item;
    }

    $scope.scheduleMaintenanceUserFilter=function (item) {
        return item.roleId!=1;
    }


    /*修改*/
    $scope.modify=function (project) {
        $scope.showUpdateProjectModal=true;
        $scope.selected=project.members;
        $scope.project = project;
        console.log(JSON.stringify(project));
        for(var i=0;i<$scope.selected.length;i++){
            $(".member_box").find("input[type='checkbox'][value='"+$scope.selected[i]+"']").prop("checked",true);
        }
    }

    /*取消*/
    $scope.cancel=function () {
        $scope.showUpdateProjectModal=false;
        $(".member_box").find("input[type='checkbox']").prop("checked",false);
    }

    /*显示终止提示*/
    $scope.showStop=function (project) {
        $scope.showEndProjectModal=true;
        $scope.projectStop={};
        $scope.projectStop.id=project.id;
    }

    /*终止项目*/
    $scope.stopProject=function () {
        projectService.stopProject($scope.projectStop).then(function (resp) {
            if(resp.status=='0'){
                $scope.showEndProjectModal=false;
                $scope.load($scope.pager);
            }
        },function (resp) {
            console.error(JSON.stringify(resp));
        });
    }

    /*显示详情*/
    $scope.showDetail=function (project) {
        progressService.getProjectDetails(project.id).then(function (resp) {
            //去掉项目组成员的前后大括号
            var members=resp[0].members;
            members=members.substr(1,members.length);
            members=members.substr(0,members.length-1);
            resp[0].members=members;
            //计算开始了多少天，还剩多少天
            var start_date=resp[0].projectStartDate;
            var end_date=resp[0].projectEndDate;
            var start_new_date  =  new  Date(start_date);
            var end_new_date=new  Date(end_date);
            var today=new Date();
            var begin_days  =  parseInt(Math.abs(start_new_date  -  today)  /  1000  /  60  /  60  /24)+1;
            var remain_days  =  parseInt(Math.abs(end_new_date  -  today)  /  1000  /  60  /  60  /24)+1;
            resp[0].begin_days=begin_days;
            resp[0].remain_days=remain_days;
            $scope.showDetailModal=true;
            $scope.projectDetails=resp;

        })
    }


    /*搜索*/
    $scope.search=function () {
        $scope.pager.current=1;
        $scope.load($scope.pager);
    }

    /*导出Excel*/
    $scope.downloadExcel=function () {
        projectService.downloadExcel($scope.pager).then(function (resp) {
            console.log(JSON.stringify(resp));
            if(resp.status!=0){
                alert(resp.errmsg);
            }else{
                Utils.downloadFile(resp.data+".xls")
            }
        });
    }

    $scope.$on("projectLoad", function(e, time){
        $scope.pager.current=1;
        $scope.pager.filter["status"]=$rootScope.siderbarActive;
        $scope.load($scope.pager);
    });

})
.controller("siderbarCtrl",function ($scope,$rootScope) {

    //展开使用同一个页面浏览器不跳转。
    $scope.active=function (url,status) {
        $rootScope.siderbarActive=status;
        if($rootScope.absUrl.indexOf(url)==-1){
            window.location.href=url+"?status="+status;
        }else{
            $rootScope.$broadcast("projectLoad");
        }
    }

})
.controller("userFinishProjectCtrl",function ($scope,$rootScope,$location,projectService,Utils) {
    $rootScope.siderbarActive=$location.search().status;
    console.log("userFinishProjectCtrl loading..")

    $scope.pager={
        filter:{},
        pageSize:10,
        current:1
    }
    $scope.pager.filter["status"]="finish";

    /*加载*/
    $scope.load=function (pager) {
        projectService.getProjectPageList(pager).then(function (resp) {
            $scope.projectList =resp;
            var pageCount=0;
            if(resp.length>0){
                var total = resp[0].total;
                pageCount=Math.ceil(total/$scope.pager.pageSize);
            }
            Utils.initPager(pager.current,pageCount,$scope);
        });
    }

    $scope.load($scope.pager);

    /*搜索*/
    $scope.search=function () {
        $scope.pager.current=1;
        $scope.load($scope.pager);
    }

    //查看详情
    $scope.checkDetails=function(project){
        projectService.getProjectDetails(project.id).then(function (resp) {
            //去掉项目组成员的前后大括号
            var members=resp[0].members;
            members=members.substr(1,members.length);
            members=members.substr(0,members.length-1);
            resp[0].members=members;
            //计算开始了多少天，还剩多少天
            var start_date=resp[0].projectStartDate;
            var end_date=resp[0].projectEndDate;
            var start_new_date  =  new  Date(start_date);
            var end_new_date=new  Date(end_date);
            var today=new Date();
            var begin_days; //已开始多少天
            var remain_days;//还剩多少天完成
            begin_days  =  parseInt((today  -  start_new_date)  /  1000  /  60  /  60  /24)+1;
            remain_days  =  parseInt((end_new_date  -  today)  /  1000  /  60  /  60  /24)+1;
            if(begin_days<=0){
                begin_days=0;
            }
            resp[0].begin_days=begin_days;
            resp[0].remain_days=remain_days;
            $scope.showDetailModal=true;
            $scope.projectDetails=resp;

        })

    }

})