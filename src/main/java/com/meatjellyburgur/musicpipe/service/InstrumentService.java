package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.dto.request.UserInstrumentRequestDTO;
import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import com.meatjellyburgur.musicpipe.repository.PersonalAbilityMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class InstrumentService {
    private final PersonalAbilityMapper mapper;


    public boolean addPersonalAbility(int userId, UserInstrumentRequestDTO dto) {
        // 중복인지 검증
        boolean duplicate = mapper.isDuplicate(userId, dto.getInstrumentId());

        //중복이면 수정 메서드로 이동
        if(duplicate){
            modifyPersonalAbility(userId, dto);
        }else{
            boolean save = mapper.save(PersonalAbility.builder()
                    .userId(userId)
                    .equipmentId(dto.getInstrumentId())
                    .ability("초보")
                    .build());
            return save;
        }


        return false;
    }

    public boolean modifyPersonalAbility(int userId, UserInstrumentRequestDTO dto) {
        log.info("수정으로 옴");
        return false;
    }
    public boolean removePersonalAbility(int userId, UserInstrumentRequestDTO dto){

        return mapper.remove(PersonalAbility.builder()
                .ability("123")
                .userId(userId)
                .equipmentId(dto.getInstrumentId())
                .build());
    }

    public List<PersonalAbility> findPersonalAbilityList(int userId){
        List<PersonalAbility> personalAbilityList = mapper.findPersonalAbilityList(userId);
        return personalAbilityList;
    }
}
