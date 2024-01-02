package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;

import static com.meatjellyburgur.musicpipe.entity.Sex.Female;
import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest

class UserMapperTest {
    @Autowired
    UserMapper mapper;
    @Autowired
    PasswordEncoder encoder;


    @Test
    @DisplayName("User 양식을 넣으면 회원가입이 된다")
    void saveTest(){
        User user = User.builder()
                .age(13)
                .sex(String.valueOf(Female))
                .email("aaa@naver.com")
                .nickname("나가")
                .password("aaa1234")
                .build();
        boolean flag = mapper.save(user);
        assertTrue(flag);
    }

    @Test
    @DisplayName("User 100개를 넣으면 100개가 조회된다")
    void saveAllTest(){
        for (int i = 0; i < 100; i++) {
            User male = User.builder()
                    .sex("Male")
                    .age(i)
                    .email("test" + i + "@naver.com")
                    .nickname("test" + i)
                    .password("1234")
                    .build();
            mapper.save(male);
        }
        assertEquals(100, mapper.findUseByTeamId(0).size());
    }

    @Test
    @DisplayName("유저아이디 202을 주면 유저를 찾아내고 그 유저 닉네임이 test0 이다")
    void findUserByUserId(){
        //given
        int userId = 202;
        // when
        User userByUserId = mapper.findUserByUserId(userId);

        System.out.println(userByUserId);
        assertEquals("test0", userByUserId.getNickname());
    }

    @Test
    @DisplayName("db에 있는 이메일을 입력하면, user 정보가 나온다")
    void findUserTest(){
        String email="aaa@naver.com";
        User user = mapper.findUser(email);
        System.out.println(user);
    }



    @Test
    @DisplayName("닉네임이 '나가' 경우 결과값은 false 이여야한다")
    void duplicateTest () {
        //given
        String acc="나가";
        //when
        boolean flag = mapper.isDuplicate("nickname",acc);

        //then
        assertTrue(flag);
    }
    @Test
    @DisplayName("이메일이 bbb@naver.com 경우 결과값은 false 이여야한다")
    void duplicateEmailTest () {
        //given
        String acc="bbb@naver.com";
        //when
        boolean flag = mapper.isDuplicate("email",acc);

        //then
        assertFalse(flag);
    }

}