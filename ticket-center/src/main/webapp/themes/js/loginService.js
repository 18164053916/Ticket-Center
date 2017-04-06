angular.module('ticketCenterApp')
    .factory("loginService",function ($http,Utils) {
        var loginService={};

        loginService.checkUserLogin =function(userData){
            return Utils.postDataSync(baseUrl+"/login/loginTo",userData,"POST");
        }

        loginService.doLoginOut =function(){
            return Utils.postDataSync(baseUrl+"/login/logout","","GET");
        }


        loginService.updatePwd =function(userData){
            return Utils.postDataSync(baseUrl+"/login/updatePwd",userData,"POST");
        }


        return loginService;
    })