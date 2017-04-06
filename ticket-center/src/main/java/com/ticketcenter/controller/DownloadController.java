package com.ticketcenter.controller;

import com.ticketcenter.constants.Constants;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;

/**
 * Created by baron.wei on 2017/3/30.
 */
@Controller
@RequestMapping("/download")
public class DownloadController {

    @RequestMapping("/{name}.{type}")
    @ResponseBody
    public ResponseEntity<byte[]> downloadFile(@PathVariable String name, @PathVariable String type){

        String fileName = name+"."+type;
        String filePath = Constants.DOWNLOAD_PATH+fileName;
        //设置在D盘
        File files = new File(filePath);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        try {
            return new ResponseEntity<>(FileUtils.readFileToByteArray(files),
                    headers, HttpStatus.CREATED);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
