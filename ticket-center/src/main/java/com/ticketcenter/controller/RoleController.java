package com.ticketcenter.controller;

import com.ticketcenter.model.SystemRole;
import com.ticketcenter.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by baron.wei on 2017/3/22.
 */
@Controller
@RequestMapping("")
public class RoleController {

    @Autowired
    RoleService roleService;

    @RequestMapping(value = "/api/v1/role/list",method = RequestMethod.GET)
    @ResponseBody
    public List<SystemRole> getRoleList(){
        return roleService.getRoleList();
    }


}
