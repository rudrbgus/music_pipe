package com.meatjellyburgur.musicpipe.controller;

import com.meatjellyburgur.musicpipe.common.Page;
import com.meatjellyburgur.musicpipe.dto.request.TeamRegisterRequestDTO;
import com.meatjellyburgur.musicpipe.dto.response.SignInUserResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.TeamListResponseDTO;
import com.meatjellyburgur.musicpipe.repository.TeamMapper;
import com.meatjellyburgur.musicpipe.service.TeamService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import static com.meatjellyburgur.musicpipe.util.SignInUtils.LOGIN_KEY;

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
    @GetMapping("/findAll/page/{pageNo}")
    public ResponseEntity<?> findAllTeam(@PathVariable int pageNo){
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setAmount(5);
        TeamListResponseDTO allteamListResponseDTO = teamService.getList(page);

        return ResponseEntity.ok().body(allteamListResponseDTO);
    }

    // 팀 단일 조회
    //이름 또는 아이디로 조회하게
    ///team/findOne/type/keyword
    // 팀 목록조회 -> 페이징 처리
    @GetMapping("/findOne/{type}/{keyWord}/page/{pageNo}")
    public ResponseEntity<?> findOneTeam(
            @PathVariable String type,
            @PathVariable String keyWord,
            @PathVariable int pageNo
    ) {
        
        Page page = new Page();
        page.setPageNo(pageNo);
        page.setAmount(5);
        TeamListResponseDTO findteamListResponseDTO = teamService.getListByKeyWord(page,type,keyWord);


       return ResponseEntity.ok().body(findteamListResponseDTO);
    }

    @PostMapping("/register")
    public ResponseEntity<?> teamSave(String teamName,HttpSession session){
        //가져올 정보
        //
        //team table
        //teamid
        //team name
        //유저 id
        //권한

        //세션에서 user_id 가져오기
        SignInUserResponseDTO login = (SignInUserResponseDTO) session.getAttribute("login");
        int userId = login.getUserId();
        //포장해서 service로 보내기
        TeamRegisterRequestDTO dto= new TeamRegisterRequestDTO();
        dto.setUserId(userId);
        dto.setTeamName(teamName);
        teamService.createTeam(dto);
        return null;

    }



    //팀 생성
//    - 팀생성 버튼을 누르면
//    - 팀 id autofh들어가고
//    - 팀명 들어감
//- team_member_info  에  join 조건 → 팀 id
//    - equipmemnt_id 찾아서 넣기
//    - roll→ default member로 놓기
    @PostMapping
    public ResponseEntity<?> createTeam(TeamRegisterRequestDTO dto
            , BindingResult result
            , HttpSession session){

        if (result.hasErrors()){
            return ResponseEntity
                    .badRequest()
                    .body(result.toString());
        }

        try{
//            teamService.createTeam(dto,session)
        }catch (Exception e){

        }



        return null;
    }

}
