package com.ticketcenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by baron.wei on 2017/3/17.
 */
@Controller
public class MainController {

    @RequestMapping(value = "/")
    public String index(){
        return "main/login";
    }

}
