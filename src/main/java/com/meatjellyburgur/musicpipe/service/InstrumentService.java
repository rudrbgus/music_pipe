package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.dto.request.UserInstrumentRequestDTO;
import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import com.meatjellyburgur.musicpipe.repository.PersonalAbilityMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class InstrumentService {
    private final PersonalAbilityMapper mapper;

    public PersonalAbility getPersonalAbility(int userId){
        PersonalAbility one = mapper.findOne(userId);
        return one;
    }

    public void addPersonalAbility(int userId, UserInstrumentRequestDTO dto){
        PersonalAbility one = mapper.find(userId);
        System.out.println(one.toString());
        if(one.getEquipmentId() != dto.getInstrumentId()){
            boolean save = mapper.save(PersonalAbility.builder()
                    .userId(userId)
                    .equipmentId(dto.getInstrumentId())
                    .ability("초보")
                    .build());
        }
    }

    public void modifyPersonalAbility(int userId){

    }
}
