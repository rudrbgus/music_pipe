package com.meatjellyburgur.musicpipe.controller;

import com.fasterxml.jackson.annotation.JsonKey;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.meatjellyburgur.musicpipe.common.Page;
import com.meatjellyburgur.musicpipe.common.PageMaker;
import com.meatjellyburgur.musicpipe.common.Search;
import com.meatjellyburgur.musicpipe.dto.request.*;
import com.meatjellyburgur.musicpipe.dto.response.FindUserResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.SignInUserResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.UserProfileResponseDTO;
import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.service.*;
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
    private final PersonalAbilityService personalAbilityService;


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

    // 유저 리스트 폼 응답
    @GetMapping("/list")
    public String showList() {
        log.info("/user/list GET!!");

        return "/User/user-list";
    }
    // 악기 코드 받아서 유저 리스트 페이지에 악기 넣어줌
    @PostMapping("/list/instrument")
    public String showInstrumentList(String keyword, Model model){
        log.info("equipmentId: {}", keyword);
        if(keyword.equals("피아노")){
            model.addAttribute("instrument", 2);
        } else if (keyword.equals("드럼")) {
            model.addAttribute("instrument", 7);
        }else if (keyword.equals("키보드")) {
            model.addAttribute("instrument", 3);
        }else if (keyword.equals("어쿠스틱")) {
            model.addAttribute("instrument", 4);
        }else if (keyword.equals("일렉")) {
            model.addAttribute("instrument", 5);
        }else if (keyword.equals("베이스")) {
            model.addAttribute("instrument", 6);
        }else if (keyword.equals("보컬")) {
            model.addAttribute("instrument", 1);
        }else if (keyword.equals("기타")) {
            model.addAttribute("instrument", 8);
        }
        if(keyword.equals("0")){
            model.addAttribute("instrument", 0);
        }
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
        return ResponseEntity.ok().body(allUserByInstrumentId);
    }

    // 유저 프로필 주는 url
    @GetMapping("/profile")
    public String showProfile(String email,HttpSession session, Model model) {
        log.debug("user/profile POST!!!");
        log.info("email {}",email);
        SignInUserResponseDTO sininDTO =(SignInUserResponseDTO) session.getAttribute(LOGIN_KEY);
        User user = userService.getUser(email);
        log.info("user{}",user);
        String teamName=null;
        if(user.getTeamId()!=0){
            //0이아니면 팀이 있다는 소리니까 팀을 찾아서 반환해야함.
            teamName = teamService.findTeamName(user.getTeamId());
            log.info("팀 있음");
        }

        //userid 기반으로 personal_ablity 테이블에 값이 있는지 없는지 알아내기
        List<PersonalAbility> allEquipmentByUserId = personalAbilityService.findAllEquipmentByUserId(user.getUserId());

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
//        return "redirect:/user/profile?email="+email;
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
    // 유저에 자기소개 넣기
    @PostMapping("/introduce")
    public String modifyUserIntroduceText(@RequestBody UserIntroduceRequestDTO introduceText, HttpSession session){
        System.out.println("/user/introduce Post!!!");
        System.out.println(introduceText);
        userService.modifyUserIntroduceText(introduceText.getIntroduceText(), session);
        return null;
    }

    // 유저에 악기 넣기 -> 비동기
    @PostMapping("/instrument")
    public ResponseEntity<?>  userInstrumentModify(HttpSession session, @RequestBody UserInstrumentRequestDTO dto){
        System.out.println("dto = " + dto);
        User user = userService.getUser(dto.getEmail());
        log.info("유저 아이디: {}", user.getUserId());
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


    // 유저의 팀이 있으면 그 팀을 가져와서 역할을 확인해서 리더면 요청이 온 것을 보내줌
    

}
