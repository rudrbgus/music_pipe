package com.meatjellyburgur.musicpipe.dto.response;

import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Setter @Getter
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class FindUserResponseDTO {
    private String nickname;
    private String email;
    private int age;
    private String sex;
    private LocalDateTime regDate;
    private int teamId;
    private String userProfileImagePath;
    private String introduceText;
    private List<Integer> equipmentList;
    private String teamName;
}
