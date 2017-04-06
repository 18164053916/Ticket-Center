package com.ticketcenter.controller;

import com.ticketcenter.model.DemandType;
import com.ticketcenter.model.ProjectType;
import com.ticketcenter.service.DemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by baron.wei on 2017/3/28.
 */
@Controller
public class DemandController {

    @Autowired
    DemandService demandService;

    @RequestMapping(value="/api/v1/demand/type/tree",method= RequestMethod.GET)
    @ResponseBody
    public List<DemandType> getProjectTypes() {
        return demandService.getDemandTypeTreeData();
    }

}
