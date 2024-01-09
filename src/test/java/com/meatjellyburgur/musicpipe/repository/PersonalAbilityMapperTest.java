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



    @Test
    @DisplayName("10개의 값을 넣으면 10개가 조회된다")
    void saveTestAndFindAllTest() {
        //given

        //when
        for (int i = 39; i < 139; i++) {
            PersonalAbility build = PersonalAbility.builder()
                    .userId(i)
                    .equipmentId(1)
                    .build();
            mapper.save(build);
        }

        //then
        List<PersonalAbility> all = mapper.findAll();

        assertEquals(10, all.size());
    }



    @Test
    @DisplayName("악기를 주면 유저아이디를 뱉어")
    void findUserIdByInstrumentIdTest(){
        // given
        int instrumentId = 1;
        //when
        List<Integer> userId = mapper.findUserIdByEquipmentId(instrumentId);
        //then
        assertEquals(10, userId.size());

    }

}