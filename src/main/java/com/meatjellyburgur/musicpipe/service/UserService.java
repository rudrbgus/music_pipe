package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.dto.request.SignInRequestDTO;
import com.meatjellyburgur.musicpipe.dto.request.SignUpRequestDTO;
import com.meatjellyburgur.musicpipe.dto.response.SignInUserResponseDTO;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.repository.UserMapper;
import com.meatjellyburgur.musicpipe.util.SignInUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;

import static com.meatjellyburgur.musicpipe.service.SigninResult.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserMapper userMapper;
    private final PasswordEncoder encoder;

    // 이메일 주면 해당하는 유저 보내줌
    public User getUser(String email) {
        // 여기서 찾기
        User user = userMapper.findUser(email);
        return user;
    }

    // 회원가입
    public boolean join(SignUpRequestDTO dto) {
        return userMapper.save(dto.toEntity(encoder));

    }

    // 로그인 검증 처라
    public SigninResult authenticate(SignInRequestDTO dto, HttpServletRequest request, HttpServletResponse response) {
        User foundUser = getUser(dto.getEmail());
        System.out.println(dto.getEmail());
        // 회원가입 안한 상태
        if (foundUser == null) {
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

    // 유저 클라이언트에 session에 dto 넣어줌
    public void maintainLoginState(HttpSession session, String email) {
        User user = getUser(email);
        SignInUserResponseDTO dto = SignInUserResponseDTO.builder()
                .userId(user.getUserId())
                .age(user.getAge())
                .email(user.getEmail())
                .gender(user.getSex())
                .nickname(user.getNickname())
                .build();
        session.setAttribute(SignInUtils.LOGIN_KEY, dto);
        session.setMaxInactiveInterval(60 * 60);
    }

    // 이메일, 아이디 중복검사
    public boolean duplicate(String type, String keyword) {
        boolean duplicate = userMapper.isDuplicate(type, keyword);
        return duplicate;
    }

    public List<User> findAllUserByTeamId(int teamId){
        return userMapper.findUseByTeamId(teamId);
    }
}
