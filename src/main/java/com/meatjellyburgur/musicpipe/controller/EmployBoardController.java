package com.meatjellyburgur.musicpipe.controller;

import com.meatjellyburgur.musicpipe.common.PageMaker;
import com.meatjellyburgur.musicpipe.common.Search;

import com.meatjellyburgur.musicpipe.dto.request.BoardWriteRequestDTO;

import com.meatjellyburgur.musicpipe.dto.response.BoardDetailResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.BoardListResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.SignInUserResponseDTO;
import com.meatjellyburgur.musicpipe.service.EmployBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j
public class EmployBoardController {
    private final EmployBoardService employBoardService;

    //1. 목록조회 요청 (/boardlist/list :GET)
    // 검색 필터 조건
    // 1. 포지션별
    //2 현재 모집 중인 공고만 보기 --> 이건 나중에
    //@ModelAttribute("s")  프론트에서 검색 페이지 조건 보내주는 api 밧

//    @GetMapping("/list")
//    public String list(){
//        return "board/together";
//    }
    @GetMapping("/list")
    public String list(@ModelAttribute("s") Search page, Model model){
        List<BoardListResponseDTO> dtoList = employBoardService.getList(page);
        log.info(page.getType());
        //페이징 계산 알고리즘 적용
        PageMaker pageMaker = new PageMaker(page, employBoardService.getCount(page));
        log.info("/board/list GET!");
        log.info("pageNo{},amount{} {} ",page.getPageNo(),page.getAmount(),page.getType());
        model.addAttribute("bList",dtoList);
        model.addAttribute("maker",pageMaker);
//        model.addAttribute("s",page);
        return "board/together";
    }

    //글쓰기 화면 요청
    @GetMapping("/write")
    public  String write(){
        System.out.println("board/write");
        return "board/write";
    }

    @PostMapping("/write")
    public String write(BoardWriteRequestDTO dto, HttpSession session){
        System.out.println("/board/write :post!"+dto);

        //세션에서 user_id 가져오기
        SignInUserResponseDTO login = (SignInUserResponseDTO) session.getAttribute("login");
        int userId = login.getUserId();
        log.info("userId {}",userId);
        dto.setUserId(userId);
        employBoardService.register(dto);
        return "redirect:/board/list";

    }

    // 4. 글 삭제 요청 (/board/delete : GET)
    @GetMapping("/delete")
    //bno->list.jsp가 보낸것
    public String delete(@RequestParam("bno") int boardNo) {
        System.out.println("/board/delete : GET");
        employBoardService.delete(boardNo);
        return "redirect:/board/list";
    }
    // 5. 글 상세보기 요청 (/board/detail : GET)
    @GetMapping("/detail")
    public String detail(int bno,@ModelAttribute("s") Search search, Model model) {
        System.out.println("/board/detail : GET");
        BoardDetailResponseDTO detail = employBoardService.getDetail(bno);
        model.addAttribute("b", detail);

        return "board/detail";
    }





}
