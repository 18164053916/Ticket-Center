package com.ticketcenter.service.impl;

import com.google.gson.Gson;
import com.ticketcenter.dao.DemandDao;
import com.ticketcenter.model.DemandType;
import com.ticketcenter.model.MessageReturn;
import com.ticketcenter.service.DemandService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by baron.wei on 2017/3/28.
 */
@Service
public class DemandServiceImpl implements DemandService {

    private Logger logger = LoggerFactory.getLogger(DemandServiceImpl.class);


    @Autowired
    DemandDao demandDao;

    @Override
    public List<DemandType> getDemandTypeTreeData() {
        List<DemandType> demandTypes = demandTypeListToTree(getDemandTypeDataList());
        return demandTypes;
    }

    /**
     * list 转换为树形数据。
     * @param list
     * @return
     */
    private List<DemandType> demandTypeListToTree(List<DemandType> list){
        List<DemandType> rootTrees = new ArrayList<DemandType>();
        for (DemandType t1 : list) {
            if(t1.getParentId() == null){
                rootTrees.add(t1);
            }
            for (DemandType t2 : list) {
                if(t2.getParentId() == t1.getId()){
                    if(t1.getChildrens() == null){
                        List<DemandType> myChildrens = new ArrayList<DemandType>();
                        myChildrens.add(t2);
                        t1.setChildrens(myChildrens);
                    }else{
                        t1.getChildrens().add(t2);
                    }
                }
            }
        }
        return rootTrees;
    }


    @Override
    public List<DemandType> getDemandTypeDataList() {
        List<DemandType> list =null;
        try {
            list = demandDao.getDemandTypeList();
        }catch (Exception e){
            e.printStackTrace();
            logger.error(new MessageReturn().setStatus(-500).setErrmsg(e.getMessage()).toString());
        }
        return list;
    }
}
