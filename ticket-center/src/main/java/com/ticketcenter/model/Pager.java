package com.ticketcenter.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by baron.wei on 2017/3/29.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Pager {

    private int current;

    private int pageSize;

    private boolean pageFlag=true;

    private Map<String,String> filter =new HashMap<String,String>();

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Map<String, String> getFilter() {
        return filter;
    }

    public void setFilter(Map<String, String> filter) {
        this.filter = filter;
    }

    public boolean isPageFlag() {
        return pageFlag;
    }

    public void setPageFlag(boolean pageFlag) {
        this.pageFlag = pageFlag;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
