package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import com.meatjellyburgur.musicpipe.repository.PersonalAbilityMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class InstrumentService {
    private PersonalAbilityMapper mapper;

    public void getPersonalAbility(int userId){
        PersonalAbility one = mapper.findOne(userId);
        System.out.println(one);
    }
}
