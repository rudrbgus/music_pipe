package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static com.meatjellyburgur.musicpipe.entity.Sex.Female;
import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest

class UserMapperTest {
    @Autowired
    UserMapper mapper;


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

}