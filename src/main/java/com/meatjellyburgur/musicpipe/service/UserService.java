package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.dto.request.SignInRequestDTO;
import com.meatjellyburgur.musicpipe.dto.request.SignUpRequestDTO;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import static com.meatjellyburgur.musicpipe.service.SigninResult.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserMapper userMapper;
    private final PasswordEncoder encoder;

    public User getUser(String email) {
        // 여기서 찾기
        User user = userMapper.findUser(email);
        return user;
    }

    public boolean join(SignUpRequestDTO dto) {
        return userMapper.save(dto.toEntity(encoder));

    }

    // 로그인 검증 처라
    public SigninResult authenticate(SignInRequestDTO dto) {
        User foundUser = getUser(dto.getEmail());
        System.out.println(dto.getEmail());
        // 회원가입 안한 상태
        if(foundUser == null){
            log.info("회원가입이 필요합니다.");
            return NO_ACC;
        }

        if (!encoder.matches(dto.getPassword(), foundUser.getPassword())) {
            log.info("비밀번호가 일치하지 않습니다!");
            return NO_PW;
        }

        // 자동 로그인 처리

        return SUCCESS;
    }
}
