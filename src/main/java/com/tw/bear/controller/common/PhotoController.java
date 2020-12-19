package com.tw.bear.controller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/photo")
@Controller
public class PhotoController {

    @Autowired
    private ResourceLoader resourceLoader;

    @Value("${bear.upload.photo.path}")
    private String uplaodPhotoPath;

    @RequestMapping("/view")
    public ResponseEntity<?> viewPhoto(@RequestParam(name="filename",required = true)String filename){
        String filePath = uplaodPhotoPath+"/"+filename;
        Resource resource = resourceLoader.getResource("file:"+filePath);
        try{
            return  ResponseEntity.ok(resource);
        }catch (Exception e){
            return ResponseEntity.notFound().build();
        }
    }
}
