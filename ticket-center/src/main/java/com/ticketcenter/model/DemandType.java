package com.ticketcenter.model;

import java.util.List;

/**
 * Created by baron.wei on 2017/3/28.
 */
public class DemandType {

    private Integer id;

    private Integer parentId;

    private String name;

    private List<DemandType> childrens;


    public DemandType() {
    }

    public DemandType(Integer id, Integer parentId, String name) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
    }

    public List<DemandType> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<DemandType> childrens) {
        this.childrens = childrens;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
