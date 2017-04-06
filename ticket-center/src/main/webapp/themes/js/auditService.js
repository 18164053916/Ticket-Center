angular.module('ticketCenterApp')
    .factory("auditService",function ($http,Utils) {

        var auditService={};

        auditService.getDayList =function(){
            return Utils.postDataSync(baseUrl+"/audit/getDayList","","GET");
        }


        auditService.getProjectList =function(pager,queryType){
            return Utils.postDataSync(baseUrl+"/audit/list/"+queryType,pager,"PUT");
        }


        auditService.getProgressById =function(progressId){
            return Utils.postDataSync(baseUrl+"/progress/singleDetail/"+progressId,"","GET");
        }

        auditService.insertAuditLog =function(auditLog){
            return Utils.postDataSync(baseUrl+"/audit/insert",auditLog,"PUT");
        }

        auditService.getProgressOption =function(projectId,queryType){
            return Utils.postDataSync(baseUrl+"/progress/progressOption/"+projectId+"/"+queryType,"","GET");
        }


        return auditService;


    })