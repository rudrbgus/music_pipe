package com.meatjellyburgur.musicpipe.dto.response;

import com.meatjellyburgur.musicpipe.entity.EmployBoard;
import com.meatjellyburgur.musicpipe.entity.User;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@Setter
public class BoardDetailResponseDTO {
//    private final int boardId;
    private final String title;
    private final String content;
    private final int userId;
    private final int onOff;
//    private final  String regDate;
//    private  String nickname;


    public BoardDetailResponseDTO (EmployBoard board, User user){
//        this.boardId= board.getBoardId();
        this.title=board.getTitle();
        this.content=board.getContent();
        this.userId=board.getUserId();
        this.onOff= board.getOnOff();
//        this.regDate=BoardListResponseDTO.makePrettierDateString(board.getRegdate());
//        this.nickname= user.getNickname();
    }
}
