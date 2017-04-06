/**工具封装*/
var ticketCenterApp=angular.module('ticketCenterApp');
ticketCenterApp.factory("Utils",function ($window,$http,$q) {

    var factory={};

    /**angulas 同步请求*/
    factory.postDataSync=function (url,data,method) {
        var deferred = $q.defer(); // 声明延后执行，表示要去监控后面的执行
        if(method.toLowerCase()=='post'||method.toLowerCase()=='put'){
            $http({
                url:url,
                data:data,
                method:method
            }).success(function(data,status, headers, config){
                // 声明执行成功，即http请求数据成功，可以返回数据了
                deferred.resolve(data);
            }).error(function(data, status, headers, config){
                // 声明执行失败，即服务器返回错误
                console.error(data);
                deferred.resolve({"status":"-404","errmsg":"网络连接异常！"});
            })
        }else{
            $http({
                url:url,
                params:data,
                method:method
            }).success(function(data, status, headers, config){
                // 声明执行成功，即http请求数据成功，可以返回数据了
                deferred.resolve(data);
            }).error(function(data, status, headers, config){
                // 声明执行失败，即服务器返回错误
                console.error(data);
                deferred.resolve({"status":"-404","errmsg":"网络连接异常！"});
            })
        }
        return deferred.promise;
    }


    factory.initPager=function (current,pageCount,$scope) {
        /***********翻页***********/
        $(".tcdPageCode").createPage({
            pageCount:pageCount,
            current:current,
            backFn:function(p){
                $scope.pager.current=p;
                console.log("backfun");
                $scope.load($scope.pager);
            }
        });
    }


    factory.downloadFile=function (fileName) {
        $window.open(baseUrl+"/download/"+fileName);
    }

    return factory;

})