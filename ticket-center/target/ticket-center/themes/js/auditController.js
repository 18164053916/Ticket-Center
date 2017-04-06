angular.module('ticketCenterApp')
    .controller('auditIndexCtrl',function($scope,$rootScope,auditService,progressService,Utils){

        var pageCount=0;

        $scope.showAuditModal=false;
        $scope.showDenyModal=false;
        $scope.showUpdatdModal=false;
        $scope.showRiskModal=false;

        $scope.pager={
            filter:{},
            pageSize:10,
            current:1
        }

        //讲所有 待审核项置顶
        $scope.toTop=function () {
            $scope.pager.filter.isAudit='2';
            $scope.pager.current=1;
            auditService.getProjectList($scope.pager,"ADMIN").then(function (resp) {
                $scope.projectAuditList =resp;
                var pageCount=0;
                if(resp.length>0){
                    var total = resp[0].total;
                    pageCount=Math.ceil(total/$scope.pager.pageSize);
                }
                Utils.initPager($scope.pager.current,pageCount,$scope);
            });
        }


        /**
         * 得到最近六周的星期天
         */
        auditService.getDayList().then(
            function (resp) {
                $scope.defaultDays =resp;
            }
        )

        /**
         * 初始化得到需要审核的结果集
         * @param pager
         */
        $scope.load=function (pager) {
            pager.filter.isAudit='1';
            auditService.getProjectList(pager,"ADMIN").then(function (resp) {
                $scope.projectAuditList =resp;
                var pageCount=0;
                if(resp.length>0){
                    var total = resp[0].total;
                    pageCount=Math.ceil(total/$scope.pager.pageSize);
                }
                Utils.initPager(pager.current,pageCount,$scope);
            });
        }


        $scope.load($scope.pager);

        /*根据输入框的条件查询*/
        $scope.search=function () {
            $scope.pager.current=1;
            $scope.load($scope.pager);
        }

        //查看详情
        $scope.checkDetails=function(project){
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


        //判断是否应该有“需添加”标签
        $scope.checkShown=function(project,index){
            var start_date=project.startDate;
            var title_date=$scope.defaultDays[index];
            var aDate  =  title_date.split("-");
            var titleDate  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0]);
            var startDate=new Date(start_date);
            var iD4ays  =  parseInt((startDate  -  titleDate)/1000/60/60/24);
            if(eval(iD4ays)>0){
                return false;
            }
            else{
                return true;
            }

        }


        //添加审核
        $scope.auditItem=function (project,index,$event) {
            var progress_id=project.progressList[index].id;
            //所在的列的索引
            var currentIndex=$($event.target).parent().index();
            var this4Date=angular.element('#gridTable').find("tr").eq(1).children().eq(currentIndex).text();
            var aDate  =  this4Date.split("-");
            var oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0]);
            var sDate1=new Date(project.startDate);
            var iD4ays  =  parseInt(Math.abs(sDate1  -  oDate1)  /  1000  /  60  /  60  /24);
            this4Date=this4Date.replace("-",".");
            this4Date=this4Date.replace("-",".");
            $scope.$$childHead.end_date=this4Date;
            var d=new Date(this4Date);
            d.setDate(d.getDate()-6);//设置天数 -6 天
            var year=d.getFullYear();
            var month=d.getMonth()+1;
            var day=d.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (day >= 0 && day <= 9) {
                day = "0" + day;
            }
            //得到第几周
            var week_index=parseInt(iD4ays/7)+1;
            auditService.getProgressById(progress_id).then(function (resp) {
                  if(resp.length>0){
                      $scope.progress=resp[0];
                      $scope.project_name=project.name;
                      $scope.project_node=project.code;
                      $scope.week_index=week_index;
                      $scope.showAuditModal=true;
                  }
            })
        }


        //显示风险详情
        $scope.showRiskDetail=function (project) {
            auditService.getProgressOption(project.id,1).then(function (resp) {
                if(resp.length>0){
                    $scope.optionList=resp;
                    $scope.projectOptionDetails=project;
                    $scope.showRiskModal=true;
                }
            })
        }


        //显示变更内容
        $scope.showUpdateDetail=function (project) {
            auditService.getProgressOption(project.id,2).then(function (resp) {
                if(resp.length>0){
                    $scope.optionList=resp;
                    $scope.projectOptionDetails=project;
                    $scope.showUpdatdModal=true;
                }
            })
        }



    }).controller('showAuditCtrl',function($scope,$rootScope,auditService){

    //审核通过，提交审核
    $scope.submitAudit=function (progressId,projectId) {
        var auditLog=new Object();
        auditLog.progressId=progressId;
        auditLog.projectId=projectId;
        auditLog.auditResult=1;
        auditService.insertAuditLog(auditLog).then(
            function (resp) {
                if(resp.status=='0'){
                    $scope.$parent.showAuditModal=false;
                    $scope.load($scope.$parent.pager);
                }
            },
            function (resp) {

            }
        );

    }

    $scope.denyAudit=function (progressId) {
        $scope.$parent.deny_progress_id=progressId;
        $scope.$parent.showDenyModal=true;
    }


    //审核不通过
    $scope.submitRemark=function (progressId) {
        var auditLog=new Object();
        auditLog.progressId=progressId;
        auditLog.auditResult=2;
        if($scope.auditLog){
            auditLog.auditDesc=$scope.auditLog.auditDesc;
        }
        auditService.insertAuditLog(auditLog).then(
            function (resp) {
                if(resp.status=='0'){
                    $scope.$parent.showDenyModal=false;
                    $scope.$parent.showAuditModal=false;
                    $scope.load($scope.$parent.pager);
                }
            },
            function (resp) {

            }
        );

    }



}).controller('showRiskCtrl',function($scope,$rootScope,auditService){


})