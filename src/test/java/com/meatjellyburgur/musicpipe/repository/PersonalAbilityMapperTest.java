package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PersonalAbilityMapperTest {

    @Autowired
    PersonalAbilityMapper mapper;


    @Transactional
    @Rollback
    @Test
    @DisplayName("1개의 값을 넣으면 1개가 조회된다")
    void saveTestAndFindAllTest() {
        //given
        PersonalAbility build = PersonalAbility.builder().userId(11)
                .equipmentId(3)
                .ability("고수")
                .build();
        //when
        mapper.save(build);


        //then
        List<PersonalAbility> all = mapper.findAll();

        assertEquals(1, all.size());
    }

    @Test
    @DisplayName("유저 아이디를 주면 해당하는 능력을 줌")
    void findOneTest() {
        //given
        int userId = 4;
        //when
        PersonalAbility one = mapper.findOne(userId);
        //then
        System.out.println(one);
        assertNotNull(one);
    }


}