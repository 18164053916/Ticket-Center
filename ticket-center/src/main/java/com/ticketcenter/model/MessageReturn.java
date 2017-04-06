package com.ticketcenter.model;

import com.google.gson.Gson;
import com.ticketcenter.util.DateFormatTools;

import java.util.Date;

/**
 * Created by baron.wei on 2017/3/21.
 */
public class MessageReturn {

    private int status;

    private String errmsg ;

    private String data;

    private String dateTime;


    public String getData() {
        return data;
    }

    public MessageReturn setData(String data) {
        this.data = data;
        return this;
    }

    public MessageReturn() {
        this.dateTime= DateFormatTools.formatDateToString(new Date());
    }

    public MessageReturn(String dateTime) {
        this.dateTime = dateTime;
    }

    public int getStatus() {
        return status;
    }

    public MessageReturn setStatus(int status) {
        this.status = status;
        return this;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public MessageReturn setErrmsg(String errmsg) {
        this.errmsg = errmsg;
        return this;
    }

    public String getDateTime() {
        return dateTime;
    }

    public MessageReturn setDateTime(String dateTime) {
        this.dateTime = dateTime;
        return this;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
