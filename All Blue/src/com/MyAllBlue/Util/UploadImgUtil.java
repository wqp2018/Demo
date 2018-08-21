package com.MyAllBlue.Util;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

public class UploadImgUtil {

    public static String upLoadImg(File img,String imgFileName){

        String realpath = ServletActionContext.getServletContext().getRealPath("/image");

        if(img != null){
            File savefile = new File(new File(realpath), imgFileName);


            if(savefile.getParentFile().exists()){
                try {
                    savefile.getParentFile().mkdirs();
                    if(savefile.exists()){
                        System.out.println("图片已存在");
                    }else {
                        FileUtils.copyFile(img, savefile);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                /*ActionContext.getContext().put("message", "文件上传成功");*/
            }
        }
        return "image/"+imgFileName;
    }
}
