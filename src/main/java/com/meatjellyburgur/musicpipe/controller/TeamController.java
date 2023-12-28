package com.meatjellyburgur.musicpipe.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequestMapping("/team")
@RequiredArgsConstructor
public class TeamController {

    /*
     * 서비스 필요함.
     *
    */

    // 1. 팀 목록 조회 요청
    @GetMapping("")
    public String list(){
        log.info("/team : GET !!");
        return "";
    }

    // 팀 단일 조회
    @PostMapping("")
    public String findOneTeam(int teamId) {
        System.out.println(""+teamId);
        log.info("/team/{} : Post");

        return "";
    }
}
