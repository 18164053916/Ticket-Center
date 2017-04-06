angular.module('ticketCenterApp')
    .controller('userLoginCtrl',function($scope,$rootScope,loginService){
        $scope.doLogin=function () {

            if(!$scope.user){
                $scope.errorTips="用户名和密码都不能为空";
                return false;
            }

            else{
                if(!$scope.user.name){
                    $scope.errorTips="用户名不能为空";
                    return false;
                }
                else if(!$scope.user.password){
                    $scope.errorTips="密码不能为空";
                    return false;
                }
            }

            $scope.errorTips="";

            loginService.checkUserLogin($scope.user).then(function (resp) {
                if(resp.message=='登录成功'){
                    window.location=baseUrl+resp.url;
                }
                else{
                    $scope.errorTips=resp.message;
                }


            });

        }

}).controller('userLoginManageCtrl',function($scope,$rootScope,loginService){

    $scope.showConfirmLoginOut=false;
    $scope.showUpdatePwd=false;
    //确认是否注销
    $scope.doLoginOut=function () {
        $scope.showConfirmLoginOut=true;
    }

    //注销
    $scope.loginOut=function () {
        loginService.doLoginOut().then(function (resp) {
            if(resp.message=='您已安全退出'){
                window.location=baseUrl+"/login/index";
            }
        });
    }


    //跳转至修改密码页面
    $scope.doUpdatePwd=function () {
        window.location=baseUrl+"/login/toUpdatePwd";
    }


}).controller('userUpdatePwd',function($scope,$rootScope,loginService){

    //修改密码
    $scope.updatePwd=function () {


        if(!$scope.user){
            $scope.errorTips="输入框都不能为空";
            return false;
        }

        else  if(!$scope.user.password){
            $scope.errorTips="原密码不能为空！";
            return false;
        }
       else if(!$scope.user.newPassword){
            $scope.errorTips="新密码不能为空！";
            return false;
        }
        else if(!$scope.repeatPassword){
            $scope.errorTips="确认的新密码不能为空！";
            return false;
        }
        else if($scope.repeatPassword!=$scope.user.newPassword){
            $scope.errorTips="两次输入的新密码必须保持一致！";
            return false;
        }


        loginService.updatePwd($scope.user).then(function (resp) {

            if(resp.message=='旧密码输入有误，请重新输入!'){
                $scope.errorTips="旧密码输入有误，请重新输入!";
            }

            else if(resp.message=='密码修改成功，请重新登录！'){
                window.location=baseUrl+"/login/index";
            }


        });


    }

})