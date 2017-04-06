angular.module('ticketCenterApp')
    .factory("progressService",function ($http,Utils) {
        var progressService={};

        progressService.getDayList =function(){
            return Utils.postDataSync(baseUrl+"/progress/getDayList","","GET");
        }


        progressService.getProjectList =function(pager,queryType){
            return Utils.postDataSync(baseUrl+"/progress/list/"+queryType,pager,"PUT");
        }

        progressService.updateProgress =function(progress,id,start_date,end_date){
            return Utils.postDataSync(baseUrl+"/progress/add/"+id+"/"+start_date+"/"+end_date,progress,"PUT");
        }


        progressService.getProjectDetails =function(id){
            return Utils.postDataSync(baseUrl+"/progress/details/"+id,"","GET");
        }

        progressService.getProgressById =function(progressId){
            return Utils.postDataSync(baseUrl+"/progress/singleDetail/"+progressId,"","GET");
        }




        return progressService;
    })