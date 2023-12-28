package com.meatjellyburgur.musicpipe.dto.request;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignInRequestDTO {
    private String email;
    private String password;
    private boolean autoLogin;
}
