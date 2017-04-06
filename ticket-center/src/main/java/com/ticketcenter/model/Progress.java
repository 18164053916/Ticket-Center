package com.ticketcenter.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by LiHao on 2017/3/24.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Progress {

    private int id;

    private int proId;//项目的id

    private int ratio;//进度

    private int total;//总页数

     private String taskDesc;//已完成项目描述

    private int isRisk;//是否有风险 1:无风险；2：有风险

    private String riskTips;//风险提示

    private int isUpdated;//是否变更. 1：否；2：是

    private String updatedDesc;//变更描述

    private String remark;//备注

    private int progressOrder;//进度顺序

    private Date createDate;//创建日期

    private Date updateDate;//修改日期

    private int createPerson;//创建人ID

    private int updatePerson;//修改人ID

    private String workOrderNo;//工单号

    private Date startDate;//进度开始日期

    private     Date endDate;//进度结束日期

    private Date projectStartDate;//项目开始时间

    private Date projectEndDate;//项目结束时间

    private String projectCode;//项目编号

    private String projectName;//项目名称

    private String proTypeName;//项目类型名称

    private int effortsHours;//项目工时

    private int auditResult;//审核状态

    private int isEnd;//是否结项

    private int isTerminal;//是否终止项目

    private String teminalReason;//项目终止原因

    private String teminalRemark;//项目终止备注

    private int riskTimes;//风险提示次数

    private int updateTimes;//变更次数

    private String members;//项目成员

    private String projectLeader;//维护人员

    private AuditLog auditLog;

    private int auditLogId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public int getRatio() {
        return ratio;
    }

    public void setRatio(int ratio) {
        this.ratio = ratio;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public int getIsRisk() {
        return isRisk;
    }

    public void setIsRisk(int isRisk) {
        this.isRisk = isRisk;
    }

    public String getRiskTips() {
        return riskTips;
    }

    public void setRiskTips(String riskTips) {
        this.riskTips = riskTips;
    }

    public int getIsUpdated() {
        return isUpdated;
    }

    public void setIsUpdated(int isUpdated) {
        this.isUpdated = isUpdated;
    }

    public String getUpdatedDesc() {
        return updatedDesc;
    }

    public void setUpdatedDesc(String updatedDesc) {
        this.updatedDesc = updatedDesc;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getProgressOrder() {
        return progressOrder;
    }

    public void setProgressOrder(int progressOrder) {
        this.progressOrder = progressOrder;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getCreatePerson() {
        return createPerson;
    }

    public void setCreatePerson(int createPerson) {
        this.createPerson = createPerson;
    }

    public int getUpdatePerson() {
        return updatePerson;
    }

    public void setUpdatePerson(int updatePerson) {
        this.updatePerson = updatePerson;
    }

    public String getWorkOrderNo() {
        return workOrderNo;
    }

    public void setWorkOrderNo(String workOrderNo) {
        this.workOrderNo = workOrderNo;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProTypeName() {
        return proTypeName;
    }

    public void setProTypeName(String proTypeName) {
        this.proTypeName = proTypeName;
    }

    public int getEffortsHours() {
        return effortsHours;
    }

    public void setEffortsHours(int effortsHours) {
        this.effortsHours = effortsHours;
    }

    public int getAuditResult() {
        return auditResult;
    }

    public void setAuditResult(int auditResult) {
        this.auditResult = auditResult;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getProjectStartDate() {
        return projectStartDate;
    }

    public void setProjectStartDate(Date projectStartDate) {
        this.projectStartDate = projectStartDate;
    }

    public Date getProjectEndDate() {
        return projectEndDate;
    }

    public void setProjectEndDate(Date projectEndDate) {
        this.projectEndDate = projectEndDate;
    }

    public int getIsEnd() {
        return isEnd;
    }

    public void setIsEnd(int isEnd) {
        this.isEnd = isEnd;
    }

    public int getRiskTimes() {
        return riskTimes;
    }

    public void setRiskTimes(int riskTimes) {
        this.riskTimes = riskTimes;
    }

    public int getUpdateTimes() {
        return updateTimes;
    }

    public void setUpdateTimes(int updateTimes) {
        this.updateTimes = updateTimes;
    }

    public String getMembers() {
        return members;
    }

    public void setMembers(String members) {
        this.members = members;
    }

    public String getProjectLeader() {
        return projectLeader;
    }

    public void setProjectLeader(String projectLeader) {
        this.projectLeader = projectLeader;
    }

    public AuditLog getAuditLog() {
        return auditLog;
    }

    public void setAuditLog(AuditLog auditLog) {
        this.auditLog = auditLog;
    }

    public int getIsTerminal() {
        return isTerminal;
    }

    public void setIsTerminal(int isTerminal) {
        this.isTerminal = isTerminal;
    }

    public String getTeminalReason() {
        return teminalReason;
    }

    public void setTeminalReason(String teminalReason) {
        this.teminalReason = teminalReason;
    }

    public String getTeminalRemark() {
        return teminalRemark;
    }

    public void setTeminalRemark(String teminalRemark) {
        this.teminalRemark = teminalRemark;
    }

    public int getAuditLogId() {
        return auditLogId;
    }

    public void setAuditLogId(int auditLogId) {
        this.auditLogId = auditLogId;
    }
}
