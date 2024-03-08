package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.repository.NeedEquipmentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class NeedEquipmentService {
    private final NeedEquipmentMapper needEquipmentMapper;

    public List<Integer> findAllNeedEquipment(int bordId){
       return needEquipmentMapper.findAllEquipmentIdByBoardId(bordId);



    }
}
