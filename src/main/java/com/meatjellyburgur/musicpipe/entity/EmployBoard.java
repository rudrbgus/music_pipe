package com.meatjellyburgur.musicpipe.entity;

import lombok.*;

import java.time.LocalDateTime;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmployBoard {
    private  int board_id;
    private int user_id;
    private String place;
    private int on_off;
    private String title;
    private String content;//내용
    private int viewCount; // 조회수
    private LocalDateTime regDateTime; // 작성일자시간


}
