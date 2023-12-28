package com.meatjellyburgur.musicpipe.controller;

import com.meatjellyburgur.musicpipe.dto.response.TeamListResponseDTO;
import com.meatjellyburgur.musicpipe.repository.TeamMapper;
import com.meatjellyburgur.musicpipe.service.TeamService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequestMapping("/team")
@RequiredArgsConstructor
public class TeamController {
    private  final TeamService teamService;

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
    //이름 또는 아이디로 조회하게
//    /team/findOne/type/keyword
    // 팀 목록조회 -> 페이징 처리
    @GetMapping("/findOne/{type}/{keyWord}")
    public ResponseEntity<?> findOneTeam(
            @PathVariable String type,
            @PathVariable String keyWord
    ) {
        TeamListResponseDTO teamList= teamService.getList();

    }
}
