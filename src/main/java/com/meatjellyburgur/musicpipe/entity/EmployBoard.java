package com.meatjellyburgur.musicpipe.entity;

import com.meatjellyburgur.musicpipe.dto.request.BoardWriteRequestDTO;
import lombok.*;

import java.time.LocalDateTime;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmployBoard {
    private  int boardId;
    private int userId;
    private String place;
    private int onOff;
    private String title;
    private String content;//내용
    private int viewCount; // 조회수
    private LocalDateTime regdate; // 작성일자시간

    public EmployBoard(BoardWriteRequestDTO dto) {
        this.userId= dto.getUserId();
        this.title=dto.getTitle();
        this.content=dto.getContent();
        this.regdate=LocalDateTime.now();
    }
    public EmployBoard(int userId,String title, String content,String place,int onOff) {
        this.userId=userId;
        this.title = title;
        this.content = content;
        this.place=place;
        this.onOff=onOff;


    }




}
