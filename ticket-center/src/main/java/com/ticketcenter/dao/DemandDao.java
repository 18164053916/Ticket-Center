package com.ticketcenter.dao;

import com.ticketcenter.model.DemandType;

import java.util.List;

/**
 * Created by baron.wei on 2017/3/28.
 */
public interface DemandDao {

    List<DemandType> getDemandTypeList();

}
