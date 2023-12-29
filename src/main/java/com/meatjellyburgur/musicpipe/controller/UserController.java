package com.meatjellyburgur.musicpipe.controller;

import com.meatjellyburgur.musicpipe.dto.request.SignInRequestDTO;
import com.meatjellyburgur.musicpipe.dto.request.SignUpRequestDTO;
import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.service.InstrumentService;
import com.meatjellyburgur.musicpipe.service.SigninResult;
import com.meatjellyburgur.musicpipe.service.UserService;
import com.meatjellyburgur.musicpipe.util.SignInUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
@Slf4j
@RequiredArgsConstructor
public class UserController {
    private  final UserService userService;
    private final InstrumentService instrumentService;
    /*
        해야 될 것
        1. 회원가입
        2. 회원 이메일 , 닉네임 중복 검증 요청
        3. 로그인 요청
        3. 로그아웃 요청 처리
     */

    // 회원가입 처리
    @PostMapping("/sign-up")
    public String signUp(SignUpRequestDTO dto){ // 파라미터로 회원가입 DTO 만들어야함
        log.info("/user/sign-up Post");
        boolean flag = userService.join(dto);
        log.info("회원가입에 " + (flag?"성공했습니다":"실패했습니다"));
        return "/index";
    }
    // 회원 가입 양식 요청
    @GetMapping("/sign-up")
    public String signUp(){
        log.info("/user/sign-up Get");

        return "/User/sign-up";
    }

    // 로그인 양식 요청
    @GetMapping("/sign-in")
    public String signIn(){ // 세션 받아야함 파라미터로
        log.info("/user/sign-in GET!!");

        return "/User/sign-in";
    }

    // 로그인 검증 요청
    @PostMapping("/sign-in")
    public String signIn(SignInRequestDTO dto, HttpServletResponse response, HttpServletRequest request){
        log.info("/user/sign-in POST!!");
        SigninResult result = userService.authenticate(dto, request, response);
        log.info("로그인 결과: {}", result);

        if(result == SigninResult.SUCCESS){


            // 세션으로 로그인 유지
            userService.maintainLoginState(request.getSession(), dto.getEmail());

            return "redirect:/";
        }

        return "/User/sign-in";
    }

    // 로그아웃 요청 처리


    // 개인 정보 요청
    @PostMapping("/detail")
    public String detail(String email){
        log.info("/user/detail POST!!");
        log.info("유저가 준 이메일 : {}", email);
        User findUser = userService.getUser(email);
        log.info("유저 아이디: " + findUser.getUserId());

        PersonalAbility personalAbility = instrumentService.getPersonalAbility(findUser.getUserId());

        System.out.println(personalAbility);


        // 여기서 모델에 담아서 보내야됨.
        return "";
    }


    // 회원가입 중복 검사
    @GetMapping("/check")
    @ResponseBody
    public ResponseEntity<?> duplicate(String type, String keyword) {
        boolean duplicate = userService.duplicate(type, keyword);
        return ResponseEntity.ok().body(duplicate);
    }



    // 팀 아이디 주면 해당하는 팀 번호를 가진 유저리스트 보내줌 (동기처리)
    @PostMapping("/team")
    public List<User> findUserByTeamId(int teamId){
        log.info("/user/team Post !!");
        List<User> allUserByTeamId = userService.findAllUserByTeamId(teamId);
        System.out.println(allUserByTeamId);
        return allUserByTeamId;
    }


}
