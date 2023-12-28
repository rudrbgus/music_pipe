package com.meatjellyburgur.musicpipe.entity;


import lombok.*;

import java.time.LocalDateTime;

@Getter @ToString
@AllArgsConstructor
@Builder
@EqualsAndHashCode
//DB에 처리할때 사용하는 =>  테이블구조랑 똑같이 만들어야함
public class User {
    private int userId;
    private String password;
    private String nickname;
    private int age;
    private String email;
    private String sex;
    private LocalDateTime regdate;
    private int teamId;

}
