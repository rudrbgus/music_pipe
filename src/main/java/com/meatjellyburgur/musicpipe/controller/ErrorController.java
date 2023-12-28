package com.meatjellyburgur.musicpipe.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
@Slf4j
public class ErrorController {
    @GetMapping("/404")
    public String error404(){
        log.warn("404 error occured!!! 404에러 떳어요");
        return "";
    }

    @GetMapping("/500")
    public String error500() {
        log.error("500 Error Occured!!! 500에러 떳어요");
        return "";
    }
}
