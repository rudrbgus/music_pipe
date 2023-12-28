package com.meatjellyburgur.musicpipe.dto.request;

import com.meatjellyburgur.musicpipe.entity.User;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignUpRequestDTO {

    @Email
    @NotBlank
    private String email;

    @NotBlank
    @Size(min = 2 , max = 12)
    private String nickname;

    @NotBlank
    @Size(min = 6 , max = 150)
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
