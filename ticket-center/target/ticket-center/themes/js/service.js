angular.module('ticketCenterApp')
.factory("userService",function ($http,Utils) {
    var userService={};

    userService.updateUser =function(userData){
       return Utils.postDataSync(baseUrl+"/api/v1/user",userData,"PUT");
    }

    userService.getUserPageList=function(pager){
        return Utils.postDataSync(baseUrl+"/api/v1/user/list/page",pager,"GET");
    }

    userService.getUserList=function(){
        return Utils.postDataSync(baseUrl+"/api/v1/user/list","","GET");
    }

    userService.deleteUser=function(id){
        return Utils.postDataSync(baseUrl+"/api/v1/user/"+id,'',"DELETE");
    }

    return userService;
})
.factory("roleService",function (Utils) {
    var roleService={};

    roleService.getRoleList=function(){
        return Utils.postDataSync(baseUrl+"/api/v1/role/list","","GET");
    }

    return roleService;

})
.factory("projectService",function (Utils) {
    var projectService={};

    projectService.updateProject =function(data){
        return Utils.postDataSync(baseUrl+"/api/v1/project",data,"PUT");
    }

    projectService.getProjectPageList=function(pager){
        return Utils.postDataSync(baseUrl+"/get/project/list/page",pager,"POST");
    }

    projectService.stopProject =function (data) {
        return Utils.postDataSync(baseUrl+"/api/v1/project/stop",data,"PUT");
    }

    projectService.getProjectTypes=function (data) {
        return Utils.postDataSync(baseUrl+"/api/v1/project/type/list",data,"GET");
    }


    projectService.getDemandTypesTree=function (data) {
        return Utils.postDataSync(baseUrl+"/api/v1/demand/type/tree",data,"GET");
    }


    projectService.downloadExcel=function (data) {
        return Utils.postDataSync(baseUrl+"/project/excel/download",data,"POST");
    }


    projectService.finishProject =function (data) {
        return Utils.postDataSync(baseUrl+"/api/v1/project/finish",data,"PUT");
    }

    projectService.getProjectDetails =function(id){
        return Utils.postDataSync(baseUrl+"/progress/details/"+id,"","GET");
    }


    return projectService;
})