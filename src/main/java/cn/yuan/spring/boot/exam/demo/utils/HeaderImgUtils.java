package cn.yuan.spring.boot.exam.demo.utils;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;

public class HeaderImgUtils {

    public static String getPath(Part headerImg) {
        String contentType = headerImg.getContentType();
        String suffix = contentType.replace("image/", "");
        String fileName = UUID.randomUUID().toString().replace("-", "") + "." + suffix;
        String storeDir = "F:/杬/Spring-Boot-Exam/src/main/resources/static";
        String path = "headerImg/" + fileName;
        File file = new File(storeDir, path);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        try {
            Files.copy(headerImg.getInputStream(), file.toPath());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return path;
    }
}
