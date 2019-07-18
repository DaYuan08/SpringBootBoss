package cn.yuan.spring.boot.exam.demo.controller;

import cn.yuan.spring.boot.exam.demo.model.AccountResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@RestController
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    private ServletContext context;

    @PostMapping
    public AccountResponse upload(@RequestParam("file") MultipartFile file) throws IOException {
        return AccountResponse.ofSuccess(store(file));
    }

    private String store(MultipartFile avatarFile) throws IOException {
        String rootDir = context.getRealPath("/");
        File uploadDir = new File(rootDir, "uploadsImg");
        String url = String.format("%s/%s.%s",
                new SimpleDateFormat("yyyy/MM/dd").format(new Date()),
                UUID.randomUUID().toString().replace("-", ""),
                avatarFile.getOriginalFilename().replaceAll("^.*\\.(.*)$", "$1"));
        File storePath = new File(uploadDir, url);
        if (!storePath.getParentFile().exists()) {
            storePath.getParentFile().mkdirs();
        }
        avatarFile.transferTo(storePath);
        return "/uploadsImg/"+url;
    }

}
