package com.ticketcenter.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.Gson;

import java.util.Date;
import java.util.List;

/**
 * Created by baron.wei on 2017/3/24.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Project {

    private int id=-1;

    private String uuid;

    private String name;

    private String code;

    private String startDate;

    private String endDate;

    private String finishDate;

    private String projectLeader;//项目维护人

    /*预计人天*/
    private double estimatedDays;

    private int type;

    private String typeName;

    private String customerName;

    /*进度维护人*/
    private int scheduleMaintenanceUserId;

    private String scheduleMaintenanceUserName;

    /*开发接口人*/
    private String developerKeyUser;

    private String developerKeyUserEmail;

    /*现场接口人*/
    private String sceneKeyUser;

    private String sceneKeyUserEmail;

    /*需求接口人*/
    private String demandKeyUser;

    private String demandKeyUserEmail;

    private int demandType;

    private String demandTypeName;

    private String demandKeyword;

    private String workOrderNumber;

    //add by lihao----start

    private String workOrderNo;//工单号

    private int progressId;//进度的主键ID

    private int progressOrder; //进度的顺序

    private int auditResult;//审核状态

    private List<Progress> progressList;//进度的列表

    private String proTypeName;//项目种类名称

    private int efforsHours;//预估工作量

    private int maxRatio;//最大的进度

    private int isRisk;//是否有风险

    private int isUpdated;//是否有变更

    private int isAudit;//是否处于待审核状态

    private int riskCount;//风险次数

    private int updatedCount;//变更次数

    private Date startsDate;//开始时间

    private Date endsDate;//结束时间

    //add by lihao----end

    /*项目成员*/
    private List<String> members;

    private List<String> proTypeList;

    private List<Integer> auditList;

    private List<String> membersName;

    private boolean stopFlag;

    private String stopReason;

    private String stopMemo;

    private int total;

    public String getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(String finishDate) {
        this.finishDate = finishDate;
    }

    public boolean isStopFlag() {
        return stopFlag;
    }

    public void setStopFlag(boolean stopFlag) {
        this.stopFlag = stopFlag;
    }

    public String getStopReason() {
        return stopReason;
    }

    public void setStopReason(String stopReason) {
        this.stopReason = stopReason;
    }

    public String getStopMemo() {
        return stopMemo;
    }

    public void setStopMemo(String stopMemo) {
        this.stopMemo = stopMemo;
    }

    public String getDemandTypeName() {
        return demandTypeName;
    }

    public void setDemandTypeName(String demandTypeName) {
        this.demandTypeName = demandTypeName;
    }

    public String getScheduleMaintenanceUserName() {
        return scheduleMaintenanceUserName;
    }

    public void setScheduleMaintenanceUserName(String scheduleMaintenanceUserName) {
        this.scheduleMaintenanceUserName = scheduleMaintenanceUserName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<String> getMembers() {
        return members;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getWorkOrderNumber() {
        return workOrderNumber;
    }

    public void setWorkOrderNumber(String workOrderNumber) {
        this.workOrderNumber = workOrderNumber;
    }

    public void setMembers(List<String> members) {
        this.members = members;
    }

    public List<String> getMembersName() {
        return membersName;
    }

    public void setMembersName(List<String> membersName) {
        this.membersName = membersName;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public double getEstimatedDays() {
        return estimatedDays;
    }

    public void setEstimatedDays(double estimatedDays) {
        this.estimatedDays = estimatedDays;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getScheduleMaintenanceUserId() {
        return scheduleMaintenanceUserId;
    }

    public void setScheduleMaintenanceUserId(int scheduleMaintenanceUserId) {
        this.scheduleMaintenanceUserId = scheduleMaintenanceUserId;
    }

    public String getDeveloperKeyUser() {
        return developerKeyUser;
    }

    public void setDeveloperKeyUser(String developerKeyUser) {
        this.developerKeyUser = developerKeyUser;
    }

    public String getDeveloperKeyUserEmail() {
        return developerKeyUserEmail;
    }

    public void setDeveloperKeyUserEmail(String developerKeyUserEmail) {
        this.developerKeyUserEmail = developerKeyUserEmail;
    }

    public String getSceneKeyUser() {
        return sceneKeyUser;
    }

    public void setSceneKeyUser(String sceneKeyUser) {
        this.sceneKeyUser = sceneKeyUser;
    }

    public String getSceneKeyUserEmail() {
        return sceneKeyUserEmail;
    }

    public void setSceneKeyUserEmail(String sceneKeyUserEmail) {
        this.sceneKeyUserEmail = sceneKeyUserEmail;
    }

    public String getDemandKeyUser() {
        return demandKeyUser;
    }

    public void setDemandKeyUser(String demandKeyUser) {
        this.demandKeyUser = demandKeyUser;
    }

    public String getDemandKeyUserEmail() {
        return demandKeyUserEmail;
    }

    public void setDemandKeyUserEmail(String demandKeyUserEmail) {
        this.demandKeyUserEmail = demandKeyUserEmail;
    }

    public int getDemandType() {
        return demandType;
    }

    public void setDemandType(int demandType) {
        this.demandType = demandType;
    }


    public String getDemandKeyword() {
        return demandKeyword;
    }

    public void setDemandKeyword(String demandKeyword) {
        this.demandKeyword = demandKeyword;
    }

    public String getWorkOrderNo() {
        return workOrderNo;
    }

    public void setWorkOrderNo(String workOrderNo) {
        this.workOrderNo = workOrderNo;
    }

    public int getProgressId() {
        return progressId;
    }

    public void setProgressId(int progressId) {
        this.progressId = progressId;
    }

    public int getProgressOrder() {
        return progressOrder;
    }

    public void setProgressOrder(int progressOrder) {
        this.progressOrder = progressOrder;
    }

    public int getAuditResult() {
        return auditResult;
    }

    public void setAuditResult(int auditResult) {
        this.auditResult = auditResult;
    }

    public List<Progress> getProgressList() {
        return progressList;
    }

    public void setProgressList(List<Progress> progressList) {
        this.progressList = progressList;
    }

    public String getProTypeName() {
        return proTypeName;
    }

    public void setProTypeName(String proTypeName) {
        this.proTypeName = proTypeName;
    }

    public int getEfforsHours() {
        return efforsHours;
    }

    public void setEfforsHours(int efforsHours) {
        this.efforsHours = efforsHours;
    }

    public Date getStartsDate() {
        return startsDate;
    }

    public void setStartsDate(Date startsDate) {
        this.startsDate = startsDate;
    }

    public Date getEndsDate() {
        return endsDate;
    }

    public void setEndsDate(Date endsDate) {
        this.endsDate = endsDate;
    }


    @Override
    public String toString() {
        return new Gson().toJson(this);
    }

    public String getProjectLeader() {
        return projectLeader;
    }

    public void setProjectLeader(String projectLeader) {
        this.projectLeader = projectLeader;
    }

    public List<String> getProTypeList() {
        return proTypeList;
    }

    public void setProTypeList(List<String> proTypeList) {
        this.proTypeList = proTypeList;
    }

    public List<Integer> getAuditList() {
        return auditList;
    }

    public void setAuditList(List<Integer> auditList) {
        this.auditList = auditList;
    }

    public int getMaxRatio() {
        return maxRatio;
    }

    public void setMaxRatio(int maxRatio) {
        this.maxRatio = maxRatio;
    }

    public int getRiskCount() {
        return riskCount;
    }

    public void setRiskCount(int riskCount) {
        this.riskCount = riskCount;
    }

    public int getUpdatedCount() {
        return updatedCount;
    }

    public void setUpdatedCount(int updatedCount) {
        this.updatedCount = updatedCount;
    }

    public int getIsRisk() {
        return isRisk;
    }

    public void setIsRisk(int isRisk) {
        this.isRisk = isRisk;
    }

    public int getIsUpdated() {
        return isUpdated;
    }

    public void setIsUpdated(int isUpdated) {
        this.isUpdated = isUpdated;
    }

    public int getIsAudit() {
        return isAudit;
    }

    public void setIsAudit(int isAudit) {
        this.isAudit = isAudit;
    }
}
