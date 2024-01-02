package com.meatjellyburgur.musicpipe.util.upload;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UploadController {
    // application.properties안에 file.upload.root-path 값 있어야함


    @Value("${file.upload.root-path}")
    private String rootPath;

    //업로드 관련 컨트롤러
    @GetMapping("/upload-form")
    public String uploadForm(){
        log.info("/upload-from GET !!");

        // 업로드 관련된 폼 넘겨주기
        return "";
    }

    @PostMapping("/upload-file")
    public String uploadForm(@RequestParam("thumbnail") MultipartFile file){ // 첨푸파일을 받을수 있는 인터페이스
        //log.info("file-name: {}", file.getOriginalFilename());
        //log.info("file-size: {}KB", file.getSize() / 1024.0); // Byte로 나옴
        //log.info("file-type: {}", file.getContentType());

        // 첨부파일을 서버 스토리지에 저장
        // 1. 루트 디렉토리를 생성
        File root = new File(rootPath);
        if(!root.exists()) root.mkdirs();

        /*
        // 첨푸파일을 파일 객체로 생성
        File uploadFile = new File(rootPath, file.getOriginalFilename());

        // 3. 파일을 해당 경로에 저장
        try {
            file.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        */
        String uploadedFilePath = FileUtil.uploadFile(file, rootPath);
        log.info(uploadedFilePath);

        return "";
    }


}
