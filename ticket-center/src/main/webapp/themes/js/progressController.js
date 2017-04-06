angular.module('ticketCenterApp')
    .controller('progressIndexCtrl',function($scope,$rootScope,progressService,projectService,Utils){

        var pageCount=0;

        $scope.showAddProgressModal=false;
        $scope.showConfirmEndModal=false;
        $scope.showDetailModal=false;

        $scope.pager={
            filter:{},
            pageSize:10,
            current:1
        }

        /**
         * 得到最近六周的星期天
         */
        progressService.getDayList().then(
            function (resp) {
                $scope.days =resp;
            }
        )

        $scope.load=function (pager) {
            pager.filter.isAudit='1';
            progressService.getProjectList(pager,"LEADER").then(function (resp) {
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


        //判断是否应该有“需添加”标签
        $scope.checkShown=function(project,index){
            var start_date=project.startDate;
            var title_date=$scope.days[index];
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

        /*根据输入框的条件查询*/
        $scope.search=function () {
            $scope.pager.current=1;
            $scope.load($scope.pager);
        }


        //弹出新增进度的页面
        $scope.addItem=function (project,index,$event) {
            $scope.$$childHead.project=project;
            //所在的列的索引
            var currentIndex=$($event.target).parent().index();
            //所在的行的索引
            var currRowIndex=$($event.target).parent().parent().index();
            //找到该元素的前面，同一行前一列的显示值
            var pre_text=angular.element('#gridTable').find("tr").eq(currRowIndex+2).children().eq(currentIndex-1).text().trim();
            if(pre_text.trim()=="需添加"){
                 alert("请先添加上周的进度!");
                return false;
            }

            var this4Date=angular.element('#gridTable').find("tr").eq(1).children().eq(currentIndex).text();
            var aDate  =  this4Date.split("-");
            var oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0]);
            var sDate1=new Date(project.startDate);
            var iD4ays  =  parseInt(Math.abs(sDate1  -  oDate1)  /  1000  /  60  /  60  /24);
            $scope.$$childHead.end_date=this4Date;
            //得到今天
            var today_date=new Date();
            var friday_date=new Date(this4Date);
            friday_date.setDate(friday_date.getDate()-2);//设置数据所在周的星期五
            var interval_days  =  parseInt((today_date  -  friday_date)  /  1000  /  60  /  60  /24);
            if(interval_days<0){
                alert("现在还不能添加进度，周五之后才能添加!");
                return false;
            }
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

            $scope.$$childHead.start_date=year+"-"+month+"-"+day;
            $scope.$$childHead.week_index=week_index;
            $scope.showAddProgressModal=true;

        }

        //点击审核未通过的超链接触发的事件
        $scope.reAddItem=function (project,progress,index,$event) {
            progressService.getProgressById(progress.id).then(function (resp) {
                if(resp.length>0){
                    $scope.$$childHead.project=project;
                    $scope.$$childHead.progress=resp[0];
                    $scope.$$childHead.week_index=resp[0].progressOrder;
                    var start_date=resp[0].startDate;
                    var end_date=resp[0].endDate;
                    if(resp[0].isRisk==2){
                        $scope.$$childHead.isShow4Risk = true;
                    }
                    else{
                        $scope.$$childHead.isShow4Risk = false;
                    }

                    if(resp[0].isUpdated==2){
                        $scope.$$childHead.isShow4Updated = true;
                    }
                    else{
                        $scope.$$childHead.isShow4Updated = false;
                    }

                    $scope.$$childHead.start_date=start_date;
                    $scope.$$childHead.end_date=end_date;
                    $scope.showAddProgressModal=true;
                }
            })

        }

       //确认结项
        $scope.confirmEnd=function(project){
            var progressList=project.progressList;
            //判断是否所有的记录都被审核过
            if(progressList){
                if(progressList.length>0){
                    for(var i=0;i<progressList.length;i++){

                        if(progressList[i].auditLog){
                            if(progressList[i].auditLog.auditResult!='1'){
                                alert("必须所有的进度审核通过才能结项!");
                                return false;
                            }
                        }
                        else if(!progressList[i].auditLog&&$scope.checkShown(project,i)){
                                alert("必须所有的进度审核通过才能结项!");
                                return false;

                        }
                    }
                }
            }

            $scope.showConfirmEndModal=true;
            $scope.projectConfirmStop=project;

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


    }).controller('progressAddCtrl',function($scope,$rootScope,progressService){

    $scope.isShow4Risk = false;

    $scope.isShow4Updated = false;

    $scope.submit=function () {
        var startDate=progressForm.startDate.value.replace(".","-");
        startDate=startDate.replace(".","-");
        var endDate=progressForm.endDate.value.replace(".","-");
        endDate=endDate.replace(".","-");
        //存在progressid,则修改当前的progress，将audit_flag变为2，然后新增一条待审核的记录
            //如果不存在progressid，则直接新增一条待审核的记录
        progressService.
        updateProgress($scope.progress,progressForm.progress4ProjectId.value,startDate,endDate)
            .then(
            function (resp) {
                if(resp.status=='0'){
                    $scope.progress.ratio="";
                    $scope.progress.taskDesc="";
                    $scope.progress.riskTips="";
                    $scope.progress.updatedDesc="";
                    $scope.progress.remark="";
                    $scope.progress.isRisk=1;
                    $scope.progress.isUpdated=1;
                    $scope.progress.auditLogId=0;
                    $scope.isShow4Risk = false;
                    $scope.isShow4Updated = false;
                    $scope.$parent.showAddProgressModal=false;
                }
                $scope.load($scope.pager);
            }
        );
    }

    //显示和隐藏风险提示输入框
    $scope.showRiskTips=function () {
        //显示风险提示输入框
        if($scope.progress.isRisk==2){
            $scope.isShow4Risk = true;
        }
        else{
            $scope.isShow4Risk = false;
            $scope.progress.riskTips="";
        }
    }

    //显示和变更提示输入框
    $scope.showIsUpdatedTips=function () {
        //显示变更提示输入框
        if($scope.progress.isUpdated==2){
            $scope.isShow4Updated = true;
        }
        else{
            $scope.isShow4Updated = false;
            $scope.progress.updatedDesc="";
        }
    }

    //点击关闭按钮
    $scope.closeThis=function () {
        if($scope.progress){
            $scope.progress.ratio="";
            $scope.progress.taskDesc="";
            $scope.progress.riskTips="";
            $scope.progress.updatedDesc="";
            $scope.progress.remark="";
            $scope.progress.isRisk=1;
            $scope.progress.isUpdated=1;
            $scope.progress.auditLogId=0;
        }
        $scope.isShow4Risk = false;
        $scope.isShow4Updated = false;
        $scope.$parent.showAddProgressModal=false;

    }

}).controller('confirmEndCtrl',function($scope,$rootScope,projectService){

    //确认结项的操作方法
    $scope.confrimToEnd=function () {

        if(!$scope.projectConfirmStop.finishDate){
            angular.element('#errors').attr("class","time_explain");
            return false;
        }

        angular.element('#errors').attr("class","time_explain none");

        projectService.finishProject($scope.projectConfirmStop).then(function (resp) {
            $scope.$parent.showConfirmEndModal=false;
            $scope.load($scope.pager);
        })

    }

}).controller('showDetailsCtrl',function($scope,$rootScope,progressService){

})