package com.meatjellyburgur.musicpipe.dto.response;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
public class SignInUserResponseDTO {
    private int userId;
    private String email;
    private String nickname;
    private String sex;
    private int age;
    private String profileImagePath;
}
