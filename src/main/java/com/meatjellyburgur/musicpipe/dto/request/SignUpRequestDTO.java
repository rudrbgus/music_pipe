package com.meatjellyburgur.musicpipe.dto.request;

import com.meatjellyburgur.musicpipe.entity.User;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Null;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
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

    @Null
    private String gender;



    //private Gender gender;
    public User toEntity(PasswordEncoder encoder){
        return User.builder()
                .email(email)
                .nickname(nickname)
                .password(encoder.encode(password))
                .age(age)
                .sex(gender)
                .build();
    }


}
