package com.meatjellyburgur.musicpipe.controller;

import com.meatjellyburgur.musicpipe.dto.request.SignInRequestDTO;
import com.meatjellyburgur.musicpipe.dto.request.SignUpRequestDTO;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.service.SigninResult;
import com.meatjellyburgur.musicpipe.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user")
@Slf4j
@RequiredArgsConstructor
public class UserController {
    private  final UserService userService;
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
        log.info("/members/sign-up Post");
        boolean flag = userService.join(dto);
        log.info("회원가입에 " + (flag?"성공했습니다":"실패했습니다"));
        return "/index";
    }
    // 회원 가입 양식 요청
    @GetMapping("/sign-up")
    public String signUp(){
        log.info("/members/sign-up Get");

        return "/User/sign-up";
    }

    // 로그인 양식 요청
    @GetMapping("/sign-in")
    public String signIn(String s){ // 세션 받아야함 파라미터로
        log.info("/members/sign-in GET!!");

        return "/User/sign-in";
    }

    // 로그인 검증 요청
    @PostMapping("/sign-in")
    public String signIn(SignInRequestDTO dto, HttpServletResponse response, HttpServletRequest request){
        log.info("/members/sign-in POST!!");
        SigninResult result = userService.authenticate(dto, request, response);
        log.info("로그인 결과: {}", result);

        if(result == SigninResult.SUCCESS){
            return "/";

            // 세션으로 로그인 유지
            userService.maintainLoginState(request.getSession(), dto.getEmail());
        }

        return "/User/sign-in";
    }

    // 로그아웃 요청 처리





    // 개인 정보 요청
    @GetMapping("/")
    public String detail(String email){
        User findUser = userService.getUser(email);

        // 여기서 모델에 담아서 보내야됨.
        return "";
    }

}
