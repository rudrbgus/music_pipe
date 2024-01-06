package com.meatjellyburgur.musicpipe.controller;

import com.fasterxml.jackson.annotation.JsonKey;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.meatjellyburgur.musicpipe.common.Page;
import com.meatjellyburgur.musicpipe.common.PageMaker;
import com.meatjellyburgur.musicpipe.common.Search;
import com.meatjellyburgur.musicpipe.dto.request.ListRequestDTO;
import com.meatjellyburgur.musicpipe.dto.request.SignInRequestDTO;
import com.meatjellyburgur.musicpipe.dto.request.SignUpRequestDTO;
import com.meatjellyburgur.musicpipe.dto.request.UserInstrumentRequestDTO;
import com.meatjellyburgur.musicpipe.dto.response.FindUserResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.SignInUserResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.UserProfileResponseDTO;
import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.service.InstrumentService;
import com.meatjellyburgur.musicpipe.service.SigninResult;
import com.meatjellyburgur.musicpipe.service.TeamService;
import com.meatjellyburgur.musicpipe.service.UserService;
import com.meatjellyburgur.musicpipe.util.SignInUtils;
import com.meatjellyburgur.musicpipe.util.upload.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

import static com.meatjellyburgur.musicpipe.util.SignInUtils.*;

@Controller
@RequestMapping("/user")
@Slf4j
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final InstrumentService instrumentService;
    private final TeamService teamService;


    @Value("${file.upload.root-path}")
    private String rootPath;
    /*
        해야 될 것
        1. 회원가입 (○)
        2. 회원 이메일 , 닉네임 중복 검증 요청 (○)
        3. 로그인 요청 (○)
        3. 로그아웃 요청 처리
     */

    // 회원가입 처리
    @PostMapping("/sign-up")
    public String signUp(SignUpRequestDTO dto) { // 파라미터로 회원가입 DTO 만들어야함
        log.info("/user/sign-up Post");
        boolean flag = userService.join(dto);
        log.info("회원가입에 " + (flag ? "성공했습니다" : "실패했습니다"));
        return "redirect:/";
    }

    // 회원 가입 양식 요청
    @GetMapping("/sign-up")
    public String signUp() {
        log.info("/user/sign-up Get");

        return "/User/sign-up";
    }

    // 로그인 양식 요청
    @GetMapping("/sign-in")
    public String signIn() { // 세션 받아야함 파라미터로
        log.info("/user/sign-in GET!!");

        return "/User/sign-in";
    }

    // 로그인 검증 요청
    @PostMapping("/sign-in")
    public String signIn(SignInRequestDTO dto, HttpServletResponse response, HttpServletRequest request, RedirectAttributes ra) {
        log.info("/user/sign-in POST!!");
        SigninResult result = userService.authenticate(dto, request, response);
        log.info("로그인 결과: {}", result);
        ra.addFlashAttribute("result", result);

        if (result == SigninResult.SUCCESS) {
            // 세션으로 로그인 유지
            userService.maintainLoginState(request.getSession(), dto.getEmail());


            return "redirect:/";
        }


        return "redirect:/user/sign-in";
    }

    // 로그아웃 요청 처리
    @GetMapping("/sign-out")
    public String signOut(
            HttpServletRequest request
            , HttpServletResponse response
            // HttpSession session
    ) {
        // 세션 얻기
        HttpSession session = request.getSession();

        // 로그인 상태인지 확인
        if (isLogin(session)) {
            //자동 로그인 상태인지도 확인
            if (SignInUtils.isLogin(request.getSession())) {
                // 쿠키를 삭제해주고 디비데이터도 원래대로 돌려놓는다.
                userService.autoLoginClear(request, response);
            }

            // 세션에서 로그인 정보 기록 삭제
            session.removeAttribute(LOGIN_KEY);

            // 세션을 초기화(RESET)
            session.invalidate();

            return "redirect:/";
        }
        return "redirect:/members/sign-in";
    }


    // 개인 정보 요청
    @RequestMapping("/detail")
    public String detail(String email) {
//        log.info("/user/detail POST!!");
//        log.info("유저가 준 이메일 : {}", email);
//        User findUser = userService.getUser(email);
//        log.info("유저 아이디: " + findUser.getUserId());
//
//        PersonalAbility personalAbility = instrumentService.getPersonalAbility(findUser.getUserId());
//
//        System.out.println(personalAbility);


        // 여기서 모델에 담아서 보내야됨.
        return "/board/write";
    }


    // 회원가입 중복 검사 -> 비동기 처리
    @GetMapping("/check")
    @ResponseBody
    public ResponseEntity<?> duplicate(String type, String keyword) {
        boolean duplicate = userService.duplicate(type, keyword);
        log.info(duplicate + "");
        return ResponseEntity.ok().body(duplicate);
    }


    // 팀 아이디 주면 해당하는 팀 번호를 가진 유저리스트 보내줌 (동기처리)
    @PostMapping("/team")
    public List<User> findUserByTeamId(int teamId) {
        log.info("/user/team Post !!");
        List<User> allUserByTeamId = userService.findAllUserByTeamId(teamId);
        System.out.println(allUserByTeamId);
        return allUserByTeamId;
    }


    @GetMapping("/list")
    public String showList() {
        log.info("/user/list GET!!");

        return "/User/user-list";
    }

    @PostMapping("/list/search")
    public String showListBySearch(){

        return null;
    }

    // 악기 주면 해당 악기 가진 사람 리스트 보내줌
    @PostMapping("/list")
    public ResponseEntity<?> showList(@RequestBody ListRequestDTO requestBody, Model model) {
        log.info("dto{}",requestBody);
        System.out.println();
        Page page = Page.builder()
                .pageNo(requestBody.getPageNo())
                .amount(requestBody.getAmount())
                .build();
        log.info("/user/list Post!!!");
        log.info("instrumentId :" + requestBody.getEquipmentId());
        HashMap<Object, Object> allUserByInstrumentId = userService.findAllUserByInstrumentId(Integer.parseInt(requestBody.getEquipmentId()), page);
        log.info(allUserByInstrumentId.toString());
        return ResponseEntity.ok().body(allUserByInstrumentId);
    }

    // 유저 프로필 주는 url
    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        log.debug("user/profile POST!!!");
        SignInUserResponseDTO loginDTO =(SignInUserResponseDTO) session.getAttribute("login");
        String email = loginDTO.getEmail();
        log.info("email: {}", email);
        User user = userService.getUser(email);
        String teamName=null;
        if(user.getTeamId()!=0){
            //0이아니면 팀이 있다는 소리니까 팀을 찾아서 반환해야함.
            teamName = teamService.findTeamName(user.getTeamId());


        }

        UserProfileResponseDTO dto = UserProfileResponseDTO.builder()
                .sex(user.getSex())
                .team_id(user.getTeamId())
                .teamName(teamName)
                .profileImagePath(user.getProfileImagePath())
                .email(user.getEmail())
                .nickname(user.getNickname())
                .introduceText(user.getIntroduceText())
                .build();
        model.addAttribute("user", dto);
        System.out.println("dto = " + dto);
        return "/profile/profile";
    }

    // 프로필 이미지 추가하는 Url
    @PostMapping("/addProfileImage")
    public String modifyProfile(MultipartFile thumbnail, HttpSession session) {
        log.info("/user/addProfileImage POST!!! ");
        String savedPath = FileUtil.uploadFile(thumbnail, rootPath);
        boolean flag = userService.changeProfileImagePath(savedPath, session);
        System.out.println("파일 저장: " + flag);

        return "redirect:/";
    }

    // 유저에 악기 넣기 -> 비동기
    @PostMapping("/instrument")
    public ResponseEntity<?>  userInstrumentModify(HttpSession session, @RequestBody UserInstrumentRequestDTO dto){
        //System.out.println("dto = " + dto);
        User user = userService.getUser(dto.getEmail());
        //log.info("유저 아이디: {}", user.getUserId());
        if(dto.isOnOff()){ // 추가하는문
            instrumentService.addPersonalAbility(user.getUserId(), dto);
        } else{
            instrumentService.removePersonalAbility(user.getUserId(), dto);
        }

        return null;
    }

    //유저의 악기 가져오기 -> 비동기
    @PostMapping("/getInstrument")
    public ResponseEntity<?> getUserInstrument(@RequestBody UserInstrumentRequestDTO dto){

        User user = userService.getUser(dto.getEmail());
        List<PersonalAbility> personalAbilityList = instrumentService.findPersonalAbilityList(user.getUserId());

        return ResponseEntity.ok().body(personalAbilityList);

    }

}
