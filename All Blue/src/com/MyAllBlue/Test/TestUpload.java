package com.MyAllBlue.Test;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

public class TestUpload extends ActionSupport {
 /*   private File img;
    private String imgFileName;
    private String imgContentType;

    public void setImg(File img) {
        this.img = img;
    }

    public void setImgFileName(String imgFileName) {
        this.imgFileName = imgFileName;
    }

    public void setImgContentType(String imgContentType) {
        this.imgContentType = imgContentType;
    }


    public String upLoadImg() throws Exception {

        String realpath = ServletActionContext.getServletContext().getRealPath("/image");
        System.out.println("realpath: "+realpath);
        if(img != null){
            File savefile = new File(new File(realpath), imgFileName);
            System.out.println(savefile);

            if(savefile.getParentFile().exists()){
                try {
                    savefile.getParentFile().mkdirs();
                    FileUtils.copyFile(img, savefile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                ActionContext.getContext().put("message", "文件上传成功");
            }
        }


        return null;
    }*/
}
