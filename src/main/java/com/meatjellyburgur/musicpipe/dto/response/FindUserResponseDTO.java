package com.meatjellyburgur.musicpipe.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Setter @Getter
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class FindUserResponseDTO {
    private String nickname;
    private int age;
    private String sex;
    private LocalDateTime regDate;
    private int teamId;
    private String email;
    private String userProfileImagePath;
}
