var ticketCenter = angular.module('ticketCenterApp',[]);

ticketCenter.run(function ($rootScope,$location,$timeout) {
    $rootScope.siderbarActive="";

    $rootScope.projectRoles={
        "0":"开发","1":"测试","2":"UI"
    }

    $rootScope.absUrl=$location.absUrl();

})


ticketCenter.config(['$locationProvider', function($locationProvider) {
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
}])





