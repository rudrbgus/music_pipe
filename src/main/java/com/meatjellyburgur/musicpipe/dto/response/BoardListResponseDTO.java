package com.meatjellyburgur.musicpipe.dto.response;

import com.meatjellyburgur.musicpipe.entity.EmployBoard;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import static com.meatjellyburgur.musicpipe.dto.response.onOff.*;

//응답해서 프론트로 보내주는 DTO
public class BoardListResponseDTO {
    private  int boardId; //게시글 번호
    private int userId; //게시글쓴 유저번호
    private String place;//장소
    private String onoff;//온라인 오프라인 여부
    private String title;
    private String content;//내용
    private int viewCount; // 조회수
    private String regDateTime; // 작성일자시간

    public BoardListResponseDTO(EmployBoard employBoard) {
        this.boardId=employBoard.getBoard_id();
        this.userId=employBoard.getUser_id();
        this.place=employBoard.getPlace();
        this.onoff=changeOnOff(employBoard.getOn_off());
        this.content= makeShortContent(employBoard.getContent());
        this.title=makeShortTitle(employBoard.getTitle());
        this.regDateTime=makePrettierDateString(employBoard.getRegDateTime());
    }

    //온라인 오프라인 여부에 따라 라벨로 (온라인/오프라인) 보여주는것
    private String changeOnOff(int onOff) {

        if(onOff==0){
            return ONLINE.label;
        }
        return OFFlLINE.label;
    }

    static String makePrettierDateString(LocalDateTime regDateTime) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(regDateTime);
    }

    private String makeShortContent(String originContent) {
        return sliceString(originContent, 30);
    }


    private String makeShortTitle(String originTitle) {
        return sliceString(originTitle, 7);
    }
    private static String sliceString(String targetString, int wishLength) {
        return (targetString.length() > wishLength)
                ? targetString.substring(0, wishLength) + "..."
                : targetString
                ;
    }


}
