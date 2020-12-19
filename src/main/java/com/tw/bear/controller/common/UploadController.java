package com.tw.bear.controller.common;

import com.tw.bear.bean.CodeMsg;
import com.tw.bear.bean.Result;
import com.tw.bear.controller.admin.RoleController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 公用上传类
 */
@RequestMapping("/upload")
@Controller
public class UploadController {

    private Logger log = LoggerFactory.getLogger(UploadController.class);

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Value("${bear.upload.photo.sufix}")
    private String uploadPhotoSuffix;

    @Value("${bear.upload.photo.maxsize}")
    private long uploadPhotoMaxsize; //bear.upload.photo.path

    @Value("${bear.upload.photo.path}")
    private String uplaodPhotoPath;

    @RequestMapping(value = "/upload_photo",method = RequestMethod.POST)
    @ResponseBody
    public Result<String> uploadPhoto(MultipartFile photo){
        //判断文件类型，是否是图片
        //获取文件后缀
        String filename = photo.getOriginalFilename();
        if(filename.lastIndexOf(".") == -1){
            return Result.error(CodeMsg.UPLOAD_PHOTO_SUFFIX_ERROR);
        }
        String suffix = filename.substring(filename.lastIndexOf("."));

        if(!uploadPhotoSuffix.contains(suffix.toLowerCase())){
            return Result.error(CodeMsg.UPLOAD_PHOTO_SUFFIX_ERROR);
        }

        if(photo.getSize()/1024 > uploadPhotoMaxsize){
            CodeMsg codeMsg = CodeMsg.UPLOAD_PHOTO_ERROR;
            codeMsg.setMsg("图片大小不能超过"+uploadPhotoMaxsize/1024+"M");
        }
        //准备保存文件
        String date = dateFormat.format(new Date());
        File fileFolder = new File(uplaodPhotoPath+"/"+ date);
        if(!fileFolder.exists())
            fileFolder.mkdir();

        String serverFileName = System.currentTimeMillis()+suffix;
        try {
            photo.transferTo(new File(fileFolder+"/"+serverFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Result.success(date+"/"+serverFileName);
    }
}
