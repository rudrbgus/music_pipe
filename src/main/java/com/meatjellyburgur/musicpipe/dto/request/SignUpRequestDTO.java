package com.meatjellyburgur.musicpipe.dto.request;

import com.meatjellyburgur.musicpipe.Gender;
import com.meatjellyburgur.musicpipe.entity.User;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class SignUpRequestDTO {

    @Email
    @NotBlank
    private String email;

    @NotBlank
    private String nickname;

    @NotBlank
    private String password;

    @NotBlank
    private int age;



    //private Gender gender;
    public User toEntity(PasswordEncoder encoder){
        return User.builder()
                .email(email)
                .nickname(nickname)
                .password(encoder.encode(password))
                .age(age)
                .build();
    }


}
