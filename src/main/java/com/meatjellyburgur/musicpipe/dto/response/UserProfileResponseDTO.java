package com.meatjellyburgur.musicpipe.dto.response;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserProfileResponseDTO {
    private String email;
    private int age;
    private String sex;
    private int team_id;
    private  String teamName;
    private String nickname;
    private String profileImagePath;
    private String introduceText;

}
