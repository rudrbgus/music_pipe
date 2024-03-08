package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import com.meatjellyburgur.musicpipe.repository.PersonalAbilityMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PersonalAbilityService {
    private final PersonalAbilityMapper personalAbilityMapper;
    public PersonalAbility findEquipmentIdByUserId(int userId) {
        return personalAbilityMapper.findOne(userId);
    }
    public List<PersonalAbility> findAllEquipmentByUserId(int userId){return personalAbilityMapper.findPersonalAbilityList(userId);}
}
